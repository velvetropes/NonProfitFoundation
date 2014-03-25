function Swipe(container, options) {
    "use strict";
    function setup() {
        slides = element.children, slidePos = new Array(slides.length), width = container.getBoundingClientRect().width || container.offsetWidth, 
        element.style.width = slides.length * width + "px";
        for (var pos = slides.length; pos--; ) {
            var slide = slides[pos];
            slide.style.width = width + "px", slide.setAttribute("data-index", pos), browser.transitions && (slide.style.left = pos * -width + "px", 
            move(pos, index > pos ? -width : pos > index ? width : 0, 0));
        }
        browser.transitions || (element.style.left = index * -width + "px"), container.style.visibility = "visible";
    }
    function prev() {
        index ? slide(index - 1) : options.continuous && slide(slides.length - 1);
    }
    function next() {
        index < slides.length - 1 ? slide(index + 1) : options.continuous && slide(0);
    }
    function slide(to, slideSpeed) {
        if (index != to) {
            if (browser.transitions) {
                for (var diff = Math.abs(index - to) - 1, direction = Math.abs(index - to) / (index - to); diff--; ) move((to > index ? to : index) - diff - 1, width * direction, 0);
                move(index, width * direction, slideSpeed || speed), move(to, 0, slideSpeed || speed);
            } else animate(index * -width, to * -width, slideSpeed || speed);
            index = to, offloadFn(options.callback && options.callback(index, slides[index]));
        }
    }
    function move(index, dist, speed) {
        translate(index, dist, speed), slidePos[index] = dist;
    }
    function translate(index, dist, speed) {
        var slide = slides[index], style = slide && slide.style;
        style && (style.webkitTransitionDuration = style.MozTransitionDuration = style.msTransitionDuration = style.OTransitionDuration = style.transitionDuration = speed + "ms", 
        style.webkitTransform = "translate(" + dist + "px,0)translateZ(0)", style.msTransform = style.MozTransform = style.OTransform = "translateX(" + dist + "px)");
    }
    function animate(from, to, speed) {
        if (!speed) return void (element.style.left = to + "px");
        var start = +new Date(), timer = setInterval(function() {
            var timeElap = +new Date() - start;
            return timeElap > speed ? (element.style.left = to + "px", delay && begin(), options.transitionEnd && options.transitionEnd.call(event, index, slides[index]), 
            void clearInterval(timer)) : void (element.style.left = (to - from) * (Math.floor(timeElap / speed * 100) / 100) + from + "px");
        }, 4);
    }
    function begin() {
        interval = setTimeout(next, delay);
    }
    function stop() {
        delay = 0, clearTimeout(interval);
    }
    var noop = function() {}, offloadFn = function(fn) {
        setTimeout(fn || noop, 0);
    }, browser = {
        addEventListener: !!window.addEventListener,
        touch: "ontouchstart" in window || window.DocumentTouch && document instanceof DocumentTouch,
        transitions: function(temp) {
            var props = [ "transformProperty", "WebkitTransform", "MozTransform", "OTransform", "msTransform" ];
            for (var i in props) if (void 0 !== temp.style[props[i]]) return !0;
            return !1;
        }(document.createElement("swipe"))
    };
    if (container) {
        var slides, slidePos, width, element = container.children[0];
        options = options || {};
        var interval, isScrolling, index = parseInt(options.startSlide, 10) || 0, speed = options.speed || 300, delay = options.auto || 0, start = {}, delta = {}, events = {
            handleEvent: function(event) {
                switch (event.type) {
                  case "touchstart":
                    this.start(event);
                    break;

                  case "touchmove":
                    this.move(event);
                    break;

                  case "touchend":
                    offloadFn(this.end(event));
                    break;

                  case "webkitTransitionEnd":
                  case "msTransitionEnd":
                  case "oTransitionEnd":
                  case "otransitionend":
                  case "transitionend":
                    offloadFn(this.transitionEnd(event));
                    break;

                  case "resize":
                    offloadFn(setup.call());
                }
                options.stopPropagation && event.stopPropagation();
            },
            start: function(event) {
                var touches = event.touches[0];
                start = {
                    x: touches.pageX,
                    y: touches.pageY,
                    time: +new Date()
                }, isScrolling = void 0, delta = {}, element.addEventListener("touchmove", this, !1), 
                element.addEventListener("touchend", this, !1);
            },
            move: function(event) {
                if (!(event.touches.length > 1 || event.scale && 1 !== event.scale)) {
                    options.disableScroll && event.preventDefault();
                    var touches = event.touches[0];
                    delta = {
                        x: touches.pageX - start.x,
                        y: touches.pageY - start.y
                    }, "undefined" == typeof isScrolling && (isScrolling = !!(isScrolling || Math.abs(delta.x) < Math.abs(delta.y))), 
                    isScrolling || (event.preventDefault(), stop(), delta.x = delta.x / (!index && delta.x > 0 || index == slides.length - 1 && delta.x < 0 ? Math.abs(delta.x) / width + 1 : 1), 
                    translate(index - 1, delta.x + slidePos[index - 1], 0), translate(index, delta.x + slidePos[index], 0), 
                    translate(index + 1, delta.x + slidePos[index + 1], 0));
                }
            },
            end: function() {
                var duration = +new Date() - start.time, isValidSlide = Number(duration) < 250 && Math.abs(delta.x) > 20 || Math.abs(delta.x) > width / 2, isPastBounds = !index && delta.x > 0 || index == slides.length - 1 && delta.x < 0, direction = delta.x < 0;
                isScrolling || (isValidSlide && !isPastBounds ? (direction ? (move(index - 1, -width, 0), 
                move(index, slidePos[index] - width, speed), move(index + 1, slidePos[index + 1] - width, speed), 
                index += 1) : (move(index + 1, width, 0), move(index, slidePos[index] + width, speed), 
                move(index - 1, slidePos[index - 1] + width, speed), index += -1), options.callback && options.callback(index, slides[index])) : (move(index - 1, -width, speed), 
                move(index, 0, speed), move(index + 1, width, speed))), element.removeEventListener("touchmove", events, !1), 
                element.removeEventListener("touchend", events, !1);
            },
            transitionEnd: function(event) {
                parseInt(event.target.getAttribute("data-index"), 10) == index && (delay && begin(), 
                options.transitionEnd && options.transitionEnd.call(event, index, slides[index]));
            }
        };
        return setup(), delay && begin(), browser.addEventListener ? (browser.touch && element.addEventListener("touchstart", events, !1), 
        browser.transitions && (element.addEventListener("webkitTransitionEnd", events, !1), 
        element.addEventListener("msTransitionEnd", events, !1), element.addEventListener("oTransitionEnd", events, !1), 
        element.addEventListener("otransitionend", events, !1), element.addEventListener("transitionend", events, !1)), 
        window.addEventListener("resize", events, !1)) : window.onresize = function() {
            setup();
        }, {
            setup: function() {
                setup();
            },
            slide: function(to, speed) {
                slide(to, speed);
            },
            prev: function() {
                stop(), prev();
            },
            next: function() {
                stop(), next();
            },
            getPos: function() {
                return index;
            },
            stop: function() {
                stop();
            },
            kill: function() {
                stop(), element.style.width = "auto", element.style.left = 0;
                for (var pos = slides.length; pos--; ) {
                    var slide = slides[pos];
                    slide.style.width = "100%", slide.style.left = 0, browser.transitions && translate(pos, 0, 0);
                }
                browser.addEventListener ? (element.removeEventListener("touchstart", events, !1), 
                element.removeEventListener("webkitTransitionEnd", events, !1), element.removeEventListener("msTransitionEnd", events, !1), 
                element.removeEventListener("oTransitionEnd", events, !1), element.removeEventListener("otransitionend", events, !1), 
                element.removeEventListener("transitionend", events, !1), window.removeEventListener("resize", events, !1)) : window.onresize = null;
            }
        };
    }
}

!function(window, undefined) {
    function isArraylike(obj) {
        var length = obj.length, type = jQuery.type(obj);
        return jQuery.isWindow(obj) ? !1 : 1 === obj.nodeType && length ? !0 : "array" === type || "function" !== type && (0 === length || "number" == typeof length && length > 0 && length - 1 in obj);
    }
    function createOptions(options) {
        var object = optionsCache[options] = {};
        return jQuery.each(options.match(core_rnotwhite) || [], function(_, flag) {
            object[flag] = !0;
        }), object;
    }
    function internalData(elem, name, data, pvt) {
        if (jQuery.acceptData(elem)) {
            var ret, thisCache, internalKey = jQuery.expando, isNode = elem.nodeType, cache = isNode ? jQuery.cache : elem, id = isNode ? elem[internalKey] : elem[internalKey] && internalKey;
            if (id && cache[id] && (pvt || cache[id].data) || data !== undefined || "string" != typeof name) return id || (id = isNode ? elem[internalKey] = core_deletedIds.pop() || jQuery.guid++ : internalKey), 
            cache[id] || (cache[id] = isNode ? {} : {
                toJSON: jQuery.noop
            }), ("object" == typeof name || "function" == typeof name) && (pvt ? cache[id] = jQuery.extend(cache[id], name) : cache[id].data = jQuery.extend(cache[id].data, name)), 
            thisCache = cache[id], pvt || (thisCache.data || (thisCache.data = {}), thisCache = thisCache.data), 
            data !== undefined && (thisCache[jQuery.camelCase(name)] = data), "string" == typeof name ? (ret = thisCache[name], 
            null == ret && (ret = thisCache[jQuery.camelCase(name)])) : ret = thisCache, ret;
        }
    }
    function internalRemoveData(elem, name, pvt) {
        if (jQuery.acceptData(elem)) {
            var thisCache, i, isNode = elem.nodeType, cache = isNode ? jQuery.cache : elem, id = isNode ? elem[jQuery.expando] : jQuery.expando;
            if (cache[id]) {
                if (name && (thisCache = pvt ? cache[id] : cache[id].data)) {
                    jQuery.isArray(name) ? name = name.concat(jQuery.map(name, jQuery.camelCase)) : name in thisCache ? name = [ name ] : (name = jQuery.camelCase(name), 
                    name = name in thisCache ? [ name ] : name.split(" ")), i = name.length;
                    for (;i--; ) delete thisCache[name[i]];
                    if (pvt ? !isEmptyDataObject(thisCache) : !jQuery.isEmptyObject(thisCache)) return;
                }
                (pvt || (delete cache[id].data, isEmptyDataObject(cache[id]))) && (isNode ? jQuery.cleanData([ elem ], !0) : jQuery.support.deleteExpando || cache != cache.window ? delete cache[id] : cache[id] = null);
            }
        }
    }
    function dataAttr(elem, key, data) {
        if (data === undefined && 1 === elem.nodeType) {
            var name = "data-" + key.replace(rmultiDash, "-$1").toLowerCase();
            if (data = elem.getAttribute(name), "string" == typeof data) {
                try {
                    data = "true" === data ? !0 : "false" === data ? !1 : "null" === data ? null : +data + "" === data ? +data : rbrace.test(data) ? jQuery.parseJSON(data) : data;
                } catch (e) {}
                jQuery.data(elem, key, data);
            } else data = undefined;
        }
        return data;
    }
    function isEmptyDataObject(obj) {
        var name;
        for (name in obj) if (("data" !== name || !jQuery.isEmptyObject(obj[name])) && "toJSON" !== name) return !1;
        return !0;
    }
    function returnTrue() {
        return !0;
    }
    function returnFalse() {
        return !1;
    }
    function safeActiveElement() {
        try {
            return document.activeElement;
        } catch (err) {}
    }
    function sibling(cur, dir) {
        do cur = cur[dir]; while (cur && 1 !== cur.nodeType);
        return cur;
    }
    function winnow(elements, qualifier, not) {
        if (jQuery.isFunction(qualifier)) return jQuery.grep(elements, function(elem, i) {
            return !!qualifier.call(elem, i, elem) !== not;
        });
        if (qualifier.nodeType) return jQuery.grep(elements, function(elem) {
            return elem === qualifier !== not;
        });
        if ("string" == typeof qualifier) {
            if (isSimple.test(qualifier)) return jQuery.filter(qualifier, elements, not);
            qualifier = jQuery.filter(qualifier, elements);
        }
        return jQuery.grep(elements, function(elem) {
            return jQuery.inArray(elem, qualifier) >= 0 !== not;
        });
    }
    function createSafeFragment(document) {
        var list = nodeNames.split("|"), safeFrag = document.createDocumentFragment();
        if (safeFrag.createElement) for (;list.length; ) safeFrag.createElement(list.pop());
        return safeFrag;
    }
    function manipulationTarget(elem, content) {
        return jQuery.nodeName(elem, "table") && jQuery.nodeName(1 === content.nodeType ? content : content.firstChild, "tr") ? elem.getElementsByTagName("tbody")[0] || elem.appendChild(elem.ownerDocument.createElement("tbody")) : elem;
    }
    function disableScript(elem) {
        return elem.type = (null !== jQuery.find.attr(elem, "type")) + "/" + elem.type, 
        elem;
    }
    function restoreScript(elem) {
        var match = rscriptTypeMasked.exec(elem.type);
        return match ? elem.type = match[1] : elem.removeAttribute("type"), elem;
    }
    function setGlobalEval(elems, refElements) {
        for (var elem, i = 0; null != (elem = elems[i]); i++) jQuery._data(elem, "globalEval", !refElements || jQuery._data(refElements[i], "globalEval"));
    }
    function cloneCopyEvent(src, dest) {
        if (1 === dest.nodeType && jQuery.hasData(src)) {
            var type, i, l, oldData = jQuery._data(src), curData = jQuery._data(dest, oldData), events = oldData.events;
            if (events) {
                delete curData.handle, curData.events = {};
                for (type in events) for (i = 0, l = events[type].length; l > i; i++) jQuery.event.add(dest, type, events[type][i]);
            }
            curData.data && (curData.data = jQuery.extend({}, curData.data));
        }
    }
    function fixCloneNodeIssues(src, dest) {
        var nodeName, e, data;
        if (1 === dest.nodeType) {
            if (nodeName = dest.nodeName.toLowerCase(), !jQuery.support.noCloneEvent && dest[jQuery.expando]) {
                data = jQuery._data(dest);
                for (e in data.events) jQuery.removeEvent(dest, e, data.handle);
                dest.removeAttribute(jQuery.expando);
            }
            "script" === nodeName && dest.text !== src.text ? (disableScript(dest).text = src.text, 
            restoreScript(dest)) : "object" === nodeName ? (dest.parentNode && (dest.outerHTML = src.outerHTML), 
            jQuery.support.html5Clone && src.innerHTML && !jQuery.trim(dest.innerHTML) && (dest.innerHTML = src.innerHTML)) : "input" === nodeName && manipulation_rcheckableType.test(src.type) ? (dest.defaultChecked = dest.checked = src.checked, 
            dest.value !== src.value && (dest.value = src.value)) : "option" === nodeName ? dest.defaultSelected = dest.selected = src.defaultSelected : ("input" === nodeName || "textarea" === nodeName) && (dest.defaultValue = src.defaultValue);
        }
    }
    function getAll(context, tag) {
        var elems, elem, i = 0, found = typeof context.getElementsByTagName !== core_strundefined ? context.getElementsByTagName(tag || "*") : typeof context.querySelectorAll !== core_strundefined ? context.querySelectorAll(tag || "*") : undefined;
        if (!found) for (found = [], elems = context.childNodes || context; null != (elem = elems[i]); i++) !tag || jQuery.nodeName(elem, tag) ? found.push(elem) : jQuery.merge(found, getAll(elem, tag));
        return tag === undefined || tag && jQuery.nodeName(context, tag) ? jQuery.merge([ context ], found) : found;
    }
    function fixDefaultChecked(elem) {
        manipulation_rcheckableType.test(elem.type) && (elem.defaultChecked = elem.checked);
    }
    function vendorPropName(style, name) {
        if (name in style) return name;
        for (var capName = name.charAt(0).toUpperCase() + name.slice(1), origName = name, i = cssPrefixes.length; i--; ) if (name = cssPrefixes[i] + capName, 
        name in style) return name;
        return origName;
    }
    function isHidden(elem, el) {
        return elem = el || elem, "none" === jQuery.css(elem, "display") || !jQuery.contains(elem.ownerDocument, elem);
    }
    function showHide(elements, show) {
        for (var display, elem, hidden, values = [], index = 0, length = elements.length; length > index; index++) elem = elements[index], 
        elem.style && (values[index] = jQuery._data(elem, "olddisplay"), display = elem.style.display, 
        show ? (values[index] || "none" !== display || (elem.style.display = ""), "" === elem.style.display && isHidden(elem) && (values[index] = jQuery._data(elem, "olddisplay", css_defaultDisplay(elem.nodeName)))) : values[index] || (hidden = isHidden(elem), 
        (display && "none" !== display || !hidden) && jQuery._data(elem, "olddisplay", hidden ? display : jQuery.css(elem, "display"))));
        for (index = 0; length > index; index++) elem = elements[index], elem.style && (show && "none" !== elem.style.display && "" !== elem.style.display || (elem.style.display = show ? values[index] || "" : "none"));
        return elements;
    }
    function setPositiveNumber(elem, value, subtract) {
        var matches = rnumsplit.exec(value);
        return matches ? Math.max(0, matches[1] - (subtract || 0)) + (matches[2] || "px") : value;
    }
    function augmentWidthOrHeight(elem, name, extra, isBorderBox, styles) {
        for (var i = extra === (isBorderBox ? "border" : "content") ? 4 : "width" === name ? 1 : 0, val = 0; 4 > i; i += 2) "margin" === extra && (val += jQuery.css(elem, extra + cssExpand[i], !0, styles)), 
        isBorderBox ? ("content" === extra && (val -= jQuery.css(elem, "padding" + cssExpand[i], !0, styles)), 
        "margin" !== extra && (val -= jQuery.css(elem, "border" + cssExpand[i] + "Width", !0, styles))) : (val += jQuery.css(elem, "padding" + cssExpand[i], !0, styles), 
        "padding" !== extra && (val += jQuery.css(elem, "border" + cssExpand[i] + "Width", !0, styles)));
        return val;
    }
    function getWidthOrHeight(elem, name, extra) {
        var valueIsBorderBox = !0, val = "width" === name ? elem.offsetWidth : elem.offsetHeight, styles = getStyles(elem), isBorderBox = jQuery.support.boxSizing && "border-box" === jQuery.css(elem, "boxSizing", !1, styles);
        if (0 >= val || null == val) {
            if (val = curCSS(elem, name, styles), (0 > val || null == val) && (val = elem.style[name]), 
            rnumnonpx.test(val)) return val;
            valueIsBorderBox = isBorderBox && (jQuery.support.boxSizingReliable || val === elem.style[name]), 
            val = parseFloat(val) || 0;
        }
        return val + augmentWidthOrHeight(elem, name, extra || (isBorderBox ? "border" : "content"), valueIsBorderBox, styles) + "px";
    }
    function css_defaultDisplay(nodeName) {
        var doc = document, display = elemdisplay[nodeName];
        return display || (display = actualDisplay(nodeName, doc), "none" !== display && display || (iframe = (iframe || jQuery("<iframe frameborder='0' width='0' height='0'/>").css("cssText", "display:block !important")).appendTo(doc.documentElement), 
        doc = (iframe[0].contentWindow || iframe[0].contentDocument).document, doc.write("<!doctype html><html><body>"), 
        doc.close(), display = actualDisplay(nodeName, doc), iframe.detach()), elemdisplay[nodeName] = display), 
        display;
    }
    function actualDisplay(name, doc) {
        var elem = jQuery(doc.createElement(name)).appendTo(doc.body), display = jQuery.css(elem[0], "display");
        return elem.remove(), display;
    }
    function buildParams(prefix, obj, traditional, add) {
        var name;
        if (jQuery.isArray(obj)) jQuery.each(obj, function(i, v) {
            traditional || rbracket.test(prefix) ? add(prefix, v) : buildParams(prefix + "[" + ("object" == typeof v ? i : "") + "]", v, traditional, add);
        }); else if (traditional || "object" !== jQuery.type(obj)) add(prefix, obj); else for (name in obj) buildParams(prefix + "[" + name + "]", obj[name], traditional, add);
    }
    function addToPrefiltersOrTransports(structure) {
        return function(dataTypeExpression, func) {
            "string" != typeof dataTypeExpression && (func = dataTypeExpression, dataTypeExpression = "*");
            var dataType, i = 0, dataTypes = dataTypeExpression.toLowerCase().match(core_rnotwhite) || [];
            if (jQuery.isFunction(func)) for (;dataType = dataTypes[i++]; ) "+" === dataType[0] ? (dataType = dataType.slice(1) || "*", 
            (structure[dataType] = structure[dataType] || []).unshift(func)) : (structure[dataType] = structure[dataType] || []).push(func);
        };
    }
    function inspectPrefiltersOrTransports(structure, options, originalOptions, jqXHR) {
        function inspect(dataType) {
            var selected;
            return inspected[dataType] = !0, jQuery.each(structure[dataType] || [], function(_, prefilterOrFactory) {
                var dataTypeOrTransport = prefilterOrFactory(options, originalOptions, jqXHR);
                return "string" != typeof dataTypeOrTransport || seekingTransport || inspected[dataTypeOrTransport] ? seekingTransport ? !(selected = dataTypeOrTransport) : void 0 : (options.dataTypes.unshift(dataTypeOrTransport), 
                inspect(dataTypeOrTransport), !1);
            }), selected;
        }
        var inspected = {}, seekingTransport = structure === transports;
        return inspect(options.dataTypes[0]) || !inspected["*"] && inspect("*");
    }
    function ajaxExtend(target, src) {
        var deep, key, flatOptions = jQuery.ajaxSettings.flatOptions || {};
        for (key in src) src[key] !== undefined && ((flatOptions[key] ? target : deep || (deep = {}))[key] = src[key]);
        return deep && jQuery.extend(!0, target, deep), target;
    }
    function ajaxHandleResponses(s, jqXHR, responses) {
        for (var firstDataType, ct, finalDataType, type, contents = s.contents, dataTypes = s.dataTypes; "*" === dataTypes[0]; ) dataTypes.shift(), 
        ct === undefined && (ct = s.mimeType || jqXHR.getResponseHeader("Content-Type"));
        if (ct) for (type in contents) if (contents[type] && contents[type].test(ct)) {
            dataTypes.unshift(type);
            break;
        }
        if (dataTypes[0] in responses) finalDataType = dataTypes[0]; else {
            for (type in responses) {
                if (!dataTypes[0] || s.converters[type + " " + dataTypes[0]]) {
                    finalDataType = type;
                    break;
                }
                firstDataType || (firstDataType = type);
            }
            finalDataType = finalDataType || firstDataType;
        }
        return finalDataType ? (finalDataType !== dataTypes[0] && dataTypes.unshift(finalDataType), 
        responses[finalDataType]) : void 0;
    }
    function ajaxConvert(s, response, jqXHR, isSuccess) {
        var conv2, current, conv, tmp, prev, converters = {}, dataTypes = s.dataTypes.slice();
        if (dataTypes[1]) for (conv in s.converters) converters[conv.toLowerCase()] = s.converters[conv];
        for (current = dataTypes.shift(); current; ) if (s.responseFields[current] && (jqXHR[s.responseFields[current]] = response), 
        !prev && isSuccess && s.dataFilter && (response = s.dataFilter(response, s.dataType)), 
        prev = current, current = dataTypes.shift()) if ("*" === current) current = prev; else if ("*" !== prev && prev !== current) {
            if (conv = converters[prev + " " + current] || converters["* " + current], !conv) for (conv2 in converters) if (tmp = conv2.split(" "), 
            tmp[1] === current && (conv = converters[prev + " " + tmp[0]] || converters["* " + tmp[0]])) {
                conv === !0 ? conv = converters[conv2] : converters[conv2] !== !0 && (current = tmp[0], 
                dataTypes.unshift(tmp[1]));
                break;
            }
            if (conv !== !0) if (conv && s["throws"]) response = conv(response); else try {
                response = conv(response);
            } catch (e) {
                return {
                    state: "parsererror",
                    error: conv ? e : "No conversion from " + prev + " to " + current
                };
            }
        }
        return {
            state: "success",
            data: response
        };
    }
    function createStandardXHR() {
        try {
            return new window.XMLHttpRequest();
        } catch (e) {}
    }
    function createActiveXHR() {
        try {
            return new window.ActiveXObject("Microsoft.XMLHTTP");
        } catch (e) {}
    }
    function createFxNow() {
        return setTimeout(function() {
            fxNow = undefined;
        }), fxNow = jQuery.now();
    }
    function createTween(value, prop, animation) {
        for (var tween, collection = (tweeners[prop] || []).concat(tweeners["*"]), index = 0, length = collection.length; length > index; index++) if (tween = collection[index].call(animation, prop, value)) return tween;
    }
    function Animation(elem, properties, options) {
        var result, stopped, index = 0, length = animationPrefilters.length, deferred = jQuery.Deferred().always(function() {
            delete tick.elem;
        }), tick = function() {
            if (stopped) return !1;
            for (var currentTime = fxNow || createFxNow(), remaining = Math.max(0, animation.startTime + animation.duration - currentTime), temp = remaining / animation.duration || 0, percent = 1 - temp, index = 0, length = animation.tweens.length; length > index; index++) animation.tweens[index].run(percent);
            return deferred.notifyWith(elem, [ animation, percent, remaining ]), 1 > percent && length ? remaining : (deferred.resolveWith(elem, [ animation ]), 
            !1);
        }, animation = deferred.promise({
            elem: elem,
            props: jQuery.extend({}, properties),
            opts: jQuery.extend(!0, {
                specialEasing: {}
            }, options),
            originalProperties: properties,
            originalOptions: options,
            startTime: fxNow || createFxNow(),
            duration: options.duration,
            tweens: [],
            createTween: function(prop, end) {
                var tween = jQuery.Tween(elem, animation.opts, prop, end, animation.opts.specialEasing[prop] || animation.opts.easing);
                return animation.tweens.push(tween), tween;
            },
            stop: function(gotoEnd) {
                var index = 0, length = gotoEnd ? animation.tweens.length : 0;
                if (stopped) return this;
                for (stopped = !0; length > index; index++) animation.tweens[index].run(1);
                return gotoEnd ? deferred.resolveWith(elem, [ animation, gotoEnd ]) : deferred.rejectWith(elem, [ animation, gotoEnd ]), 
                this;
            }
        }), props = animation.props;
        for (propFilter(props, animation.opts.specialEasing); length > index; index++) if (result = animationPrefilters[index].call(animation, elem, props, animation.opts)) return result;
        return jQuery.map(props, createTween, animation), jQuery.isFunction(animation.opts.start) && animation.opts.start.call(elem, animation), 
        jQuery.fx.timer(jQuery.extend(tick, {
            elem: elem,
            anim: animation,
            queue: animation.opts.queue
        })), animation.progress(animation.opts.progress).done(animation.opts.done, animation.opts.complete).fail(animation.opts.fail).always(animation.opts.always);
    }
    function propFilter(props, specialEasing) {
        var index, name, easing, value, hooks;
        for (index in props) if (name = jQuery.camelCase(index), easing = specialEasing[name], 
        value = props[index], jQuery.isArray(value) && (easing = value[1], value = props[index] = value[0]), 
        index !== name && (props[name] = value, delete props[index]), hooks = jQuery.cssHooks[name], 
        hooks && "expand" in hooks) {
            value = hooks.expand(value), delete props[name];
            for (index in value) index in props || (props[index] = value[index], specialEasing[index] = easing);
        } else specialEasing[name] = easing;
    }
    function defaultPrefilter(elem, props, opts) {
        var prop, value, toggle, tween, hooks, oldfire, anim = this, orig = {}, style = elem.style, hidden = elem.nodeType && isHidden(elem), dataShow = jQuery._data(elem, "fxshow");
        opts.queue || (hooks = jQuery._queueHooks(elem, "fx"), null == hooks.unqueued && (hooks.unqueued = 0, 
        oldfire = hooks.empty.fire, hooks.empty.fire = function() {
            hooks.unqueued || oldfire();
        }), hooks.unqueued++, anim.always(function() {
            anim.always(function() {
                hooks.unqueued--, jQuery.queue(elem, "fx").length || hooks.empty.fire();
            });
        })), 1 === elem.nodeType && ("height" in props || "width" in props) && (opts.overflow = [ style.overflow, style.overflowX, style.overflowY ], 
        "inline" === jQuery.css(elem, "display") && "none" === jQuery.css(elem, "float") && (jQuery.support.inlineBlockNeedsLayout && "inline" !== css_defaultDisplay(elem.nodeName) ? style.zoom = 1 : style.display = "inline-block")), 
        opts.overflow && (style.overflow = "hidden", jQuery.support.shrinkWrapBlocks || anim.always(function() {
            style.overflow = opts.overflow[0], style.overflowX = opts.overflow[1], style.overflowY = opts.overflow[2];
        }));
        for (prop in props) if (value = props[prop], rfxtypes.exec(value)) {
            if (delete props[prop], toggle = toggle || "toggle" === value, value === (hidden ? "hide" : "show")) continue;
            orig[prop] = dataShow && dataShow[prop] || jQuery.style(elem, prop);
        }
        if (!jQuery.isEmptyObject(orig)) {
            dataShow ? "hidden" in dataShow && (hidden = dataShow.hidden) : dataShow = jQuery._data(elem, "fxshow", {}), 
            toggle && (dataShow.hidden = !hidden), hidden ? jQuery(elem).show() : anim.done(function() {
                jQuery(elem).hide();
            }), anim.done(function() {
                var prop;
                jQuery._removeData(elem, "fxshow");
                for (prop in orig) jQuery.style(elem, prop, orig[prop]);
            });
            for (prop in orig) tween = createTween(hidden ? dataShow[prop] : 0, prop, anim), 
            prop in dataShow || (dataShow[prop] = tween.start, hidden && (tween.end = tween.start, 
            tween.start = "width" === prop || "height" === prop ? 1 : 0));
        }
    }
    function Tween(elem, options, prop, end, easing) {
        return new Tween.prototype.init(elem, options, prop, end, easing);
    }
    function genFx(type, includeWidth) {
        var which, attrs = {
            height: type
        }, i = 0;
        for (includeWidth = includeWidth ? 1 : 0; 4 > i; i += 2 - includeWidth) which = cssExpand[i], 
        attrs["margin" + which] = attrs["padding" + which] = type;
        return includeWidth && (attrs.opacity = attrs.width = type), attrs;
    }
    function getWindow(elem) {
        return jQuery.isWindow(elem) ? elem : 9 === elem.nodeType ? elem.defaultView || elem.parentWindow : !1;
    }
    var readyList, rootjQuery, core_strundefined = typeof undefined, location = window.location, document = window.document, docElem = document.documentElement, _jQuery = window.jQuery, _$ = window.$, class2type = {}, core_deletedIds = [], core_version = "1.10.2", core_concat = core_deletedIds.concat, core_push = core_deletedIds.push, core_slice = core_deletedIds.slice, core_indexOf = core_deletedIds.indexOf, core_toString = class2type.toString, core_hasOwn = class2type.hasOwnProperty, core_trim = core_version.trim, jQuery = function(selector, context) {
        return new jQuery.fn.init(selector, context, rootjQuery);
    }, core_pnum = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source, core_rnotwhite = /\S+/g, rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, rquickExpr = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/, rsingleTag = /^<(\w+)\s*\/?>(?:<\/\1>|)$/, rvalidchars = /^[\],:{}\s]*$/, rvalidbraces = /(?:^|:|,)(?:\s*\[)+/g, rvalidescape = /\\(?:["\\\/bfnrt]|u[\da-fA-F]{4})/g, rvalidtokens = /"[^"\\\r\n]*"|true|false|null|-?(?:\d+\.|)\d+(?:[eE][+-]?\d+|)/g, rmsPrefix = /^-ms-/, rdashAlpha = /-([\da-z])/gi, fcamelCase = function(all, letter) {
        return letter.toUpperCase();
    }, completed = function(event) {
        (document.addEventListener || "load" === event.type || "complete" === document.readyState) && (detach(), 
        jQuery.ready());
    }, detach = function() {
        document.addEventListener ? (document.removeEventListener("DOMContentLoaded", completed, !1), 
        window.removeEventListener("load", completed, !1)) : (document.detachEvent("onreadystatechange", completed), 
        window.detachEvent("onload", completed));
    };
    jQuery.fn = jQuery.prototype = {
        jquery: core_version,
        constructor: jQuery,
        init: function(selector, context, rootjQuery) {
            var match, elem;
            if (!selector) return this;
            if ("string" == typeof selector) {
                if (match = "<" === selector.charAt(0) && ">" === selector.charAt(selector.length - 1) && selector.length >= 3 ? [ null, selector, null ] : rquickExpr.exec(selector), 
                !match || !match[1] && context) return !context || context.jquery ? (context || rootjQuery).find(selector) : this.constructor(context).find(selector);
                if (match[1]) {
                    if (context = context instanceof jQuery ? context[0] : context, jQuery.merge(this, jQuery.parseHTML(match[1], context && context.nodeType ? context.ownerDocument || context : document, !0)), 
                    rsingleTag.test(match[1]) && jQuery.isPlainObject(context)) for (match in context) jQuery.isFunction(this[match]) ? this[match](context[match]) : this.attr(match, context[match]);
                    return this;
                }
                if (elem = document.getElementById(match[2]), elem && elem.parentNode) {
                    if (elem.id !== match[2]) return rootjQuery.find(selector);
                    this.length = 1, this[0] = elem;
                }
                return this.context = document, this.selector = selector, this;
            }
            return selector.nodeType ? (this.context = this[0] = selector, this.length = 1, 
            this) : jQuery.isFunction(selector) ? rootjQuery.ready(selector) : (selector.selector !== undefined && (this.selector = selector.selector, 
            this.context = selector.context), jQuery.makeArray(selector, this));
        },
        selector: "",
        length: 0,
        toArray: function() {
            return core_slice.call(this);
        },
        get: function(num) {
            return null == num ? this.toArray() : 0 > num ? this[this.length + num] : this[num];
        },
        pushStack: function(elems) {
            var ret = jQuery.merge(this.constructor(), elems);
            return ret.prevObject = this, ret.context = this.context, ret;
        },
        each: function(callback, args) {
            return jQuery.each(this, callback, args);
        },
        ready: function(fn) {
            return jQuery.ready.promise().done(fn), this;
        },
        slice: function() {
            return this.pushStack(core_slice.apply(this, arguments));
        },
        first: function() {
            return this.eq(0);
        },
        last: function() {
            return this.eq(-1);
        },
        eq: function(i) {
            var len = this.length, j = +i + (0 > i ? len : 0);
            return this.pushStack(j >= 0 && len > j ? [ this[j] ] : []);
        },
        map: function(callback) {
            return this.pushStack(jQuery.map(this, function(elem, i) {
                return callback.call(elem, i, elem);
            }));
        },
        end: function() {
            return this.prevObject || this.constructor(null);
        },
        push: core_push,
        sort: [].sort,
        splice: [].splice
    }, jQuery.fn.init.prototype = jQuery.fn, jQuery.extend = jQuery.fn.extend = function() {
        var src, copyIsArray, copy, name, options, clone, target = arguments[0] || {}, i = 1, length = arguments.length, deep = !1;
        for ("boolean" == typeof target && (deep = target, target = arguments[1] || {}, 
        i = 2), "object" == typeof target || jQuery.isFunction(target) || (target = {}), 
        length === i && (target = this, --i); length > i; i++) if (null != (options = arguments[i])) for (name in options) src = target[name], 
        copy = options[name], target !== copy && (deep && copy && (jQuery.isPlainObject(copy) || (copyIsArray = jQuery.isArray(copy))) ? (copyIsArray ? (copyIsArray = !1, 
        clone = src && jQuery.isArray(src) ? src : []) : clone = src && jQuery.isPlainObject(src) ? src : {}, 
        target[name] = jQuery.extend(deep, clone, copy)) : copy !== undefined && (target[name] = copy));
        return target;
    }, jQuery.extend({
        expando: "jQuery" + (core_version + Math.random()).replace(/\D/g, ""),
        noConflict: function(deep) {
            return window.$ === jQuery && (window.$ = _$), deep && window.jQuery === jQuery && (window.jQuery = _jQuery), 
            jQuery;
        },
        isReady: !1,
        readyWait: 1,
        holdReady: function(hold) {
            hold ? jQuery.readyWait++ : jQuery.ready(!0);
        },
        ready: function(wait) {
            if (wait === !0 ? !--jQuery.readyWait : !jQuery.isReady) {
                if (!document.body) return setTimeout(jQuery.ready);
                jQuery.isReady = !0, wait !== !0 && --jQuery.readyWait > 0 || (readyList.resolveWith(document, [ jQuery ]), 
                jQuery.fn.trigger && jQuery(document).trigger("ready").off("ready"));
            }
        },
        isFunction: function(obj) {
            return "function" === jQuery.type(obj);
        },
        isArray: Array.isArray || function(obj) {
            return "array" === jQuery.type(obj);
        },
        isWindow: function(obj) {
            return null != obj && obj == obj.window;
        },
        isNumeric: function(obj) {
            return !isNaN(parseFloat(obj)) && isFinite(obj);
        },
        type: function(obj) {
            return null == obj ? String(obj) : "object" == typeof obj || "function" == typeof obj ? class2type[core_toString.call(obj)] || "object" : typeof obj;
        },
        isPlainObject: function(obj) {
            var key;
            if (!obj || "object" !== jQuery.type(obj) || obj.nodeType || jQuery.isWindow(obj)) return !1;
            try {
                if (obj.constructor && !core_hasOwn.call(obj, "constructor") && !core_hasOwn.call(obj.constructor.prototype, "isPrototypeOf")) return !1;
            } catch (e) {
                return !1;
            }
            if (jQuery.support.ownLast) for (key in obj) return core_hasOwn.call(obj, key);
            for (key in obj) ;
            return key === undefined || core_hasOwn.call(obj, key);
        },
        isEmptyObject: function(obj) {
            var name;
            for (name in obj) return !1;
            return !0;
        },
        error: function(msg) {
            throw new Error(msg);
        },
        parseHTML: function(data, context, keepScripts) {
            if (!data || "string" != typeof data) return null;
            "boolean" == typeof context && (keepScripts = context, context = !1), context = context || document;
            var parsed = rsingleTag.exec(data), scripts = !keepScripts && [];
            return parsed ? [ context.createElement(parsed[1]) ] : (parsed = jQuery.buildFragment([ data ], context, scripts), 
            scripts && jQuery(scripts).remove(), jQuery.merge([], parsed.childNodes));
        },
        parseJSON: function(data) {
            return window.JSON && window.JSON.parse ? window.JSON.parse(data) : null === data ? data : "string" == typeof data && (data = jQuery.trim(data), 
            data && rvalidchars.test(data.replace(rvalidescape, "@").replace(rvalidtokens, "]").replace(rvalidbraces, ""))) ? new Function("return " + data)() : void jQuery.error("Invalid JSON: " + data);
        },
        parseXML: function(data) {
            var xml, tmp;
            if (!data || "string" != typeof data) return null;
            try {
                window.DOMParser ? (tmp = new DOMParser(), xml = tmp.parseFromString(data, "text/xml")) : (xml = new ActiveXObject("Microsoft.XMLDOM"), 
                xml.async = "false", xml.loadXML(data));
            } catch (e) {
                xml = undefined;
            }
            return xml && xml.documentElement && !xml.getElementsByTagName("parsererror").length || jQuery.error("Invalid XML: " + data), 
            xml;
        },
        noop: function() {},
        globalEval: function(data) {
            data && jQuery.trim(data) && (window.execScript || function(data) {
                window.eval.call(window, data);
            })(data);
        },
        camelCase: function(string) {
            return string.replace(rmsPrefix, "ms-").replace(rdashAlpha, fcamelCase);
        },
        nodeName: function(elem, name) {
            return elem.nodeName && elem.nodeName.toLowerCase() === name.toLowerCase();
        },
        each: function(obj, callback, args) {
            var value, i = 0, length = obj.length, isArray = isArraylike(obj);
            if (args) {
                if (isArray) for (;length > i && (value = callback.apply(obj[i], args), value !== !1); i++) ; else for (i in obj) if (value = callback.apply(obj[i], args), 
                value === !1) break;
            } else if (isArray) for (;length > i && (value = callback.call(obj[i], i, obj[i]), 
            value !== !1); i++) ; else for (i in obj) if (value = callback.call(obj[i], i, obj[i]), 
            value === !1) break;
            return obj;
        },
        trim: core_trim && !core_trim.call("﻿ ") ? function(text) {
            return null == text ? "" : core_trim.call(text);
        } : function(text) {
            return null == text ? "" : (text + "").replace(rtrim, "");
        },
        makeArray: function(arr, results) {
            var ret = results || [];
            return null != arr && (isArraylike(Object(arr)) ? jQuery.merge(ret, "string" == typeof arr ? [ arr ] : arr) : core_push.call(ret, arr)), 
            ret;
        },
        inArray: function(elem, arr, i) {
            var len;
            if (arr) {
                if (core_indexOf) return core_indexOf.call(arr, elem, i);
                for (len = arr.length, i = i ? 0 > i ? Math.max(0, len + i) : i : 0; len > i; i++) if (i in arr && arr[i] === elem) return i;
            }
            return -1;
        },
        merge: function(first, second) {
            var l = second.length, i = first.length, j = 0;
            if ("number" == typeof l) for (;l > j; j++) first[i++] = second[j]; else for (;second[j] !== undefined; ) first[i++] = second[j++];
            return first.length = i, first;
        },
        grep: function(elems, callback, inv) {
            var retVal, ret = [], i = 0, length = elems.length;
            for (inv = !!inv; length > i; i++) retVal = !!callback(elems[i], i), inv !== retVal && ret.push(elems[i]);
            return ret;
        },
        map: function(elems, callback, arg) {
            var value, i = 0, length = elems.length, isArray = isArraylike(elems), ret = [];
            if (isArray) for (;length > i; i++) value = callback(elems[i], i, arg), null != value && (ret[ret.length] = value); else for (i in elems) value = callback(elems[i], i, arg), 
            null != value && (ret[ret.length] = value);
            return core_concat.apply([], ret);
        },
        guid: 1,
        proxy: function(fn, context) {
            var args, proxy, tmp;
            return "string" == typeof context && (tmp = fn[context], context = fn, fn = tmp), 
            jQuery.isFunction(fn) ? (args = core_slice.call(arguments, 2), proxy = function() {
                return fn.apply(context || this, args.concat(core_slice.call(arguments)));
            }, proxy.guid = fn.guid = fn.guid || jQuery.guid++, proxy) : undefined;
        },
        access: function(elems, fn, key, value, chainable, emptyGet, raw) {
            var i = 0, length = elems.length, bulk = null == key;
            if ("object" === jQuery.type(key)) {
                chainable = !0;
                for (i in key) jQuery.access(elems, fn, i, key[i], !0, emptyGet, raw);
            } else if (value !== undefined && (chainable = !0, jQuery.isFunction(value) || (raw = !0), 
            bulk && (raw ? (fn.call(elems, value), fn = null) : (bulk = fn, fn = function(elem, key, value) {
                return bulk.call(jQuery(elem), value);
            })), fn)) for (;length > i; i++) fn(elems[i], key, raw ? value : value.call(elems[i], i, fn(elems[i], key)));
            return chainable ? elems : bulk ? fn.call(elems) : length ? fn(elems[0], key) : emptyGet;
        },
        now: function() {
            return new Date().getTime();
        },
        swap: function(elem, options, callback, args) {
            var ret, name, old = {};
            for (name in options) old[name] = elem.style[name], elem.style[name] = options[name];
            ret = callback.apply(elem, args || []);
            for (name in options) elem.style[name] = old[name];
            return ret;
        }
    }), jQuery.ready.promise = function(obj) {
        if (!readyList) if (readyList = jQuery.Deferred(), "complete" === document.readyState) setTimeout(jQuery.ready); else if (document.addEventListener) document.addEventListener("DOMContentLoaded", completed, !1), 
        window.addEventListener("load", completed, !1); else {
            document.attachEvent("onreadystatechange", completed), window.attachEvent("onload", completed);
            var top = !1;
            try {
                top = null == window.frameElement && document.documentElement;
            } catch (e) {}
            top && top.doScroll && !function doScrollCheck() {
                if (!jQuery.isReady) {
                    try {
                        top.doScroll("left");
                    } catch (e) {
                        return setTimeout(doScrollCheck, 50);
                    }
                    detach(), jQuery.ready();
                }
            }();
        }
        return readyList.promise(obj);
    }, jQuery.each("Boolean Number String Function Array Date RegExp Object Error".split(" "), function(i, name) {
        class2type["[object " + name + "]"] = name.toLowerCase();
    }), rootjQuery = jQuery(document), function(window, undefined) {
        function Sizzle(selector, context, results, seed) {
            var match, elem, m, nodeType, i, groups, old, nid, newContext, newSelector;
            if ((context ? context.ownerDocument || context : preferredDoc) !== document && setDocument(context), 
            context = context || document, results = results || [], !selector || "string" != typeof selector) return results;
            if (1 !== (nodeType = context.nodeType) && 9 !== nodeType) return [];
            if (documentIsHTML && !seed) {
                if (match = rquickExpr.exec(selector)) if (m = match[1]) {
                    if (9 === nodeType) {
                        if (elem = context.getElementById(m), !elem || !elem.parentNode) return results;
                        if (elem.id === m) return results.push(elem), results;
                    } else if (context.ownerDocument && (elem = context.ownerDocument.getElementById(m)) && contains(context, elem) && elem.id === m) return results.push(elem), 
                    results;
                } else {
                    if (match[2]) return push.apply(results, context.getElementsByTagName(selector)), 
                    results;
                    if ((m = match[3]) && support.getElementsByClassName && context.getElementsByClassName) return push.apply(results, context.getElementsByClassName(m)), 
                    results;
                }
                if (support.qsa && (!rbuggyQSA || !rbuggyQSA.test(selector))) {
                    if (nid = old = expando, newContext = context, newSelector = 9 === nodeType && selector, 
                    1 === nodeType && "object" !== context.nodeName.toLowerCase()) {
                        for (groups = tokenize(selector), (old = context.getAttribute("id")) ? nid = old.replace(rescape, "\\$&") : context.setAttribute("id", nid), 
                        nid = "[id='" + nid + "'] ", i = groups.length; i--; ) groups[i] = nid + toSelector(groups[i]);
                        newContext = rsibling.test(selector) && context.parentNode || context, newSelector = groups.join(",");
                    }
                    if (newSelector) try {
                        return push.apply(results, newContext.querySelectorAll(newSelector)), results;
                    } catch (qsaError) {} finally {
                        old || context.removeAttribute("id");
                    }
                }
            }
            return select(selector.replace(rtrim, "$1"), context, results, seed);
        }
        function createCache() {
            function cache(key, value) {
                return keys.push(key += " ") > Expr.cacheLength && delete cache[keys.shift()], cache[key] = value;
            }
            var keys = [];
            return cache;
        }
        function markFunction(fn) {
            return fn[expando] = !0, fn;
        }
        function assert(fn) {
            var div = document.createElement("div");
            try {
                return !!fn(div);
            } catch (e) {
                return !1;
            } finally {
                div.parentNode && div.parentNode.removeChild(div), div = null;
            }
        }
        function addHandle(attrs, handler) {
            for (var arr = attrs.split("|"), i = attrs.length; i--; ) Expr.attrHandle[arr[i]] = handler;
        }
        function siblingCheck(a, b) {
            var cur = b && a, diff = cur && 1 === a.nodeType && 1 === b.nodeType && (~b.sourceIndex || MAX_NEGATIVE) - (~a.sourceIndex || MAX_NEGATIVE);
            if (diff) return diff;
            if (cur) for (;cur = cur.nextSibling; ) if (cur === b) return -1;
            return a ? 1 : -1;
        }
        function createInputPseudo(type) {
            return function(elem) {
                var name = elem.nodeName.toLowerCase();
                return "input" === name && elem.type === type;
            };
        }
        function createButtonPseudo(type) {
            return function(elem) {
                var name = elem.nodeName.toLowerCase();
                return ("input" === name || "button" === name) && elem.type === type;
            };
        }
        function createPositionalPseudo(fn) {
            return markFunction(function(argument) {
                return argument = +argument, markFunction(function(seed, matches) {
                    for (var j, matchIndexes = fn([], seed.length, argument), i = matchIndexes.length; i--; ) seed[j = matchIndexes[i]] && (seed[j] = !(matches[j] = seed[j]));
                });
            });
        }
        function setFilters() {}
        function tokenize(selector, parseOnly) {
            var matched, match, tokens, type, soFar, groups, preFilters, cached = tokenCache[selector + " "];
            if (cached) return parseOnly ? 0 : cached.slice(0);
            for (soFar = selector, groups = [], preFilters = Expr.preFilter; soFar; ) {
                (!matched || (match = rcomma.exec(soFar))) && (match && (soFar = soFar.slice(match[0].length) || soFar), 
                groups.push(tokens = [])), matched = !1, (match = rcombinators.exec(soFar)) && (matched = match.shift(), 
                tokens.push({
                    value: matched,
                    type: match[0].replace(rtrim, " ")
                }), soFar = soFar.slice(matched.length));
                for (type in Expr.filter) !(match = matchExpr[type].exec(soFar)) || preFilters[type] && !(match = preFilters[type](match)) || (matched = match.shift(), 
                tokens.push({
                    value: matched,
                    type: type,
                    matches: match
                }), soFar = soFar.slice(matched.length));
                if (!matched) break;
            }
            return parseOnly ? soFar.length : soFar ? Sizzle.error(selector) : tokenCache(selector, groups).slice(0);
        }
        function toSelector(tokens) {
            for (var i = 0, len = tokens.length, selector = ""; len > i; i++) selector += tokens[i].value;
            return selector;
        }
        function addCombinator(matcher, combinator, base) {
            var dir = combinator.dir, checkNonElements = base && "parentNode" === dir, doneName = done++;
            return combinator.first ? function(elem, context, xml) {
                for (;elem = elem[dir]; ) if (1 === elem.nodeType || checkNonElements) return matcher(elem, context, xml);
            } : function(elem, context, xml) {
                var data, cache, outerCache, dirkey = dirruns + " " + doneName;
                if (xml) {
                    for (;elem = elem[dir]; ) if ((1 === elem.nodeType || checkNonElements) && matcher(elem, context, xml)) return !0;
                } else for (;elem = elem[dir]; ) if (1 === elem.nodeType || checkNonElements) if (outerCache = elem[expando] || (elem[expando] = {}), 
                (cache = outerCache[dir]) && cache[0] === dirkey) {
                    if ((data = cache[1]) === !0 || data === cachedruns) return data === !0;
                } else if (cache = outerCache[dir] = [ dirkey ], cache[1] = matcher(elem, context, xml) || cachedruns, 
                cache[1] === !0) return !0;
            };
        }
        function elementMatcher(matchers) {
            return matchers.length > 1 ? function(elem, context, xml) {
                for (var i = matchers.length; i--; ) if (!matchers[i](elem, context, xml)) return !1;
                return !0;
            } : matchers[0];
        }
        function condense(unmatched, map, filter, context, xml) {
            for (var elem, newUnmatched = [], i = 0, len = unmatched.length, mapped = null != map; len > i; i++) (elem = unmatched[i]) && (!filter || filter(elem, context, xml)) && (newUnmatched.push(elem), 
            mapped && map.push(i));
            return newUnmatched;
        }
        function setMatcher(preFilter, selector, matcher, postFilter, postFinder, postSelector) {
            return postFilter && !postFilter[expando] && (postFilter = setMatcher(postFilter)), 
            postFinder && !postFinder[expando] && (postFinder = setMatcher(postFinder, postSelector)), 
            markFunction(function(seed, results, context, xml) {
                var temp, i, elem, preMap = [], postMap = [], preexisting = results.length, elems = seed || multipleContexts(selector || "*", context.nodeType ? [ context ] : context, []), matcherIn = !preFilter || !seed && selector ? elems : condense(elems, preMap, preFilter, context, xml), matcherOut = matcher ? postFinder || (seed ? preFilter : preexisting || postFilter) ? [] : results : matcherIn;
                if (matcher && matcher(matcherIn, matcherOut, context, xml), postFilter) for (temp = condense(matcherOut, postMap), 
                postFilter(temp, [], context, xml), i = temp.length; i--; ) (elem = temp[i]) && (matcherOut[postMap[i]] = !(matcherIn[postMap[i]] = elem));
                if (seed) {
                    if (postFinder || preFilter) {
                        if (postFinder) {
                            for (temp = [], i = matcherOut.length; i--; ) (elem = matcherOut[i]) && temp.push(matcherIn[i] = elem);
                            postFinder(null, matcherOut = [], temp, xml);
                        }
                        for (i = matcherOut.length; i--; ) (elem = matcherOut[i]) && (temp = postFinder ? indexOf.call(seed, elem) : preMap[i]) > -1 && (seed[temp] = !(results[temp] = elem));
                    }
                } else matcherOut = condense(matcherOut === results ? matcherOut.splice(preexisting, matcherOut.length) : matcherOut), 
                postFinder ? postFinder(null, results, matcherOut, xml) : push.apply(results, matcherOut);
            });
        }
        function matcherFromTokens(tokens) {
            for (var checkContext, matcher, j, len = tokens.length, leadingRelative = Expr.relative[tokens[0].type], implicitRelative = leadingRelative || Expr.relative[" "], i = leadingRelative ? 1 : 0, matchContext = addCombinator(function(elem) {
                return elem === checkContext;
            }, implicitRelative, !0), matchAnyContext = addCombinator(function(elem) {
                return indexOf.call(checkContext, elem) > -1;
            }, implicitRelative, !0), matchers = [ function(elem, context, xml) {
                return !leadingRelative && (xml || context !== outermostContext) || ((checkContext = context).nodeType ? matchContext(elem, context, xml) : matchAnyContext(elem, context, xml));
            } ]; len > i; i++) if (matcher = Expr.relative[tokens[i].type]) matchers = [ addCombinator(elementMatcher(matchers), matcher) ]; else {
                if (matcher = Expr.filter[tokens[i].type].apply(null, tokens[i].matches), matcher[expando]) {
                    for (j = ++i; len > j && !Expr.relative[tokens[j].type]; j++) ;
                    return setMatcher(i > 1 && elementMatcher(matchers), i > 1 && toSelector(tokens.slice(0, i - 1).concat({
                        value: " " === tokens[i - 2].type ? "*" : ""
                    })).replace(rtrim, "$1"), matcher, j > i && matcherFromTokens(tokens.slice(i, j)), len > j && matcherFromTokens(tokens = tokens.slice(j)), len > j && toSelector(tokens));
                }
                matchers.push(matcher);
            }
            return elementMatcher(matchers);
        }
        function matcherFromGroupMatchers(elementMatchers, setMatchers) {
            var matcherCachedRuns = 0, bySet = setMatchers.length > 0, byElement = elementMatchers.length > 0, superMatcher = function(seed, context, xml, results, expandContext) {
                var elem, j, matcher, setMatched = [], matchedCount = 0, i = "0", unmatched = seed && [], outermost = null != expandContext, contextBackup = outermostContext, elems = seed || byElement && Expr.find.TAG("*", expandContext && context.parentNode || context), dirrunsUnique = dirruns += null == contextBackup ? 1 : Math.random() || .1;
                for (outermost && (outermostContext = context !== document && context, cachedruns = matcherCachedRuns); null != (elem = elems[i]); i++) {
                    if (byElement && elem) {
                        for (j = 0; matcher = elementMatchers[j++]; ) if (matcher(elem, context, xml)) {
                            results.push(elem);
                            break;
                        }
                        outermost && (dirruns = dirrunsUnique, cachedruns = ++matcherCachedRuns);
                    }
                    bySet && ((elem = !matcher && elem) && matchedCount--, seed && unmatched.push(elem));
                }
                if (matchedCount += i, bySet && i !== matchedCount) {
                    for (j = 0; matcher = setMatchers[j++]; ) matcher(unmatched, setMatched, context, xml);
                    if (seed) {
                        if (matchedCount > 0) for (;i--; ) unmatched[i] || setMatched[i] || (setMatched[i] = pop.call(results));
                        setMatched = condense(setMatched);
                    }
                    push.apply(results, setMatched), outermost && !seed && setMatched.length > 0 && matchedCount + setMatchers.length > 1 && Sizzle.uniqueSort(results);
                }
                return outermost && (dirruns = dirrunsUnique, outermostContext = contextBackup), 
                unmatched;
            };
            return bySet ? markFunction(superMatcher) : superMatcher;
        }
        function multipleContexts(selector, contexts, results) {
            for (var i = 0, len = contexts.length; len > i; i++) Sizzle(selector, contexts[i], results);
            return results;
        }
        function select(selector, context, results, seed) {
            var i, tokens, token, type, find, match = tokenize(selector);
            if (!seed && 1 === match.length) {
                if (tokens = match[0] = match[0].slice(0), tokens.length > 2 && "ID" === (token = tokens[0]).type && support.getById && 9 === context.nodeType && documentIsHTML && Expr.relative[tokens[1].type]) {
                    if (context = (Expr.find.ID(token.matches[0].replace(runescape, funescape), context) || [])[0], 
                    !context) return results;
                    selector = selector.slice(tokens.shift().value.length);
                }
                for (i = matchExpr.needsContext.test(selector) ? 0 : tokens.length; i-- && (token = tokens[i], 
                !Expr.relative[type = token.type]); ) if ((find = Expr.find[type]) && (seed = find(token.matches[0].replace(runescape, funescape), rsibling.test(tokens[0].type) && context.parentNode || context))) {
                    if (tokens.splice(i, 1), selector = seed.length && toSelector(tokens), !selector) return push.apply(results, seed), 
                    results;
                    break;
                }
            }
            return compile(selector, match)(seed, context, !documentIsHTML, results, rsibling.test(selector)), 
            results;
        }
        var i, support, cachedruns, Expr, getText, isXML, compile, outermostContext, sortInput, setDocument, document, docElem, documentIsHTML, rbuggyQSA, rbuggyMatches, matches, contains, expando = "sizzle" + -new Date(), preferredDoc = window.document, dirruns = 0, done = 0, classCache = createCache(), tokenCache = createCache(), compilerCache = createCache(), hasDuplicate = !1, sortOrder = function(a, b) {
            return a === b ? (hasDuplicate = !0, 0) : 0;
        }, strundefined = typeof undefined, MAX_NEGATIVE = 1 << 31, hasOwn = {}.hasOwnProperty, arr = [], pop = arr.pop, push_native = arr.push, push = arr.push, slice = arr.slice, indexOf = arr.indexOf || function(elem) {
            for (var i = 0, len = this.length; len > i; i++) if (this[i] === elem) return i;
            return -1;
        }, booleans = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped", whitespace = "[\\x20\\t\\r\\n\\f]", characterEncoding = "(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+", identifier = characterEncoding.replace("w", "w#"), attributes = "\\[" + whitespace + "*(" + characterEncoding + ")" + whitespace + "*(?:([*^$|!~]?=)" + whitespace + "*(?:(['\"])((?:\\\\.|[^\\\\])*?)\\3|(" + identifier + ")|)|)" + whitespace + "*\\]", pseudos = ":(" + characterEncoding + ")(?:\\(((['\"])((?:\\\\.|[^\\\\])*?)\\3|((?:\\\\.|[^\\\\()[\\]]|" + attributes.replace(3, 8) + ")*)|.*)\\)|)", rtrim = new RegExp("^" + whitespace + "+|((?:^|[^\\\\])(?:\\\\.)*)" + whitespace + "+$", "g"), rcomma = new RegExp("^" + whitespace + "*," + whitespace + "*"), rcombinators = new RegExp("^" + whitespace + "*([>+~]|" + whitespace + ")" + whitespace + "*"), rsibling = new RegExp(whitespace + "*[+~]"), rattributeQuotes = new RegExp("=" + whitespace + "*([^\\]'\"]*)" + whitespace + "*\\]", "g"), rpseudo = new RegExp(pseudos), ridentifier = new RegExp("^" + identifier + "$"), matchExpr = {
            ID: new RegExp("^#(" + characterEncoding + ")"),
            CLASS: new RegExp("^\\.(" + characterEncoding + ")"),
            TAG: new RegExp("^(" + characterEncoding.replace("w", "w*") + ")"),
            ATTR: new RegExp("^" + attributes),
            PSEUDO: new RegExp("^" + pseudos),
            CHILD: new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" + whitespace + "*(even|odd|(([+-]|)(\\d*)n|)" + whitespace + "*(?:([+-]|)" + whitespace + "*(\\d+)|))" + whitespace + "*\\)|)", "i"),
            bool: new RegExp("^(?:" + booleans + ")$", "i"),
            needsContext: new RegExp("^" + whitespace + "*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + whitespace + "*((?:-\\d)?\\d*)" + whitespace + "*\\)|)(?=[^-]|$)", "i")
        }, rnative = /^[^{]+\{\s*\[native \w/, rquickExpr = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/, rinputs = /^(?:input|select|textarea|button)$/i, rheader = /^h\d$/i, rescape = /'|\\/g, runescape = new RegExp("\\\\([\\da-f]{1,6}" + whitespace + "?|(" + whitespace + ")|.)", "ig"), funescape = function(_, escaped, escapedWhitespace) {
            var high = "0x" + escaped - 65536;
            return high !== high || escapedWhitespace ? escaped : 0 > high ? String.fromCharCode(high + 65536) : String.fromCharCode(high >> 10 | 55296, 1023 & high | 56320);
        };
        try {
            push.apply(arr = slice.call(preferredDoc.childNodes), preferredDoc.childNodes), 
            arr[preferredDoc.childNodes.length].nodeType;
        } catch (e) {
            push = {
                apply: arr.length ? function(target, els) {
                    push_native.apply(target, slice.call(els));
                } : function(target, els) {
                    for (var j = target.length, i = 0; target[j++] = els[i++]; ) ;
                    target.length = j - 1;
                }
            };
        }
        isXML = Sizzle.isXML = function(elem) {
            var documentElement = elem && (elem.ownerDocument || elem).documentElement;
            return documentElement ? "HTML" !== documentElement.nodeName : !1;
        }, support = Sizzle.support = {}, setDocument = Sizzle.setDocument = function(node) {
            var doc = node ? node.ownerDocument || node : preferredDoc, parent = doc.defaultView;
            return doc !== document && 9 === doc.nodeType && doc.documentElement ? (document = doc, 
            docElem = doc.documentElement, documentIsHTML = !isXML(doc), parent && parent.attachEvent && parent !== parent.top && parent.attachEvent("onbeforeunload", function() {
                setDocument();
            }), support.attributes = assert(function(div) {
                return div.className = "i", !div.getAttribute("className");
            }), support.getElementsByTagName = assert(function(div) {
                return div.appendChild(doc.createComment("")), !div.getElementsByTagName("*").length;
            }), support.getElementsByClassName = assert(function(div) {
                return div.innerHTML = "<div class='a'></div><div class='a i'></div>", div.firstChild.className = "i", 
                2 === div.getElementsByClassName("i").length;
            }), support.getById = assert(function(div) {
                return docElem.appendChild(div).id = expando, !doc.getElementsByName || !doc.getElementsByName(expando).length;
            }), support.getById ? (Expr.find.ID = function(id, context) {
                if (typeof context.getElementById !== strundefined && documentIsHTML) {
                    var m = context.getElementById(id);
                    return m && m.parentNode ? [ m ] : [];
                }
            }, Expr.filter.ID = function(id) {
                var attrId = id.replace(runescape, funescape);
                return function(elem) {
                    return elem.getAttribute("id") === attrId;
                };
            }) : (delete Expr.find.ID, Expr.filter.ID = function(id) {
                var attrId = id.replace(runescape, funescape);
                return function(elem) {
                    var node = typeof elem.getAttributeNode !== strundefined && elem.getAttributeNode("id");
                    return node && node.value === attrId;
                };
            }), Expr.find.TAG = support.getElementsByTagName ? function(tag, context) {
                return typeof context.getElementsByTagName !== strundefined ? context.getElementsByTagName(tag) : void 0;
            } : function(tag, context) {
                var elem, tmp = [], i = 0, results = context.getElementsByTagName(tag);
                if ("*" === tag) {
                    for (;elem = results[i++]; ) 1 === elem.nodeType && tmp.push(elem);
                    return tmp;
                }
                return results;
            }, Expr.find.CLASS = support.getElementsByClassName && function(className, context) {
                return typeof context.getElementsByClassName !== strundefined && documentIsHTML ? context.getElementsByClassName(className) : void 0;
            }, rbuggyMatches = [], rbuggyQSA = [], (support.qsa = rnative.test(doc.querySelectorAll)) && (assert(function(div) {
                div.innerHTML = "<select><option selected=''></option></select>", div.querySelectorAll("[selected]").length || rbuggyQSA.push("\\[" + whitespace + "*(?:value|" + booleans + ")"), 
                div.querySelectorAll(":checked").length || rbuggyQSA.push(":checked");
            }), assert(function(div) {
                var input = doc.createElement("input");
                input.setAttribute("type", "hidden"), div.appendChild(input).setAttribute("t", ""), 
                div.querySelectorAll("[t^='']").length && rbuggyQSA.push("[*^$]=" + whitespace + "*(?:''|\"\")"), 
                div.querySelectorAll(":enabled").length || rbuggyQSA.push(":enabled", ":disabled"), 
                div.querySelectorAll("*,:x"), rbuggyQSA.push(",.*:");
            })), (support.matchesSelector = rnative.test(matches = docElem.webkitMatchesSelector || docElem.mozMatchesSelector || docElem.oMatchesSelector || docElem.msMatchesSelector)) && assert(function(div) {
                support.disconnectedMatch = matches.call(div, "div"), matches.call(div, "[s!='']:x"), 
                rbuggyMatches.push("!=", pseudos);
            }), rbuggyQSA = rbuggyQSA.length && new RegExp(rbuggyQSA.join("|")), rbuggyMatches = rbuggyMatches.length && new RegExp(rbuggyMatches.join("|")), 
            contains = rnative.test(docElem.contains) || docElem.compareDocumentPosition ? function(a, b) {
                var adown = 9 === a.nodeType ? a.documentElement : a, bup = b && b.parentNode;
                return a === bup || !(!bup || 1 !== bup.nodeType || !(adown.contains ? adown.contains(bup) : a.compareDocumentPosition && 16 & a.compareDocumentPosition(bup)));
            } : function(a, b) {
                if (b) for (;b = b.parentNode; ) if (b === a) return !0;
                return !1;
            }, sortOrder = docElem.compareDocumentPosition ? function(a, b) {
                if (a === b) return hasDuplicate = !0, 0;
                var compare = b.compareDocumentPosition && a.compareDocumentPosition && a.compareDocumentPosition(b);
                return compare ? 1 & compare || !support.sortDetached && b.compareDocumentPosition(a) === compare ? a === doc || contains(preferredDoc, a) ? -1 : b === doc || contains(preferredDoc, b) ? 1 : sortInput ? indexOf.call(sortInput, a) - indexOf.call(sortInput, b) : 0 : 4 & compare ? -1 : 1 : a.compareDocumentPosition ? -1 : 1;
            } : function(a, b) {
                var cur, i = 0, aup = a.parentNode, bup = b.parentNode, ap = [ a ], bp = [ b ];
                if (a === b) return hasDuplicate = !0, 0;
                if (!aup || !bup) return a === doc ? -1 : b === doc ? 1 : aup ? -1 : bup ? 1 : sortInput ? indexOf.call(sortInput, a) - indexOf.call(sortInput, b) : 0;
                if (aup === bup) return siblingCheck(a, b);
                for (cur = a; cur = cur.parentNode; ) ap.unshift(cur);
                for (cur = b; cur = cur.parentNode; ) bp.unshift(cur);
                for (;ap[i] === bp[i]; ) i++;
                return i ? siblingCheck(ap[i], bp[i]) : ap[i] === preferredDoc ? -1 : bp[i] === preferredDoc ? 1 : 0;
            }, doc) : document;
        }, Sizzle.matches = function(expr, elements) {
            return Sizzle(expr, null, null, elements);
        }, Sizzle.matchesSelector = function(elem, expr) {
            if ((elem.ownerDocument || elem) !== document && setDocument(elem), expr = expr.replace(rattributeQuotes, "='$1']"), 
            !(!support.matchesSelector || !documentIsHTML || rbuggyMatches && rbuggyMatches.test(expr) || rbuggyQSA && rbuggyQSA.test(expr))) try {
                var ret = matches.call(elem, expr);
                if (ret || support.disconnectedMatch || elem.document && 11 !== elem.document.nodeType) return ret;
            } catch (e) {}
            return Sizzle(expr, document, null, [ elem ]).length > 0;
        }, Sizzle.contains = function(context, elem) {
            return (context.ownerDocument || context) !== document && setDocument(context), 
            contains(context, elem);
        }, Sizzle.attr = function(elem, name) {
            (elem.ownerDocument || elem) !== document && setDocument(elem);
            var fn = Expr.attrHandle[name.toLowerCase()], val = fn && hasOwn.call(Expr.attrHandle, name.toLowerCase()) ? fn(elem, name, !documentIsHTML) : undefined;
            return val === undefined ? support.attributes || !documentIsHTML ? elem.getAttribute(name) : (val = elem.getAttributeNode(name)) && val.specified ? val.value : null : val;
        }, Sizzle.error = function(msg) {
            throw new Error("Syntax error, unrecognized expression: " + msg);
        }, Sizzle.uniqueSort = function(results) {
            var elem, duplicates = [], j = 0, i = 0;
            if (hasDuplicate = !support.detectDuplicates, sortInput = !support.sortStable && results.slice(0), 
            results.sort(sortOrder), hasDuplicate) {
                for (;elem = results[i++]; ) elem === results[i] && (j = duplicates.push(i));
                for (;j--; ) results.splice(duplicates[j], 1);
            }
            return results;
        }, getText = Sizzle.getText = function(elem) {
            var node, ret = "", i = 0, nodeType = elem.nodeType;
            if (nodeType) {
                if (1 === nodeType || 9 === nodeType || 11 === nodeType) {
                    if ("string" == typeof elem.textContent) return elem.textContent;
                    for (elem = elem.firstChild; elem; elem = elem.nextSibling) ret += getText(elem);
                } else if (3 === nodeType || 4 === nodeType) return elem.nodeValue;
            } else for (;node = elem[i]; i++) ret += getText(node);
            return ret;
        }, Expr = Sizzle.selectors = {
            cacheLength: 50,
            createPseudo: markFunction,
            match: matchExpr,
            attrHandle: {},
            find: {},
            relative: {
                ">": {
                    dir: "parentNode",
                    first: !0
                },
                " ": {
                    dir: "parentNode"
                },
                "+": {
                    dir: "previousSibling",
                    first: !0
                },
                "~": {
                    dir: "previousSibling"
                }
            },
            preFilter: {
                ATTR: function(match) {
                    return match[1] = match[1].replace(runescape, funescape), match[3] = (match[4] || match[5] || "").replace(runescape, funescape), 
                    "~=" === match[2] && (match[3] = " " + match[3] + " "), match.slice(0, 4);
                },
                CHILD: function(match) {
                    return match[1] = match[1].toLowerCase(), "nth" === match[1].slice(0, 3) ? (match[3] || Sizzle.error(match[0]), 
                    match[4] = +(match[4] ? match[5] + (match[6] || 1) : 2 * ("even" === match[3] || "odd" === match[3])), 
                    match[5] = +(match[7] + match[8] || "odd" === match[3])) : match[3] && Sizzle.error(match[0]), 
                    match;
                },
                PSEUDO: function(match) {
                    var excess, unquoted = !match[5] && match[2];
                    return matchExpr.CHILD.test(match[0]) ? null : (match[3] && match[4] !== undefined ? match[2] = match[4] : unquoted && rpseudo.test(unquoted) && (excess = tokenize(unquoted, !0)) && (excess = unquoted.indexOf(")", unquoted.length - excess) - unquoted.length) && (match[0] = match[0].slice(0, excess), 
                    match[2] = unquoted.slice(0, excess)), match.slice(0, 3));
                }
            },
            filter: {
                TAG: function(nodeNameSelector) {
                    var nodeName = nodeNameSelector.replace(runescape, funescape).toLowerCase();
                    return "*" === nodeNameSelector ? function() {
                        return !0;
                    } : function(elem) {
                        return elem.nodeName && elem.nodeName.toLowerCase() === nodeName;
                    };
                },
                CLASS: function(className) {
                    var pattern = classCache[className + " "];
                    return pattern || (pattern = new RegExp("(^|" + whitespace + ")" + className + "(" + whitespace + "|$)")) && classCache(className, function(elem) {
                        return pattern.test("string" == typeof elem.className && elem.className || typeof elem.getAttribute !== strundefined && elem.getAttribute("class") || "");
                    });
                },
                ATTR: function(name, operator, check) {
                    return function(elem) {
                        var result = Sizzle.attr(elem, name);
                        return null == result ? "!=" === operator : operator ? (result += "", "=" === operator ? result === check : "!=" === operator ? result !== check : "^=" === operator ? check && 0 === result.indexOf(check) : "*=" === operator ? check && result.indexOf(check) > -1 : "$=" === operator ? check && result.slice(-check.length) === check : "~=" === operator ? (" " + result + " ").indexOf(check) > -1 : "|=" === operator ? result === check || result.slice(0, check.length + 1) === check + "-" : !1) : !0;
                    };
                },
                CHILD: function(type, what, argument, first, last) {
                    var simple = "nth" !== type.slice(0, 3), forward = "last" !== type.slice(-4), ofType = "of-type" === what;
                    return 1 === first && 0 === last ? function(elem) {
                        return !!elem.parentNode;
                    } : function(elem, context, xml) {
                        var cache, outerCache, node, diff, nodeIndex, start, dir = simple !== forward ? "nextSibling" : "previousSibling", parent = elem.parentNode, name = ofType && elem.nodeName.toLowerCase(), useCache = !xml && !ofType;
                        if (parent) {
                            if (simple) {
                                for (;dir; ) {
                                    for (node = elem; node = node[dir]; ) if (ofType ? node.nodeName.toLowerCase() === name : 1 === node.nodeType) return !1;
                                    start = dir = "only" === type && !start && "nextSibling";
                                }
                                return !0;
                            }
                            if (start = [ forward ? parent.firstChild : parent.lastChild ], forward && useCache) {
                                for (outerCache = parent[expando] || (parent[expando] = {}), cache = outerCache[type] || [], 
                                nodeIndex = cache[0] === dirruns && cache[1], diff = cache[0] === dirruns && cache[2], 
                                node = nodeIndex && parent.childNodes[nodeIndex]; node = ++nodeIndex && node && node[dir] || (diff = nodeIndex = 0) || start.pop(); ) if (1 === node.nodeType && ++diff && node === elem) {
                                    outerCache[type] = [ dirruns, nodeIndex, diff ];
                                    break;
                                }
                            } else if (useCache && (cache = (elem[expando] || (elem[expando] = {}))[type]) && cache[0] === dirruns) diff = cache[1]; else for (;(node = ++nodeIndex && node && node[dir] || (diff = nodeIndex = 0) || start.pop()) && ((ofType ? node.nodeName.toLowerCase() !== name : 1 !== node.nodeType) || !++diff || (useCache && ((node[expando] || (node[expando] = {}))[type] = [ dirruns, diff ]), 
                            node !== elem)); ) ;
                            return diff -= last, diff === first || diff % first === 0 && diff / first >= 0;
                        }
                    };
                },
                PSEUDO: function(pseudo, argument) {
                    var args, fn = Expr.pseudos[pseudo] || Expr.setFilters[pseudo.toLowerCase()] || Sizzle.error("unsupported pseudo: " + pseudo);
                    return fn[expando] ? fn(argument) : fn.length > 1 ? (args = [ pseudo, pseudo, "", argument ], 
                    Expr.setFilters.hasOwnProperty(pseudo.toLowerCase()) ? markFunction(function(seed, matches) {
                        for (var idx, matched = fn(seed, argument), i = matched.length; i--; ) idx = indexOf.call(seed, matched[i]), 
                        seed[idx] = !(matches[idx] = matched[i]);
                    }) : function(elem) {
                        return fn(elem, 0, args);
                    }) : fn;
                }
            },
            pseudos: {
                not: markFunction(function(selector) {
                    var input = [], results = [], matcher = compile(selector.replace(rtrim, "$1"));
                    return matcher[expando] ? markFunction(function(seed, matches, context, xml) {
                        for (var elem, unmatched = matcher(seed, null, xml, []), i = seed.length; i--; ) (elem = unmatched[i]) && (seed[i] = !(matches[i] = elem));
                    }) : function(elem, context, xml) {
                        return input[0] = elem, matcher(input, null, xml, results), !results.pop();
                    };
                }),
                has: markFunction(function(selector) {
                    return function(elem) {
                        return Sizzle(selector, elem).length > 0;
                    };
                }),
                contains: markFunction(function(text) {
                    return function(elem) {
                        return (elem.textContent || elem.innerText || getText(elem)).indexOf(text) > -1;
                    };
                }),
                lang: markFunction(function(lang) {
                    return ridentifier.test(lang || "") || Sizzle.error("unsupported lang: " + lang), 
                    lang = lang.replace(runescape, funescape).toLowerCase(), function(elem) {
                        var elemLang;
                        do if (elemLang = documentIsHTML ? elem.lang : elem.getAttribute("xml:lang") || elem.getAttribute("lang")) return elemLang = elemLang.toLowerCase(), 
                        elemLang === lang || 0 === elemLang.indexOf(lang + "-"); while ((elem = elem.parentNode) && 1 === elem.nodeType);
                        return !1;
                    };
                }),
                target: function(elem) {
                    var hash = window.location && window.location.hash;
                    return hash && hash.slice(1) === elem.id;
                },
                root: function(elem) {
                    return elem === docElem;
                },
                focus: function(elem) {
                    return elem === document.activeElement && (!document.hasFocus || document.hasFocus()) && !!(elem.type || elem.href || ~elem.tabIndex);
                },
                enabled: function(elem) {
                    return elem.disabled === !1;
                },
                disabled: function(elem) {
                    return elem.disabled === !0;
                },
                checked: function(elem) {
                    var nodeName = elem.nodeName.toLowerCase();
                    return "input" === nodeName && !!elem.checked || "option" === nodeName && !!elem.selected;
                },
                selected: function(elem) {
                    return elem.parentNode && elem.parentNode.selectedIndex, elem.selected === !0;
                },
                empty: function(elem) {
                    for (elem = elem.firstChild; elem; elem = elem.nextSibling) if (elem.nodeName > "@" || 3 === elem.nodeType || 4 === elem.nodeType) return !1;
                    return !0;
                },
                parent: function(elem) {
                    return !Expr.pseudos.empty(elem);
                },
                header: function(elem) {
                    return rheader.test(elem.nodeName);
                },
                input: function(elem) {
                    return rinputs.test(elem.nodeName);
                },
                button: function(elem) {
                    var name = elem.nodeName.toLowerCase();
                    return "input" === name && "button" === elem.type || "button" === name;
                },
                text: function(elem) {
                    var attr;
                    return "input" === elem.nodeName.toLowerCase() && "text" === elem.type && (null == (attr = elem.getAttribute("type")) || attr.toLowerCase() === elem.type);
                },
                first: createPositionalPseudo(function() {
                    return [ 0 ];
                }),
                last: createPositionalPseudo(function(matchIndexes, length) {
                    return [ length - 1 ];
                }),
                eq: createPositionalPseudo(function(matchIndexes, length, argument) {
                    return [ 0 > argument ? argument + length : argument ];
                }),
                even: createPositionalPseudo(function(matchIndexes, length) {
                    for (var i = 0; length > i; i += 2) matchIndexes.push(i);
                    return matchIndexes;
                }),
                odd: createPositionalPseudo(function(matchIndexes, length) {
                    for (var i = 1; length > i; i += 2) matchIndexes.push(i);
                    return matchIndexes;
                }),
                lt: createPositionalPseudo(function(matchIndexes, length, argument) {
                    for (var i = 0 > argument ? argument + length : argument; --i >= 0; ) matchIndexes.push(i);
                    return matchIndexes;
                }),
                gt: createPositionalPseudo(function(matchIndexes, length, argument) {
                    for (var i = 0 > argument ? argument + length : argument; ++i < length; ) matchIndexes.push(i);
                    return matchIndexes;
                })
            }
        }, Expr.pseudos.nth = Expr.pseudos.eq;
        for (i in {
            radio: !0,
            checkbox: !0,
            file: !0,
            password: !0,
            image: !0
        }) Expr.pseudos[i] = createInputPseudo(i);
        for (i in {
            submit: !0,
            reset: !0
        }) Expr.pseudos[i] = createButtonPseudo(i);
        setFilters.prototype = Expr.filters = Expr.pseudos, Expr.setFilters = new setFilters(), 
        compile = Sizzle.compile = function(selector, group) {
            var i, setMatchers = [], elementMatchers = [], cached = compilerCache[selector + " "];
            if (!cached) {
                for (group || (group = tokenize(selector)), i = group.length; i--; ) cached = matcherFromTokens(group[i]), 
                cached[expando] ? setMatchers.push(cached) : elementMatchers.push(cached);
                cached = compilerCache(selector, matcherFromGroupMatchers(elementMatchers, setMatchers));
            }
            return cached;
        }, support.sortStable = expando.split("").sort(sortOrder).join("") === expando, 
        support.detectDuplicates = hasDuplicate, setDocument(), support.sortDetached = assert(function(div1) {
            return 1 & div1.compareDocumentPosition(document.createElement("div"));
        }), assert(function(div) {
            return div.innerHTML = "<a href='#'></a>", "#" === div.firstChild.getAttribute("href");
        }) || addHandle("type|href|height|width", function(elem, name, isXML) {
            return isXML ? void 0 : elem.getAttribute(name, "type" === name.toLowerCase() ? 1 : 2);
        }), support.attributes && assert(function(div) {
            return div.innerHTML = "<input/>", div.firstChild.setAttribute("value", ""), "" === div.firstChild.getAttribute("value");
        }) || addHandle("value", function(elem, name, isXML) {
            return isXML || "input" !== elem.nodeName.toLowerCase() ? void 0 : elem.defaultValue;
        }), assert(function(div) {
            return null == div.getAttribute("disabled");
        }) || addHandle(booleans, function(elem, name, isXML) {
            var val;
            return isXML ? void 0 : (val = elem.getAttributeNode(name)) && val.specified ? val.value : elem[name] === !0 ? name.toLowerCase() : null;
        }), jQuery.find = Sizzle, jQuery.expr = Sizzle.selectors, jQuery.expr[":"] = jQuery.expr.pseudos, 
        jQuery.unique = Sizzle.uniqueSort, jQuery.text = Sizzle.getText, jQuery.isXMLDoc = Sizzle.isXML, 
        jQuery.contains = Sizzle.contains;
    }(window);
    var optionsCache = {};
    jQuery.Callbacks = function(options) {
        options = "string" == typeof options ? optionsCache[options] || createOptions(options) : jQuery.extend({}, options);
        var firing, memory, fired, firingLength, firingIndex, firingStart, list = [], stack = !options.once && [], fire = function(data) {
            for (memory = options.memory && data, fired = !0, firingIndex = firingStart || 0, 
            firingStart = 0, firingLength = list.length, firing = !0; list && firingLength > firingIndex; firingIndex++) if (list[firingIndex].apply(data[0], data[1]) === !1 && options.stopOnFalse) {
                memory = !1;
                break;
            }
            firing = !1, list && (stack ? stack.length && fire(stack.shift()) : memory ? list = [] : self.disable());
        }, self = {
            add: function() {
                if (list) {
                    var start = list.length;
                    !function add(args) {
                        jQuery.each(args, function(_, arg) {
                            var type = jQuery.type(arg);
                            "function" === type ? options.unique && self.has(arg) || list.push(arg) : arg && arg.length && "string" !== type && add(arg);
                        });
                    }(arguments), firing ? firingLength = list.length : memory && (firingStart = start, 
                    fire(memory));
                }
                return this;
            },
            remove: function() {
                return list && jQuery.each(arguments, function(_, arg) {
                    for (var index; (index = jQuery.inArray(arg, list, index)) > -1; ) list.splice(index, 1), 
                    firing && (firingLength >= index && firingLength--, firingIndex >= index && firingIndex--);
                }), this;
            },
            has: function(fn) {
                return fn ? jQuery.inArray(fn, list) > -1 : !(!list || !list.length);
            },
            empty: function() {
                return list = [], firingLength = 0, this;
            },
            disable: function() {
                return list = stack = memory = undefined, this;
            },
            disabled: function() {
                return !list;
            },
            lock: function() {
                return stack = undefined, memory || self.disable(), this;
            },
            locked: function() {
                return !stack;
            },
            fireWith: function(context, args) {
                return !list || fired && !stack || (args = args || [], args = [ context, args.slice ? args.slice() : args ], 
                firing ? stack.push(args) : fire(args)), this;
            },
            fire: function() {
                return self.fireWith(this, arguments), this;
            },
            fired: function() {
                return !!fired;
            }
        };
        return self;
    }, jQuery.extend({
        Deferred: function(func) {
            var tuples = [ [ "resolve", "done", jQuery.Callbacks("once memory"), "resolved" ], [ "reject", "fail", jQuery.Callbacks("once memory"), "rejected" ], [ "notify", "progress", jQuery.Callbacks("memory") ] ], state = "pending", promise = {
                state: function() {
                    return state;
                },
                always: function() {
                    return deferred.done(arguments).fail(arguments), this;
                },
                then: function() {
                    var fns = arguments;
                    return jQuery.Deferred(function(newDefer) {
                        jQuery.each(tuples, function(i, tuple) {
                            var action = tuple[0], fn = jQuery.isFunction(fns[i]) && fns[i];
                            deferred[tuple[1]](function() {
                                var returned = fn && fn.apply(this, arguments);
                                returned && jQuery.isFunction(returned.promise) ? returned.promise().done(newDefer.resolve).fail(newDefer.reject).progress(newDefer.notify) : newDefer[action + "With"](this === promise ? newDefer.promise() : this, fn ? [ returned ] : arguments);
                            });
                        }), fns = null;
                    }).promise();
                },
                promise: function(obj) {
                    return null != obj ? jQuery.extend(obj, promise) : promise;
                }
            }, deferred = {};
            return promise.pipe = promise.then, jQuery.each(tuples, function(i, tuple) {
                var list = tuple[2], stateString = tuple[3];
                promise[tuple[1]] = list.add, stateString && list.add(function() {
                    state = stateString;
                }, tuples[1 ^ i][2].disable, tuples[2][2].lock), deferred[tuple[0]] = function() {
                    return deferred[tuple[0] + "With"](this === deferred ? promise : this, arguments), 
                    this;
                }, deferred[tuple[0] + "With"] = list.fireWith;
            }), promise.promise(deferred), func && func.call(deferred, deferred), deferred;
        },
        when: function(subordinate) {
            var progressValues, progressContexts, resolveContexts, i = 0, resolveValues = core_slice.call(arguments), length = resolveValues.length, remaining = 1 !== length || subordinate && jQuery.isFunction(subordinate.promise) ? length : 0, deferred = 1 === remaining ? subordinate : jQuery.Deferred(), updateFunc = function(i, contexts, values) {
                return function(value) {
                    contexts[i] = this, values[i] = arguments.length > 1 ? core_slice.call(arguments) : value, 
                    values === progressValues ? deferred.notifyWith(contexts, values) : --remaining || deferred.resolveWith(contexts, values);
                };
            };
            if (length > 1) for (progressValues = new Array(length), progressContexts = new Array(length), 
            resolveContexts = new Array(length); length > i; i++) resolveValues[i] && jQuery.isFunction(resolveValues[i].promise) ? resolveValues[i].promise().done(updateFunc(i, resolveContexts, resolveValues)).fail(deferred.reject).progress(updateFunc(i, progressContexts, progressValues)) : --remaining;
            return remaining || deferred.resolveWith(resolveContexts, resolveValues), deferred.promise();
        }
    }), jQuery.support = function(support) {
        var all, a, input, select, fragment, opt, eventName, isSupported, i, div = document.createElement("div");
        if (div.setAttribute("className", "t"), div.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", 
        all = div.getElementsByTagName("*") || [], a = div.getElementsByTagName("a")[0], 
        !a || !a.style || !all.length) return support;
        select = document.createElement("select"), opt = select.appendChild(document.createElement("option")), 
        input = div.getElementsByTagName("input")[0], a.style.cssText = "top:1px;float:left;opacity:.5", 
        support.getSetAttribute = "t" !== div.className, support.leadingWhitespace = 3 === div.firstChild.nodeType, 
        support.tbody = !div.getElementsByTagName("tbody").length, support.htmlSerialize = !!div.getElementsByTagName("link").length, 
        support.style = /top/.test(a.getAttribute("style")), support.hrefNormalized = "/a" === a.getAttribute("href"), 
        support.opacity = /^0.5/.test(a.style.opacity), support.cssFloat = !!a.style.cssFloat, 
        support.checkOn = !!input.value, support.optSelected = opt.selected, support.enctype = !!document.createElement("form").enctype, 
        support.html5Clone = "<:nav></:nav>" !== document.createElement("nav").cloneNode(!0).outerHTML, 
        support.inlineBlockNeedsLayout = !1, support.shrinkWrapBlocks = !1, support.pixelPosition = !1, 
        support.deleteExpando = !0, support.noCloneEvent = !0, support.reliableMarginRight = !0, 
        support.boxSizingReliable = !0, input.checked = !0, support.noCloneChecked = input.cloneNode(!0).checked, 
        select.disabled = !0, support.optDisabled = !opt.disabled;
        try {
            delete div.test;
        } catch (e) {
            support.deleteExpando = !1;
        }
        input = document.createElement("input"), input.setAttribute("value", ""), support.input = "" === input.getAttribute("value"), 
        input.value = "t", input.setAttribute("type", "radio"), support.radioValue = "t" === input.value, 
        input.setAttribute("checked", "t"), input.setAttribute("name", "t"), fragment = document.createDocumentFragment(), 
        fragment.appendChild(input), support.appendChecked = input.checked, support.checkClone = fragment.cloneNode(!0).cloneNode(!0).lastChild.checked, 
        div.attachEvent && (div.attachEvent("onclick", function() {
            support.noCloneEvent = !1;
        }), div.cloneNode(!0).click());
        for (i in {
            submit: !0,
            change: !0,
            focusin: !0
        }) div.setAttribute(eventName = "on" + i, "t"), support[i + "Bubbles"] = eventName in window || div.attributes[eventName].expando === !1;
        div.style.backgroundClip = "content-box", div.cloneNode(!0).style.backgroundClip = "", 
        support.clearCloneStyle = "content-box" === div.style.backgroundClip;
        for (i in jQuery(support)) break;
        return support.ownLast = "0" !== i, jQuery(function() {
            var container, marginDiv, tds, divReset = "padding:0;margin:0;border:0;display:block;box-sizing:content-box;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;", body = document.getElementsByTagName("body")[0];
            body && (container = document.createElement("div"), container.style.cssText = "border:0;width:0;height:0;position:absolute;top:0;left:-9999px;margin-top:1px", 
            body.appendChild(container).appendChild(div), div.innerHTML = "<table><tr><td></td><td>t</td></tr></table>", 
            tds = div.getElementsByTagName("td"), tds[0].style.cssText = "padding:0;margin:0;border:0;display:none", 
            isSupported = 0 === tds[0].offsetHeight, tds[0].style.display = "", tds[1].style.display = "none", 
            support.reliableHiddenOffsets = isSupported && 0 === tds[0].offsetHeight, div.innerHTML = "", 
            div.style.cssText = "box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;padding:1px;border:1px;display:block;width:4px;margin-top:1%;position:absolute;top:1%;", 
            jQuery.swap(body, null != body.style.zoom ? {
                zoom: 1
            } : {}, function() {
                support.boxSizing = 4 === div.offsetWidth;
            }), window.getComputedStyle && (support.pixelPosition = "1%" !== (window.getComputedStyle(div, null) || {}).top, 
            support.boxSizingReliable = "4px" === (window.getComputedStyle(div, null) || {
                width: "4px"
            }).width, marginDiv = div.appendChild(document.createElement("div")), marginDiv.style.cssText = div.style.cssText = divReset, 
            marginDiv.style.marginRight = marginDiv.style.width = "0", div.style.width = "1px", 
            support.reliableMarginRight = !parseFloat((window.getComputedStyle(marginDiv, null) || {}).marginRight)), 
            typeof div.style.zoom !== core_strundefined && (div.innerHTML = "", div.style.cssText = divReset + "width:1px;padding:1px;display:inline;zoom:1", 
            support.inlineBlockNeedsLayout = 3 === div.offsetWidth, div.style.display = "block", 
            div.innerHTML = "<div></div>", div.firstChild.style.width = "5px", support.shrinkWrapBlocks = 3 !== div.offsetWidth, 
            support.inlineBlockNeedsLayout && (body.style.zoom = 1)), body.removeChild(container), 
            container = div = tds = marginDiv = null);
        }), all = select = fragment = opt = a = input = null, support;
    }({});
    var rbrace = /(?:\{[\s\S]*\}|\[[\s\S]*\])$/, rmultiDash = /([A-Z])/g;
    jQuery.extend({
        cache: {},
        noData: {
            applet: !0,
            embed: !0,
            object: "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
        },
        hasData: function(elem) {
            return elem = elem.nodeType ? jQuery.cache[elem[jQuery.expando]] : elem[jQuery.expando], 
            !!elem && !isEmptyDataObject(elem);
        },
        data: function(elem, name, data) {
            return internalData(elem, name, data);
        },
        removeData: function(elem, name) {
            return internalRemoveData(elem, name);
        },
        _data: function(elem, name, data) {
            return internalData(elem, name, data, !0);
        },
        _removeData: function(elem, name) {
            return internalRemoveData(elem, name, !0);
        },
        acceptData: function(elem) {
            if (elem.nodeType && 1 !== elem.nodeType && 9 !== elem.nodeType) return !1;
            var noData = elem.nodeName && jQuery.noData[elem.nodeName.toLowerCase()];
            return !noData || noData !== !0 && elem.getAttribute("classid") === noData;
        }
    }), jQuery.fn.extend({
        data: function(key, value) {
            var attrs, name, data = null, i = 0, elem = this[0];
            if (key === undefined) {
                if (this.length && (data = jQuery.data(elem), 1 === elem.nodeType && !jQuery._data(elem, "parsedAttrs"))) {
                    for (attrs = elem.attributes; i < attrs.length; i++) name = attrs[i].name, 0 === name.indexOf("data-") && (name = jQuery.camelCase(name.slice(5)), 
                    dataAttr(elem, name, data[name]));
                    jQuery._data(elem, "parsedAttrs", !0);
                }
                return data;
            }
            return "object" == typeof key ? this.each(function() {
                jQuery.data(this, key);
            }) : arguments.length > 1 ? this.each(function() {
                jQuery.data(this, key, value);
            }) : elem ? dataAttr(elem, key, jQuery.data(elem, key)) : null;
        },
        removeData: function(key) {
            return this.each(function() {
                jQuery.removeData(this, key);
            });
        }
    }), jQuery.extend({
        queue: function(elem, type, data) {
            var queue;
            return elem ? (type = (type || "fx") + "queue", queue = jQuery._data(elem, type), 
            data && (!queue || jQuery.isArray(data) ? queue = jQuery._data(elem, type, jQuery.makeArray(data)) : queue.push(data)), 
            queue || []) : void 0;
        },
        dequeue: function(elem, type) {
            type = type || "fx";
            var queue = jQuery.queue(elem, type), startLength = queue.length, fn = queue.shift(), hooks = jQuery._queueHooks(elem, type), next = function() {
                jQuery.dequeue(elem, type);
            };
            "inprogress" === fn && (fn = queue.shift(), startLength--), fn && ("fx" === type && queue.unshift("inprogress"), 
            delete hooks.stop, fn.call(elem, next, hooks)), !startLength && hooks && hooks.empty.fire();
        },
        _queueHooks: function(elem, type) {
            var key = type + "queueHooks";
            return jQuery._data(elem, key) || jQuery._data(elem, key, {
                empty: jQuery.Callbacks("once memory").add(function() {
                    jQuery._removeData(elem, type + "queue"), jQuery._removeData(elem, key);
                })
            });
        }
    }), jQuery.fn.extend({
        queue: function(type, data) {
            var setter = 2;
            return "string" != typeof type && (data = type, type = "fx", setter--), arguments.length < setter ? jQuery.queue(this[0], type) : data === undefined ? this : this.each(function() {
                var queue = jQuery.queue(this, type, data);
                jQuery._queueHooks(this, type), "fx" === type && "inprogress" !== queue[0] && jQuery.dequeue(this, type);
            });
        },
        dequeue: function(type) {
            return this.each(function() {
                jQuery.dequeue(this, type);
            });
        },
        delay: function(time, type) {
            return time = jQuery.fx ? jQuery.fx.speeds[time] || time : time, type = type || "fx", 
            this.queue(type, function(next, hooks) {
                var timeout = setTimeout(next, time);
                hooks.stop = function() {
                    clearTimeout(timeout);
                };
            });
        },
        clearQueue: function(type) {
            return this.queue(type || "fx", []);
        },
        promise: function(type, obj) {
            var tmp, count = 1, defer = jQuery.Deferred(), elements = this, i = this.length, resolve = function() {
                --count || defer.resolveWith(elements, [ elements ]);
            };
            for ("string" != typeof type && (obj = type, type = undefined), type = type || "fx"; i--; ) tmp = jQuery._data(elements[i], type + "queueHooks"), 
            tmp && tmp.empty && (count++, tmp.empty.add(resolve));
            return resolve(), defer.promise(obj);
        }
    });
    var nodeHook, boolHook, rclass = /[\t\r\n\f]/g, rreturn = /\r/g, rfocusable = /^(?:input|select|textarea|button|object)$/i, rclickable = /^(?:a|area)$/i, ruseDefault = /^(?:checked|selected)$/i, getSetAttribute = jQuery.support.getSetAttribute, getSetInput = jQuery.support.input;
    jQuery.fn.extend({
        attr: function(name, value) {
            return jQuery.access(this, jQuery.attr, name, value, arguments.length > 1);
        },
        removeAttr: function(name) {
            return this.each(function() {
                jQuery.removeAttr(this, name);
            });
        },
        prop: function(name, value) {
            return jQuery.access(this, jQuery.prop, name, value, arguments.length > 1);
        },
        removeProp: function(name) {
            return name = jQuery.propFix[name] || name, this.each(function() {
                try {
                    this[name] = undefined, delete this[name];
                } catch (e) {}
            });
        },
        addClass: function(value) {
            var classes, elem, cur, clazz, j, i = 0, len = this.length, proceed = "string" == typeof value && value;
            if (jQuery.isFunction(value)) return this.each(function(j) {
                jQuery(this).addClass(value.call(this, j, this.className));
            });
            if (proceed) for (classes = (value || "").match(core_rnotwhite) || []; len > i; i++) if (elem = this[i], 
            cur = 1 === elem.nodeType && (elem.className ? (" " + elem.className + " ").replace(rclass, " ") : " ")) {
                for (j = 0; clazz = classes[j++]; ) cur.indexOf(" " + clazz + " ") < 0 && (cur += clazz + " ");
                elem.className = jQuery.trim(cur);
            }
            return this;
        },
        removeClass: function(value) {
            var classes, elem, cur, clazz, j, i = 0, len = this.length, proceed = 0 === arguments.length || "string" == typeof value && value;
            if (jQuery.isFunction(value)) return this.each(function(j) {
                jQuery(this).removeClass(value.call(this, j, this.className));
            });
            if (proceed) for (classes = (value || "").match(core_rnotwhite) || []; len > i; i++) if (elem = this[i], 
            cur = 1 === elem.nodeType && (elem.className ? (" " + elem.className + " ").replace(rclass, " ") : "")) {
                for (j = 0; clazz = classes[j++]; ) for (;cur.indexOf(" " + clazz + " ") >= 0; ) cur = cur.replace(" " + clazz + " ", " ");
                elem.className = value ? jQuery.trim(cur) : "";
            }
            return this;
        },
        toggleClass: function(value, stateVal) {
            var type = typeof value;
            return "boolean" == typeof stateVal && "string" === type ? stateVal ? this.addClass(value) : this.removeClass(value) : this.each(jQuery.isFunction(value) ? function(i) {
                jQuery(this).toggleClass(value.call(this, i, this.className, stateVal), stateVal);
            } : function() {
                if ("string" === type) for (var className, i = 0, self = jQuery(this), classNames = value.match(core_rnotwhite) || []; className = classNames[i++]; ) self.hasClass(className) ? self.removeClass(className) : self.addClass(className); else (type === core_strundefined || "boolean" === type) && (this.className && jQuery._data(this, "__className__", this.className), 
                this.className = this.className || value === !1 ? "" : jQuery._data(this, "__className__") || "");
            });
        },
        hasClass: function(selector) {
            for (var className = " " + selector + " ", i = 0, l = this.length; l > i; i++) if (1 === this[i].nodeType && (" " + this[i].className + " ").replace(rclass, " ").indexOf(className) >= 0) return !0;
            return !1;
        },
        val: function(value) {
            var ret, hooks, isFunction, elem = this[0];
            {
                if (arguments.length) return isFunction = jQuery.isFunction(value), this.each(function(i) {
                    var val;
                    1 === this.nodeType && (val = isFunction ? value.call(this, i, jQuery(this).val()) : value, 
                    null == val ? val = "" : "number" == typeof val ? val += "" : jQuery.isArray(val) && (val = jQuery.map(val, function(value) {
                        return null == value ? "" : value + "";
                    })), hooks = jQuery.valHooks[this.type] || jQuery.valHooks[this.nodeName.toLowerCase()], 
                    hooks && "set" in hooks && hooks.set(this, val, "value") !== undefined || (this.value = val));
                });
                if (elem) return hooks = jQuery.valHooks[elem.type] || jQuery.valHooks[elem.nodeName.toLowerCase()], 
                hooks && "get" in hooks && (ret = hooks.get(elem, "value")) !== undefined ? ret : (ret = elem.value, 
                "string" == typeof ret ? ret.replace(rreturn, "") : null == ret ? "" : ret);
            }
        }
    }), jQuery.extend({
        valHooks: {
            option: {
                get: function(elem) {
                    var val = jQuery.find.attr(elem, "value");
                    return null != val ? val : elem.text;
                }
            },
            select: {
                get: function(elem) {
                    for (var value, option, options = elem.options, index = elem.selectedIndex, one = "select-one" === elem.type || 0 > index, values = one ? null : [], max = one ? index + 1 : options.length, i = 0 > index ? max : one ? index : 0; max > i; i++) if (option = options[i], 
                    !(!option.selected && i !== index || (jQuery.support.optDisabled ? option.disabled : null !== option.getAttribute("disabled")) || option.parentNode.disabled && jQuery.nodeName(option.parentNode, "optgroup"))) {
                        if (value = jQuery(option).val(), one) return value;
                        values.push(value);
                    }
                    return values;
                },
                set: function(elem, value) {
                    for (var optionSet, option, options = elem.options, values = jQuery.makeArray(value), i = options.length; i--; ) option = options[i], 
                    (option.selected = jQuery.inArray(jQuery(option).val(), values) >= 0) && (optionSet = !0);
                    return optionSet || (elem.selectedIndex = -1), values;
                }
            }
        },
        attr: function(elem, name, value) {
            var hooks, ret, nType = elem.nodeType;
            if (elem && 3 !== nType && 8 !== nType && 2 !== nType) return typeof elem.getAttribute === core_strundefined ? jQuery.prop(elem, name, value) : (1 === nType && jQuery.isXMLDoc(elem) || (name = name.toLowerCase(), 
            hooks = jQuery.attrHooks[name] || (jQuery.expr.match.bool.test(name) ? boolHook : nodeHook)), 
            value === undefined ? hooks && "get" in hooks && null !== (ret = hooks.get(elem, name)) ? ret : (ret = jQuery.find.attr(elem, name), 
            null == ret ? undefined : ret) : null !== value ? hooks && "set" in hooks && (ret = hooks.set(elem, value, name)) !== undefined ? ret : (elem.setAttribute(name, value + ""), 
            value) : void jQuery.removeAttr(elem, name));
        },
        removeAttr: function(elem, value) {
            var name, propName, i = 0, attrNames = value && value.match(core_rnotwhite);
            if (attrNames && 1 === elem.nodeType) for (;name = attrNames[i++]; ) propName = jQuery.propFix[name] || name, 
            jQuery.expr.match.bool.test(name) ? getSetInput && getSetAttribute || !ruseDefault.test(name) ? elem[propName] = !1 : elem[jQuery.camelCase("default-" + name)] = elem[propName] = !1 : jQuery.attr(elem, name, ""), 
            elem.removeAttribute(getSetAttribute ? name : propName);
        },
        attrHooks: {
            type: {
                set: function(elem, value) {
                    if (!jQuery.support.radioValue && "radio" === value && jQuery.nodeName(elem, "input")) {
                        var val = elem.value;
                        return elem.setAttribute("type", value), val && (elem.value = val), value;
                    }
                }
            }
        },
        propFix: {
            "for": "htmlFor",
            "class": "className"
        },
        prop: function(elem, name, value) {
            var ret, hooks, notxml, nType = elem.nodeType;
            if (elem && 3 !== nType && 8 !== nType && 2 !== nType) return notxml = 1 !== nType || !jQuery.isXMLDoc(elem), 
            notxml && (name = jQuery.propFix[name] || name, hooks = jQuery.propHooks[name]), 
            value !== undefined ? hooks && "set" in hooks && (ret = hooks.set(elem, value, name)) !== undefined ? ret : elem[name] = value : hooks && "get" in hooks && null !== (ret = hooks.get(elem, name)) ? ret : elem[name];
        },
        propHooks: {
            tabIndex: {
                get: function(elem) {
                    var tabindex = jQuery.find.attr(elem, "tabindex");
                    return tabindex ? parseInt(tabindex, 10) : rfocusable.test(elem.nodeName) || rclickable.test(elem.nodeName) && elem.href ? 0 : -1;
                }
            }
        }
    }), boolHook = {
        set: function(elem, value, name) {
            return value === !1 ? jQuery.removeAttr(elem, name) : getSetInput && getSetAttribute || !ruseDefault.test(name) ? elem.setAttribute(!getSetAttribute && jQuery.propFix[name] || name, name) : elem[jQuery.camelCase("default-" + name)] = elem[name] = !0, 
            name;
        }
    }, jQuery.each(jQuery.expr.match.bool.source.match(/\w+/g), function(i, name) {
        var getter = jQuery.expr.attrHandle[name] || jQuery.find.attr;
        jQuery.expr.attrHandle[name] = getSetInput && getSetAttribute || !ruseDefault.test(name) ? function(elem, name, isXML) {
            var fn = jQuery.expr.attrHandle[name], ret = isXML ? undefined : (jQuery.expr.attrHandle[name] = undefined) != getter(elem, name, isXML) ? name.toLowerCase() : null;
            return jQuery.expr.attrHandle[name] = fn, ret;
        } : function(elem, name, isXML) {
            return isXML ? undefined : elem[jQuery.camelCase("default-" + name)] ? name.toLowerCase() : null;
        };
    }), getSetInput && getSetAttribute || (jQuery.attrHooks.value = {
        set: function(elem, value, name) {
            return jQuery.nodeName(elem, "input") ? void (elem.defaultValue = value) : nodeHook && nodeHook.set(elem, value, name);
        }
    }), getSetAttribute || (nodeHook = {
        set: function(elem, value, name) {
            var ret = elem.getAttributeNode(name);
            return ret || elem.setAttributeNode(ret = elem.ownerDocument.createAttribute(name)), 
            ret.value = value += "", "value" === name || value === elem.getAttribute(name) ? value : undefined;
        }
    }, jQuery.expr.attrHandle.id = jQuery.expr.attrHandle.name = jQuery.expr.attrHandle.coords = function(elem, name, isXML) {
        var ret;
        return isXML ? undefined : (ret = elem.getAttributeNode(name)) && "" !== ret.value ? ret.value : null;
    }, jQuery.valHooks.button = {
        get: function(elem, name) {
            var ret = elem.getAttributeNode(name);
            return ret && ret.specified ? ret.value : undefined;
        },
        set: nodeHook.set
    }, jQuery.attrHooks.contenteditable = {
        set: function(elem, value, name) {
            nodeHook.set(elem, "" === value ? !1 : value, name);
        }
    }, jQuery.each([ "width", "height" ], function(i, name) {
        jQuery.attrHooks[name] = {
            set: function(elem, value) {
                return "" === value ? (elem.setAttribute(name, "auto"), value) : void 0;
            }
        };
    })), jQuery.support.hrefNormalized || jQuery.each([ "href", "src" ], function(i, name) {
        jQuery.propHooks[name] = {
            get: function(elem) {
                return elem.getAttribute(name, 4);
            }
        };
    }), jQuery.support.style || (jQuery.attrHooks.style = {
        get: function(elem) {
            return elem.style.cssText || undefined;
        },
        set: function(elem, value) {
            return elem.style.cssText = value + "";
        }
    }), jQuery.support.optSelected || (jQuery.propHooks.selected = {
        get: function(elem) {
            var parent = elem.parentNode;
            return parent && (parent.selectedIndex, parent.parentNode && parent.parentNode.selectedIndex), 
            null;
        }
    }), jQuery.each([ "tabIndex", "readOnly", "maxLength", "cellSpacing", "cellPadding", "rowSpan", "colSpan", "useMap", "frameBorder", "contentEditable" ], function() {
        jQuery.propFix[this.toLowerCase()] = this;
    }), jQuery.support.enctype || (jQuery.propFix.enctype = "encoding"), jQuery.each([ "radio", "checkbox" ], function() {
        jQuery.valHooks[this] = {
            set: function(elem, value) {
                return jQuery.isArray(value) ? elem.checked = jQuery.inArray(jQuery(elem).val(), value) >= 0 : void 0;
            }
        }, jQuery.support.checkOn || (jQuery.valHooks[this].get = function(elem) {
            return null === elem.getAttribute("value") ? "on" : elem.value;
        });
    });
    var rformElems = /^(?:input|select|textarea)$/i, rkeyEvent = /^key/, rmouseEvent = /^(?:mouse|contextmenu)|click/, rfocusMorph = /^(?:focusinfocus|focusoutblur)$/, rtypenamespace = /^([^.]*)(?:\.(.+)|)$/;
    jQuery.event = {
        global: {},
        add: function(elem, types, handler, data, selector) {
            var tmp, events, t, handleObjIn, special, eventHandle, handleObj, handlers, type, namespaces, origType, elemData = jQuery._data(elem);
            if (elemData) {
                for (handler.handler && (handleObjIn = handler, handler = handleObjIn.handler, selector = handleObjIn.selector), 
                handler.guid || (handler.guid = jQuery.guid++), (events = elemData.events) || (events = elemData.events = {}), 
                (eventHandle = elemData.handle) || (eventHandle = elemData.handle = function(e) {
                    return typeof jQuery === core_strundefined || e && jQuery.event.triggered === e.type ? undefined : jQuery.event.dispatch.apply(eventHandle.elem, arguments);
                }, eventHandle.elem = elem), types = (types || "").match(core_rnotwhite) || [ "" ], 
                t = types.length; t--; ) tmp = rtypenamespace.exec(types[t]) || [], type = origType = tmp[1], 
                namespaces = (tmp[2] || "").split(".").sort(), type && (special = jQuery.event.special[type] || {}, 
                type = (selector ? special.delegateType : special.bindType) || type, special = jQuery.event.special[type] || {}, 
                handleObj = jQuery.extend({
                    type: type,
                    origType: origType,
                    data: data,
                    handler: handler,
                    guid: handler.guid,
                    selector: selector,
                    needsContext: selector && jQuery.expr.match.needsContext.test(selector),
                    namespace: namespaces.join(".")
                }, handleObjIn), (handlers = events[type]) || (handlers = events[type] = [], handlers.delegateCount = 0, 
                special.setup && special.setup.call(elem, data, namespaces, eventHandle) !== !1 || (elem.addEventListener ? elem.addEventListener(type, eventHandle, !1) : elem.attachEvent && elem.attachEvent("on" + type, eventHandle))), 
                special.add && (special.add.call(elem, handleObj), handleObj.handler.guid || (handleObj.handler.guid = handler.guid)), 
                selector ? handlers.splice(handlers.delegateCount++, 0, handleObj) : handlers.push(handleObj), 
                jQuery.event.global[type] = !0);
                elem = null;
            }
        },
        remove: function(elem, types, handler, selector, mappedTypes) {
            var j, handleObj, tmp, origCount, t, events, special, handlers, type, namespaces, origType, elemData = jQuery.hasData(elem) && jQuery._data(elem);
            if (elemData && (events = elemData.events)) {
                for (types = (types || "").match(core_rnotwhite) || [ "" ], t = types.length; t--; ) if (tmp = rtypenamespace.exec(types[t]) || [], 
                type = origType = tmp[1], namespaces = (tmp[2] || "").split(".").sort(), type) {
                    for (special = jQuery.event.special[type] || {}, type = (selector ? special.delegateType : special.bindType) || type, 
                    handlers = events[type] || [], tmp = tmp[2] && new RegExp("(^|\\.)" + namespaces.join("\\.(?:.*\\.|)") + "(\\.|$)"), 
                    origCount = j = handlers.length; j--; ) handleObj = handlers[j], !mappedTypes && origType !== handleObj.origType || handler && handler.guid !== handleObj.guid || tmp && !tmp.test(handleObj.namespace) || selector && selector !== handleObj.selector && ("**" !== selector || !handleObj.selector) || (handlers.splice(j, 1), 
                    handleObj.selector && handlers.delegateCount--, special.remove && special.remove.call(elem, handleObj));
                    origCount && !handlers.length && (special.teardown && special.teardown.call(elem, namespaces, elemData.handle) !== !1 || jQuery.removeEvent(elem, type, elemData.handle), 
                    delete events[type]);
                } else for (type in events) jQuery.event.remove(elem, type + types[t], handler, selector, !0);
                jQuery.isEmptyObject(events) && (delete elemData.handle, jQuery._removeData(elem, "events"));
            }
        },
        trigger: function(event, data, elem, onlyHandlers) {
            var handle, ontype, cur, bubbleType, special, tmp, i, eventPath = [ elem || document ], type = core_hasOwn.call(event, "type") ? event.type : event, namespaces = core_hasOwn.call(event, "namespace") ? event.namespace.split(".") : [];
            if (cur = tmp = elem = elem || document, 3 !== elem.nodeType && 8 !== elem.nodeType && !rfocusMorph.test(type + jQuery.event.triggered) && (type.indexOf(".") >= 0 && (namespaces = type.split("."), 
            type = namespaces.shift(), namespaces.sort()), ontype = type.indexOf(":") < 0 && "on" + type, 
            event = event[jQuery.expando] ? event : new jQuery.Event(type, "object" == typeof event && event), 
            event.isTrigger = onlyHandlers ? 2 : 3, event.namespace = namespaces.join("."), 
            event.namespace_re = event.namespace ? new RegExp("(^|\\.)" + namespaces.join("\\.(?:.*\\.|)") + "(\\.|$)") : null, 
            event.result = undefined, event.target || (event.target = elem), data = null == data ? [ event ] : jQuery.makeArray(data, [ event ]), 
            special = jQuery.event.special[type] || {}, onlyHandlers || !special.trigger || special.trigger.apply(elem, data) !== !1)) {
                if (!onlyHandlers && !special.noBubble && !jQuery.isWindow(elem)) {
                    for (bubbleType = special.delegateType || type, rfocusMorph.test(bubbleType + type) || (cur = cur.parentNode); cur; cur = cur.parentNode) eventPath.push(cur), 
                    tmp = cur;
                    tmp === (elem.ownerDocument || document) && eventPath.push(tmp.defaultView || tmp.parentWindow || window);
                }
                for (i = 0; (cur = eventPath[i++]) && !event.isPropagationStopped(); ) event.type = i > 1 ? bubbleType : special.bindType || type, 
                handle = (jQuery._data(cur, "events") || {})[event.type] && jQuery._data(cur, "handle"), 
                handle && handle.apply(cur, data), handle = ontype && cur[ontype], handle && jQuery.acceptData(cur) && handle.apply && handle.apply(cur, data) === !1 && event.preventDefault();
                if (event.type = type, !onlyHandlers && !event.isDefaultPrevented() && (!special._default || special._default.apply(eventPath.pop(), data) === !1) && jQuery.acceptData(elem) && ontype && elem[type] && !jQuery.isWindow(elem)) {
                    tmp = elem[ontype], tmp && (elem[ontype] = null), jQuery.event.triggered = type;
                    try {
                        elem[type]();
                    } catch (e) {}
                    jQuery.event.triggered = undefined, tmp && (elem[ontype] = tmp);
                }
                return event.result;
            }
        },
        dispatch: function(event) {
            event = jQuery.event.fix(event);
            var i, ret, handleObj, matched, j, handlerQueue = [], args = core_slice.call(arguments), handlers = (jQuery._data(this, "events") || {})[event.type] || [], special = jQuery.event.special[event.type] || {};
            if (args[0] = event, event.delegateTarget = this, !special.preDispatch || special.preDispatch.call(this, event) !== !1) {
                for (handlerQueue = jQuery.event.handlers.call(this, event, handlers), i = 0; (matched = handlerQueue[i++]) && !event.isPropagationStopped(); ) for (event.currentTarget = matched.elem, 
                j = 0; (handleObj = matched.handlers[j++]) && !event.isImmediatePropagationStopped(); ) (!event.namespace_re || event.namespace_re.test(handleObj.namespace)) && (event.handleObj = handleObj, 
                event.data = handleObj.data, ret = ((jQuery.event.special[handleObj.origType] || {}).handle || handleObj.handler).apply(matched.elem, args), 
                ret !== undefined && (event.result = ret) === !1 && (event.preventDefault(), event.stopPropagation()));
                return special.postDispatch && special.postDispatch.call(this, event), event.result;
            }
        },
        handlers: function(event, handlers) {
            var sel, handleObj, matches, i, handlerQueue = [], delegateCount = handlers.delegateCount, cur = event.target;
            if (delegateCount && cur.nodeType && (!event.button || "click" !== event.type)) for (;cur != this; cur = cur.parentNode || this) if (1 === cur.nodeType && (cur.disabled !== !0 || "click" !== event.type)) {
                for (matches = [], i = 0; delegateCount > i; i++) handleObj = handlers[i], sel = handleObj.selector + " ", 
                matches[sel] === undefined && (matches[sel] = handleObj.needsContext ? jQuery(sel, this).index(cur) >= 0 : jQuery.find(sel, this, null, [ cur ]).length), 
                matches[sel] && matches.push(handleObj);
                matches.length && handlerQueue.push({
                    elem: cur,
                    handlers: matches
                });
            }
            return delegateCount < handlers.length && handlerQueue.push({
                elem: this,
                handlers: handlers.slice(delegateCount)
            }), handlerQueue;
        },
        fix: function(event) {
            if (event[jQuery.expando]) return event;
            var i, prop, copy, type = event.type, originalEvent = event, fixHook = this.fixHooks[type];
            for (fixHook || (this.fixHooks[type] = fixHook = rmouseEvent.test(type) ? this.mouseHooks : rkeyEvent.test(type) ? this.keyHooks : {}), 
            copy = fixHook.props ? this.props.concat(fixHook.props) : this.props, event = new jQuery.Event(originalEvent), 
            i = copy.length; i--; ) prop = copy[i], event[prop] = originalEvent[prop];
            return event.target || (event.target = originalEvent.srcElement || document), 3 === event.target.nodeType && (event.target = event.target.parentNode), 
            event.metaKey = !!event.metaKey, fixHook.filter ? fixHook.filter(event, originalEvent) : event;
        },
        props: "altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),
        fixHooks: {},
        keyHooks: {
            props: "char charCode key keyCode".split(" "),
            filter: function(event, original) {
                return null == event.which && (event.which = null != original.charCode ? original.charCode : original.keyCode), 
                event;
            }
        },
        mouseHooks: {
            props: "button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),
            filter: function(event, original) {
                var body, eventDoc, doc, button = original.button, fromElement = original.fromElement;
                return null == event.pageX && null != original.clientX && (eventDoc = event.target.ownerDocument || document, 
                doc = eventDoc.documentElement, body = eventDoc.body, event.pageX = original.clientX + (doc && doc.scrollLeft || body && body.scrollLeft || 0) - (doc && doc.clientLeft || body && body.clientLeft || 0), 
                event.pageY = original.clientY + (doc && doc.scrollTop || body && body.scrollTop || 0) - (doc && doc.clientTop || body && body.clientTop || 0)), 
                !event.relatedTarget && fromElement && (event.relatedTarget = fromElement === event.target ? original.toElement : fromElement), 
                event.which || button === undefined || (event.which = 1 & button ? 1 : 2 & button ? 3 : 4 & button ? 2 : 0), 
                event;
            }
        },
        special: {
            load: {
                noBubble: !0
            },
            focus: {
                trigger: function() {
                    if (this !== safeActiveElement() && this.focus) try {
                        return this.focus(), !1;
                    } catch (e) {}
                },
                delegateType: "focusin"
            },
            blur: {
                trigger: function() {
                    return this === safeActiveElement() && this.blur ? (this.blur(), !1) : void 0;
                },
                delegateType: "focusout"
            },
            click: {
                trigger: function() {
                    return jQuery.nodeName(this, "input") && "checkbox" === this.type && this.click ? (this.click(), 
                    !1) : void 0;
                },
                _default: function(event) {
                    return jQuery.nodeName(event.target, "a");
                }
            },
            beforeunload: {
                postDispatch: function(event) {
                    event.result !== undefined && (event.originalEvent.returnValue = event.result);
                }
            }
        },
        simulate: function(type, elem, event, bubble) {
            var e = jQuery.extend(new jQuery.Event(), event, {
                type: type,
                isSimulated: !0,
                originalEvent: {}
            });
            bubble ? jQuery.event.trigger(e, null, elem) : jQuery.event.dispatch.call(elem, e), 
            e.isDefaultPrevented() && event.preventDefault();
        }
    }, jQuery.removeEvent = document.removeEventListener ? function(elem, type, handle) {
        elem.removeEventListener && elem.removeEventListener(type, handle, !1);
    } : function(elem, type, handle) {
        var name = "on" + type;
        elem.detachEvent && (typeof elem[name] === core_strundefined && (elem[name] = null), 
        elem.detachEvent(name, handle));
    }, jQuery.Event = function(src, props) {
        return this instanceof jQuery.Event ? (src && src.type ? (this.originalEvent = src, 
        this.type = src.type, this.isDefaultPrevented = src.defaultPrevented || src.returnValue === !1 || src.getPreventDefault && src.getPreventDefault() ? returnTrue : returnFalse) : this.type = src, 
        props && jQuery.extend(this, props), this.timeStamp = src && src.timeStamp || jQuery.now(), 
        void (this[jQuery.expando] = !0)) : new jQuery.Event(src, props);
    }, jQuery.Event.prototype = {
        isDefaultPrevented: returnFalse,
        isPropagationStopped: returnFalse,
        isImmediatePropagationStopped: returnFalse,
        preventDefault: function() {
            var e = this.originalEvent;
            this.isDefaultPrevented = returnTrue, e && (e.preventDefault ? e.preventDefault() : e.returnValue = !1);
        },
        stopPropagation: function() {
            var e = this.originalEvent;
            this.isPropagationStopped = returnTrue, e && (e.stopPropagation && e.stopPropagation(), 
            e.cancelBubble = !0);
        },
        stopImmediatePropagation: function() {
            this.isImmediatePropagationStopped = returnTrue, this.stopPropagation();
        }
    }, jQuery.each({
        mouseenter: "mouseover",
        mouseleave: "mouseout"
    }, function(orig, fix) {
        jQuery.event.special[orig] = {
            delegateType: fix,
            bindType: fix,
            handle: function(event) {
                var ret, target = this, related = event.relatedTarget, handleObj = event.handleObj;
                return (!related || related !== target && !jQuery.contains(target, related)) && (event.type = handleObj.origType, 
                ret = handleObj.handler.apply(this, arguments), event.type = fix), ret;
            }
        };
    }), jQuery.support.submitBubbles || (jQuery.event.special.submit = {
        setup: function() {
            return jQuery.nodeName(this, "form") ? !1 : void jQuery.event.add(this, "click._submit keypress._submit", function(e) {
                var elem = e.target, form = jQuery.nodeName(elem, "input") || jQuery.nodeName(elem, "button") ? elem.form : undefined;
                form && !jQuery._data(form, "submitBubbles") && (jQuery.event.add(form, "submit._submit", function(event) {
                    event._submit_bubble = !0;
                }), jQuery._data(form, "submitBubbles", !0));
            });
        },
        postDispatch: function(event) {
            event._submit_bubble && (delete event._submit_bubble, this.parentNode && !event.isTrigger && jQuery.event.simulate("submit", this.parentNode, event, !0));
        },
        teardown: function() {
            return jQuery.nodeName(this, "form") ? !1 : void jQuery.event.remove(this, "._submit");
        }
    }), jQuery.support.changeBubbles || (jQuery.event.special.change = {
        setup: function() {
            return rformElems.test(this.nodeName) ? (("checkbox" === this.type || "radio" === this.type) && (jQuery.event.add(this, "propertychange._change", function(event) {
                "checked" === event.originalEvent.propertyName && (this._just_changed = !0);
            }), jQuery.event.add(this, "click._change", function(event) {
                this._just_changed && !event.isTrigger && (this._just_changed = !1), jQuery.event.simulate("change", this, event, !0);
            })), !1) : void jQuery.event.add(this, "beforeactivate._change", function(e) {
                var elem = e.target;
                rformElems.test(elem.nodeName) && !jQuery._data(elem, "changeBubbles") && (jQuery.event.add(elem, "change._change", function(event) {
                    !this.parentNode || event.isSimulated || event.isTrigger || jQuery.event.simulate("change", this.parentNode, event, !0);
                }), jQuery._data(elem, "changeBubbles", !0));
            });
        },
        handle: function(event) {
            var elem = event.target;
            return this !== elem || event.isSimulated || event.isTrigger || "radio" !== elem.type && "checkbox" !== elem.type ? event.handleObj.handler.apply(this, arguments) : void 0;
        },
        teardown: function() {
            return jQuery.event.remove(this, "._change"), !rformElems.test(this.nodeName);
        }
    }), jQuery.support.focusinBubbles || jQuery.each({
        focus: "focusin",
        blur: "focusout"
    }, function(orig, fix) {
        var attaches = 0, handler = function(event) {
            jQuery.event.simulate(fix, event.target, jQuery.event.fix(event), !0);
        };
        jQuery.event.special[fix] = {
            setup: function() {
                0 === attaches++ && document.addEventListener(orig, handler, !0);
            },
            teardown: function() {
                0 === --attaches && document.removeEventListener(orig, handler, !0);
            }
        };
    }), jQuery.fn.extend({
        on: function(types, selector, data, fn, one) {
            var type, origFn;
            if ("object" == typeof types) {
                "string" != typeof selector && (data = data || selector, selector = undefined);
                for (type in types) this.on(type, selector, data, types[type], one);
                return this;
            }
            if (null == data && null == fn ? (fn = selector, data = selector = undefined) : null == fn && ("string" == typeof selector ? (fn = data, 
            data = undefined) : (fn = data, data = selector, selector = undefined)), fn === !1) fn = returnFalse; else if (!fn) return this;
            return 1 === one && (origFn = fn, fn = function(event) {
                return jQuery().off(event), origFn.apply(this, arguments);
            }, fn.guid = origFn.guid || (origFn.guid = jQuery.guid++)), this.each(function() {
                jQuery.event.add(this, types, fn, data, selector);
            });
        },
        one: function(types, selector, data, fn) {
            return this.on(types, selector, data, fn, 1);
        },
        off: function(types, selector, fn) {
            var handleObj, type;
            if (types && types.preventDefault && types.handleObj) return handleObj = types.handleObj, 
            jQuery(types.delegateTarget).off(handleObj.namespace ? handleObj.origType + "." + handleObj.namespace : handleObj.origType, handleObj.selector, handleObj.handler), 
            this;
            if ("object" == typeof types) {
                for (type in types) this.off(type, selector, types[type]);
                return this;
            }
            return (selector === !1 || "function" == typeof selector) && (fn = selector, selector = undefined), 
            fn === !1 && (fn = returnFalse), this.each(function() {
                jQuery.event.remove(this, types, fn, selector);
            });
        },
        trigger: function(type, data) {
            return this.each(function() {
                jQuery.event.trigger(type, data, this);
            });
        },
        triggerHandler: function(type, data) {
            var elem = this[0];
            return elem ? jQuery.event.trigger(type, data, elem, !0) : void 0;
        }
    });
    var isSimple = /^.[^:#\[\.,]*$/, rparentsprev = /^(?:parents|prev(?:Until|All))/, rneedsContext = jQuery.expr.match.needsContext, guaranteedUnique = {
        children: !0,
        contents: !0,
        next: !0,
        prev: !0
    };
    jQuery.fn.extend({
        find: function(selector) {
            var i, ret = [], self = this, len = self.length;
            if ("string" != typeof selector) return this.pushStack(jQuery(selector).filter(function() {
                for (i = 0; len > i; i++) if (jQuery.contains(self[i], this)) return !0;
            }));
            for (i = 0; len > i; i++) jQuery.find(selector, self[i], ret);
            return ret = this.pushStack(len > 1 ? jQuery.unique(ret) : ret), ret.selector = this.selector ? this.selector + " " + selector : selector, 
            ret;
        },
        has: function(target) {
            var i, targets = jQuery(target, this), len = targets.length;
            return this.filter(function() {
                for (i = 0; len > i; i++) if (jQuery.contains(this, targets[i])) return !0;
            });
        },
        not: function(selector) {
            return this.pushStack(winnow(this, selector || [], !0));
        },
        filter: function(selector) {
            return this.pushStack(winnow(this, selector || [], !1));
        },
        is: function(selector) {
            return !!winnow(this, "string" == typeof selector && rneedsContext.test(selector) ? jQuery(selector) : selector || [], !1).length;
        },
        closest: function(selectors, context) {
            for (var cur, i = 0, l = this.length, ret = [], pos = rneedsContext.test(selectors) || "string" != typeof selectors ? jQuery(selectors, context || this.context) : 0; l > i; i++) for (cur = this[i]; cur && cur !== context; cur = cur.parentNode) if (cur.nodeType < 11 && (pos ? pos.index(cur) > -1 : 1 === cur.nodeType && jQuery.find.matchesSelector(cur, selectors))) {
                cur = ret.push(cur);
                break;
            }
            return this.pushStack(ret.length > 1 ? jQuery.unique(ret) : ret);
        },
        index: function(elem) {
            return elem ? "string" == typeof elem ? jQuery.inArray(this[0], jQuery(elem)) : jQuery.inArray(elem.jquery ? elem[0] : elem, this) : this[0] && this[0].parentNode ? this.first().prevAll().length : -1;
        },
        add: function(selector, context) {
            var set = "string" == typeof selector ? jQuery(selector, context) : jQuery.makeArray(selector && selector.nodeType ? [ selector ] : selector), all = jQuery.merge(this.get(), set);
            return this.pushStack(jQuery.unique(all));
        },
        addBack: function(selector) {
            return this.add(null == selector ? this.prevObject : this.prevObject.filter(selector));
        }
    }), jQuery.each({
        parent: function(elem) {
            var parent = elem.parentNode;
            return parent && 11 !== parent.nodeType ? parent : null;
        },
        parents: function(elem) {
            return jQuery.dir(elem, "parentNode");
        },
        parentsUntil: function(elem, i, until) {
            return jQuery.dir(elem, "parentNode", until);
        },
        next: function(elem) {
            return sibling(elem, "nextSibling");
        },
        prev: function(elem) {
            return sibling(elem, "previousSibling");
        },
        nextAll: function(elem) {
            return jQuery.dir(elem, "nextSibling");
        },
        prevAll: function(elem) {
            return jQuery.dir(elem, "previousSibling");
        },
        nextUntil: function(elem, i, until) {
            return jQuery.dir(elem, "nextSibling", until);
        },
        prevUntil: function(elem, i, until) {
            return jQuery.dir(elem, "previousSibling", until);
        },
        siblings: function(elem) {
            return jQuery.sibling((elem.parentNode || {}).firstChild, elem);
        },
        children: function(elem) {
            return jQuery.sibling(elem.firstChild);
        },
        contents: function(elem) {
            return jQuery.nodeName(elem, "iframe") ? elem.contentDocument || elem.contentWindow.document : jQuery.merge([], elem.childNodes);
        }
    }, function(name, fn) {
        jQuery.fn[name] = function(until, selector) {
            var ret = jQuery.map(this, fn, until);
            return "Until" !== name.slice(-5) && (selector = until), selector && "string" == typeof selector && (ret = jQuery.filter(selector, ret)), 
            this.length > 1 && (guaranteedUnique[name] || (ret = jQuery.unique(ret)), rparentsprev.test(name) && (ret = ret.reverse())), 
            this.pushStack(ret);
        };
    }), jQuery.extend({
        filter: function(expr, elems, not) {
            var elem = elems[0];
            return not && (expr = ":not(" + expr + ")"), 1 === elems.length && 1 === elem.nodeType ? jQuery.find.matchesSelector(elem, expr) ? [ elem ] : [] : jQuery.find.matches(expr, jQuery.grep(elems, function(elem) {
                return 1 === elem.nodeType;
            }));
        },
        dir: function(elem, dir, until) {
            for (var matched = [], cur = elem[dir]; cur && 9 !== cur.nodeType && (until === undefined || 1 !== cur.nodeType || !jQuery(cur).is(until)); ) 1 === cur.nodeType && matched.push(cur), 
            cur = cur[dir];
            return matched;
        },
        sibling: function(n, elem) {
            for (var r = []; n; n = n.nextSibling) 1 === n.nodeType && n !== elem && r.push(n);
            return r;
        }
    });
    var nodeNames = "abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video", rinlinejQuery = / jQuery\d+="(?:null|\d+)"/g, rnoshimcache = new RegExp("<(?:" + nodeNames + ")[\\s/>]", "i"), rleadingWhitespace = /^\s+/, rxhtmlTag = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi, rtagName = /<([\w:]+)/, rtbody = /<tbody/i, rhtml = /<|&#?\w+;/, rnoInnerhtml = /<(?:script|style|link)/i, manipulation_rcheckableType = /^(?:checkbox|radio)$/i, rchecked = /checked\s*(?:[^=]|=\s*.checked.)/i, rscriptType = /^$|\/(?:java|ecma)script/i, rscriptTypeMasked = /^true\/(.*)/, rcleanScript = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g, wrapMap = {
        option: [ 1, "<select multiple='multiple'>", "</select>" ],
        legend: [ 1, "<fieldset>", "</fieldset>" ],
        area: [ 1, "<map>", "</map>" ],
        param: [ 1, "<object>", "</object>" ],
        thead: [ 1, "<table>", "</table>" ],
        tr: [ 2, "<table><tbody>", "</tbody></table>" ],
        col: [ 2, "<table><tbody></tbody><colgroup>", "</colgroup></table>" ],
        td: [ 3, "<table><tbody><tr>", "</tr></tbody></table>" ],
        _default: jQuery.support.htmlSerialize ? [ 0, "", "" ] : [ 1, "X<div>", "</div>" ]
    }, safeFragment = createSafeFragment(document), fragmentDiv = safeFragment.appendChild(document.createElement("div"));
    wrapMap.optgroup = wrapMap.option, wrapMap.tbody = wrapMap.tfoot = wrapMap.colgroup = wrapMap.caption = wrapMap.thead, 
    wrapMap.th = wrapMap.td, jQuery.fn.extend({
        text: function(value) {
            return jQuery.access(this, function(value) {
                return value === undefined ? jQuery.text(this) : this.empty().append((this[0] && this[0].ownerDocument || document).createTextNode(value));
            }, null, value, arguments.length);
        },
        append: function() {
            return this.domManip(arguments, function(elem) {
                if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                    var target = manipulationTarget(this, elem);
                    target.appendChild(elem);
                }
            });
        },
        prepend: function() {
            return this.domManip(arguments, function(elem) {
                if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                    var target = manipulationTarget(this, elem);
                    target.insertBefore(elem, target.firstChild);
                }
            });
        },
        before: function() {
            return this.domManip(arguments, function(elem) {
                this.parentNode && this.parentNode.insertBefore(elem, this);
            });
        },
        after: function() {
            return this.domManip(arguments, function(elem) {
                this.parentNode && this.parentNode.insertBefore(elem, this.nextSibling);
            });
        },
        remove: function(selector, keepData) {
            for (var elem, elems = selector ? jQuery.filter(selector, this) : this, i = 0; null != (elem = elems[i]); i++) keepData || 1 !== elem.nodeType || jQuery.cleanData(getAll(elem)), 
            elem.parentNode && (keepData && jQuery.contains(elem.ownerDocument, elem) && setGlobalEval(getAll(elem, "script")), 
            elem.parentNode.removeChild(elem));
            return this;
        },
        empty: function() {
            for (var elem, i = 0; null != (elem = this[i]); i++) {
                for (1 === elem.nodeType && jQuery.cleanData(getAll(elem, !1)); elem.firstChild; ) elem.removeChild(elem.firstChild);
                elem.options && jQuery.nodeName(elem, "select") && (elem.options.length = 0);
            }
            return this;
        },
        clone: function(dataAndEvents, deepDataAndEvents) {
            return dataAndEvents = null == dataAndEvents ? !1 : dataAndEvents, deepDataAndEvents = null == deepDataAndEvents ? dataAndEvents : deepDataAndEvents, 
            this.map(function() {
                return jQuery.clone(this, dataAndEvents, deepDataAndEvents);
            });
        },
        html: function(value) {
            return jQuery.access(this, function(value) {
                var elem = this[0] || {}, i = 0, l = this.length;
                if (value === undefined) return 1 === elem.nodeType ? elem.innerHTML.replace(rinlinejQuery, "") : undefined;
                if (!("string" != typeof value || rnoInnerhtml.test(value) || !jQuery.support.htmlSerialize && rnoshimcache.test(value) || !jQuery.support.leadingWhitespace && rleadingWhitespace.test(value) || wrapMap[(rtagName.exec(value) || [ "", "" ])[1].toLowerCase()])) {
                    value = value.replace(rxhtmlTag, "<$1></$2>");
                    try {
                        for (;l > i; i++) elem = this[i] || {}, 1 === elem.nodeType && (jQuery.cleanData(getAll(elem, !1)), 
                        elem.innerHTML = value);
                        elem = 0;
                    } catch (e) {}
                }
                elem && this.empty().append(value);
            }, null, value, arguments.length);
        },
        replaceWith: function() {
            var args = jQuery.map(this, function(elem) {
                return [ elem.nextSibling, elem.parentNode ];
            }), i = 0;
            return this.domManip(arguments, function(elem) {
                var next = args[i++], parent = args[i++];
                parent && (next && next.parentNode !== parent && (next = this.nextSibling), jQuery(this).remove(), 
                parent.insertBefore(elem, next));
            }, !0), i ? this : this.remove();
        },
        detach: function(selector) {
            return this.remove(selector, !0);
        },
        domManip: function(args, callback, allowIntersection) {
            args = core_concat.apply([], args);
            var first, node, hasScripts, scripts, doc, fragment, i = 0, l = this.length, set = this, iNoClone = l - 1, value = args[0], isFunction = jQuery.isFunction(value);
            if (isFunction || !(1 >= l || "string" != typeof value || jQuery.support.checkClone) && rchecked.test(value)) return this.each(function(index) {
                var self = set.eq(index);
                isFunction && (args[0] = value.call(this, index, self.html())), self.domManip(args, callback, allowIntersection);
            });
            if (l && (fragment = jQuery.buildFragment(args, this[0].ownerDocument, !1, !allowIntersection && this), 
            first = fragment.firstChild, 1 === fragment.childNodes.length && (fragment = first), 
            first)) {
                for (scripts = jQuery.map(getAll(fragment, "script"), disableScript), hasScripts = scripts.length; l > i; i++) node = fragment, 
                i !== iNoClone && (node = jQuery.clone(node, !0, !0), hasScripts && jQuery.merge(scripts, getAll(node, "script"))), 
                callback.call(this[i], node, i);
                if (hasScripts) for (doc = scripts[scripts.length - 1].ownerDocument, jQuery.map(scripts, restoreScript), 
                i = 0; hasScripts > i; i++) node = scripts[i], rscriptType.test(node.type || "") && !jQuery._data(node, "globalEval") && jQuery.contains(doc, node) && (node.src ? jQuery._evalUrl(node.src) : jQuery.globalEval((node.text || node.textContent || node.innerHTML || "").replace(rcleanScript, "")));
                fragment = first = null;
            }
            return this;
        }
    }), jQuery.each({
        appendTo: "append",
        prependTo: "prepend",
        insertBefore: "before",
        insertAfter: "after",
        replaceAll: "replaceWith"
    }, function(name, original) {
        jQuery.fn[name] = function(selector) {
            for (var elems, i = 0, ret = [], insert = jQuery(selector), last = insert.length - 1; last >= i; i++) elems = i === last ? this : this.clone(!0), 
            jQuery(insert[i])[original](elems), core_push.apply(ret, elems.get());
            return this.pushStack(ret);
        };
    }), jQuery.extend({
        clone: function(elem, dataAndEvents, deepDataAndEvents) {
            var destElements, node, clone, i, srcElements, inPage = jQuery.contains(elem.ownerDocument, elem);
            if (jQuery.support.html5Clone || jQuery.isXMLDoc(elem) || !rnoshimcache.test("<" + elem.nodeName + ">") ? clone = elem.cloneNode(!0) : (fragmentDiv.innerHTML = elem.outerHTML, 
            fragmentDiv.removeChild(clone = fragmentDiv.firstChild)), !(jQuery.support.noCloneEvent && jQuery.support.noCloneChecked || 1 !== elem.nodeType && 11 !== elem.nodeType || jQuery.isXMLDoc(elem))) for (destElements = getAll(clone), 
            srcElements = getAll(elem), i = 0; null != (node = srcElements[i]); ++i) destElements[i] && fixCloneNodeIssues(node, destElements[i]);
            if (dataAndEvents) if (deepDataAndEvents) for (srcElements = srcElements || getAll(elem), 
            destElements = destElements || getAll(clone), i = 0; null != (node = srcElements[i]); i++) cloneCopyEvent(node, destElements[i]); else cloneCopyEvent(elem, clone);
            return destElements = getAll(clone, "script"), destElements.length > 0 && setGlobalEval(destElements, !inPage && getAll(elem, "script")), 
            destElements = srcElements = node = null, clone;
        },
        buildFragment: function(elems, context, scripts, selection) {
            for (var j, elem, contains, tmp, tag, tbody, wrap, l = elems.length, safe = createSafeFragment(context), nodes = [], i = 0; l > i; i++) if (elem = elems[i], 
            elem || 0 === elem) if ("object" === jQuery.type(elem)) jQuery.merge(nodes, elem.nodeType ? [ elem ] : elem); else if (rhtml.test(elem)) {
                for (tmp = tmp || safe.appendChild(context.createElement("div")), tag = (rtagName.exec(elem) || [ "", "" ])[1].toLowerCase(), 
                wrap = wrapMap[tag] || wrapMap._default, tmp.innerHTML = wrap[1] + elem.replace(rxhtmlTag, "<$1></$2>") + wrap[2], 
                j = wrap[0]; j--; ) tmp = tmp.lastChild;
                if (!jQuery.support.leadingWhitespace && rleadingWhitespace.test(elem) && nodes.push(context.createTextNode(rleadingWhitespace.exec(elem)[0])), 
                !jQuery.support.tbody) for (elem = "table" !== tag || rtbody.test(elem) ? "<table>" !== wrap[1] || rtbody.test(elem) ? 0 : tmp : tmp.firstChild, 
                j = elem && elem.childNodes.length; j--; ) jQuery.nodeName(tbody = elem.childNodes[j], "tbody") && !tbody.childNodes.length && elem.removeChild(tbody);
                for (jQuery.merge(nodes, tmp.childNodes), tmp.textContent = ""; tmp.firstChild; ) tmp.removeChild(tmp.firstChild);
                tmp = safe.lastChild;
            } else nodes.push(context.createTextNode(elem));
            for (tmp && safe.removeChild(tmp), jQuery.support.appendChecked || jQuery.grep(getAll(nodes, "input"), fixDefaultChecked), 
            i = 0; elem = nodes[i++]; ) if ((!selection || -1 === jQuery.inArray(elem, selection)) && (contains = jQuery.contains(elem.ownerDocument, elem), 
            tmp = getAll(safe.appendChild(elem), "script"), contains && setGlobalEval(tmp), 
            scripts)) for (j = 0; elem = tmp[j++]; ) rscriptType.test(elem.type || "") && scripts.push(elem);
            return tmp = null, safe;
        },
        cleanData: function(elems, acceptData) {
            for (var elem, type, id, data, i = 0, internalKey = jQuery.expando, cache = jQuery.cache, deleteExpando = jQuery.support.deleteExpando, special = jQuery.event.special; null != (elem = elems[i]); i++) if ((acceptData || jQuery.acceptData(elem)) && (id = elem[internalKey], 
            data = id && cache[id])) {
                if (data.events) for (type in data.events) special[type] ? jQuery.event.remove(elem, type) : jQuery.removeEvent(elem, type, data.handle);
                cache[id] && (delete cache[id], deleteExpando ? delete elem[internalKey] : typeof elem.removeAttribute !== core_strundefined ? elem.removeAttribute(internalKey) : elem[internalKey] = null, 
                core_deletedIds.push(id));
            }
        },
        _evalUrl: function(url) {
            return jQuery.ajax({
                url: url,
                type: "GET",
                dataType: "script",
                async: !1,
                global: !1,
                "throws": !0
            });
        }
    }), jQuery.fn.extend({
        wrapAll: function(html) {
            if (jQuery.isFunction(html)) return this.each(function(i) {
                jQuery(this).wrapAll(html.call(this, i));
            });
            if (this[0]) {
                var wrap = jQuery(html, this[0].ownerDocument).eq(0).clone(!0);
                this[0].parentNode && wrap.insertBefore(this[0]), wrap.map(function() {
                    for (var elem = this; elem.firstChild && 1 === elem.firstChild.nodeType; ) elem = elem.firstChild;
                    return elem;
                }).append(this);
            }
            return this;
        },
        wrapInner: function(html) {
            return this.each(jQuery.isFunction(html) ? function(i) {
                jQuery(this).wrapInner(html.call(this, i));
            } : function() {
                var self = jQuery(this), contents = self.contents();
                contents.length ? contents.wrapAll(html) : self.append(html);
            });
        },
        wrap: function(html) {
            var isFunction = jQuery.isFunction(html);
            return this.each(function(i) {
                jQuery(this).wrapAll(isFunction ? html.call(this, i) : html);
            });
        },
        unwrap: function() {
            return this.parent().each(function() {
                jQuery.nodeName(this, "body") || jQuery(this).replaceWith(this.childNodes);
            }).end();
        }
    });
    var iframe, getStyles, curCSS, ralpha = /alpha\([^)]*\)/i, ropacity = /opacity\s*=\s*([^)]*)/, rposition = /^(top|right|bottom|left)$/, rdisplayswap = /^(none|table(?!-c[ea]).+)/, rmargin = /^margin/, rnumsplit = new RegExp("^(" + core_pnum + ")(.*)$", "i"), rnumnonpx = new RegExp("^(" + core_pnum + ")(?!px)[a-z%]+$", "i"), rrelNum = new RegExp("^([+-])=(" + core_pnum + ")", "i"), elemdisplay = {
        BODY: "block"
    }, cssShow = {
        position: "absolute",
        visibility: "hidden",
        display: "block"
    }, cssNormalTransform = {
        letterSpacing: 0,
        fontWeight: 400
    }, cssExpand = [ "Top", "Right", "Bottom", "Left" ], cssPrefixes = [ "Webkit", "O", "Moz", "ms" ];
    jQuery.fn.extend({
        css: function(name, value) {
            return jQuery.access(this, function(elem, name, value) {
                var len, styles, map = {}, i = 0;
                if (jQuery.isArray(name)) {
                    for (styles = getStyles(elem), len = name.length; len > i; i++) map[name[i]] = jQuery.css(elem, name[i], !1, styles);
                    return map;
                }
                return value !== undefined ? jQuery.style(elem, name, value) : jQuery.css(elem, name);
            }, name, value, arguments.length > 1);
        },
        show: function() {
            return showHide(this, !0);
        },
        hide: function() {
            return showHide(this);
        },
        toggle: function(state) {
            return "boolean" == typeof state ? state ? this.show() : this.hide() : this.each(function() {
                isHidden(this) ? jQuery(this).show() : jQuery(this).hide();
            });
        }
    }), jQuery.extend({
        cssHooks: {
            opacity: {
                get: function(elem, computed) {
                    if (computed) {
                        var ret = curCSS(elem, "opacity");
                        return "" === ret ? "1" : ret;
                    }
                }
            }
        },
        cssNumber: {
            columnCount: !0,
            fillOpacity: !0,
            fontWeight: !0,
            lineHeight: !0,
            opacity: !0,
            order: !0,
            orphans: !0,
            widows: !0,
            zIndex: !0,
            zoom: !0
        },
        cssProps: {
            "float": jQuery.support.cssFloat ? "cssFloat" : "styleFloat"
        },
        style: function(elem, name, value, extra) {
            if (elem && 3 !== elem.nodeType && 8 !== elem.nodeType && elem.style) {
                var ret, type, hooks, origName = jQuery.camelCase(name), style = elem.style;
                if (name = jQuery.cssProps[origName] || (jQuery.cssProps[origName] = vendorPropName(style, origName)), 
                hooks = jQuery.cssHooks[name] || jQuery.cssHooks[origName], value === undefined) return hooks && "get" in hooks && (ret = hooks.get(elem, !1, extra)) !== undefined ? ret : style[name];
                if (type = typeof value, "string" === type && (ret = rrelNum.exec(value)) && (value = (ret[1] + 1) * ret[2] + parseFloat(jQuery.css(elem, name)), 
                type = "number"), !(null == value || "number" === type && isNaN(value) || ("number" !== type || jQuery.cssNumber[origName] || (value += "px"), 
                jQuery.support.clearCloneStyle || "" !== value || 0 !== name.indexOf("background") || (style[name] = "inherit"), 
                hooks && "set" in hooks && (value = hooks.set(elem, value, extra)) === undefined))) try {
                    style[name] = value;
                } catch (e) {}
            }
        },
        css: function(elem, name, extra, styles) {
            var num, val, hooks, origName = jQuery.camelCase(name);
            return name = jQuery.cssProps[origName] || (jQuery.cssProps[origName] = vendorPropName(elem.style, origName)), 
            hooks = jQuery.cssHooks[name] || jQuery.cssHooks[origName], hooks && "get" in hooks && (val = hooks.get(elem, !0, extra)), 
            val === undefined && (val = curCSS(elem, name, styles)), "normal" === val && name in cssNormalTransform && (val = cssNormalTransform[name]), 
            "" === extra || extra ? (num = parseFloat(val), extra === !0 || jQuery.isNumeric(num) ? num || 0 : val) : val;
        }
    }), window.getComputedStyle ? (getStyles = function(elem) {
        return window.getComputedStyle(elem, null);
    }, curCSS = function(elem, name, _computed) {
        var width, minWidth, maxWidth, computed = _computed || getStyles(elem), ret = computed ? computed.getPropertyValue(name) || computed[name] : undefined, style = elem.style;
        return computed && ("" !== ret || jQuery.contains(elem.ownerDocument, elem) || (ret = jQuery.style(elem, name)), 
        rnumnonpx.test(ret) && rmargin.test(name) && (width = style.width, minWidth = style.minWidth, 
        maxWidth = style.maxWidth, style.minWidth = style.maxWidth = style.width = ret, 
        ret = computed.width, style.width = width, style.minWidth = minWidth, style.maxWidth = maxWidth)), 
        ret;
    }) : document.documentElement.currentStyle && (getStyles = function(elem) {
        return elem.currentStyle;
    }, curCSS = function(elem, name, _computed) {
        var left, rs, rsLeft, computed = _computed || getStyles(elem), ret = computed ? computed[name] : undefined, style = elem.style;
        return null == ret && style && style[name] && (ret = style[name]), rnumnonpx.test(ret) && !rposition.test(name) && (left = style.left, 
        rs = elem.runtimeStyle, rsLeft = rs && rs.left, rsLeft && (rs.left = elem.currentStyle.left), 
        style.left = "fontSize" === name ? "1em" : ret, ret = style.pixelLeft + "px", style.left = left, 
        rsLeft && (rs.left = rsLeft)), "" === ret ? "auto" : ret;
    }), jQuery.each([ "height", "width" ], function(i, name) {
        jQuery.cssHooks[name] = {
            get: function(elem, computed, extra) {
                return computed ? 0 === elem.offsetWidth && rdisplayswap.test(jQuery.css(elem, "display")) ? jQuery.swap(elem, cssShow, function() {
                    return getWidthOrHeight(elem, name, extra);
                }) : getWidthOrHeight(elem, name, extra) : void 0;
            },
            set: function(elem, value, extra) {
                var styles = extra && getStyles(elem);
                return setPositiveNumber(elem, value, extra ? augmentWidthOrHeight(elem, name, extra, jQuery.support.boxSizing && "border-box" === jQuery.css(elem, "boxSizing", !1, styles), styles) : 0);
            }
        };
    }), jQuery.support.opacity || (jQuery.cssHooks.opacity = {
        get: function(elem, computed) {
            return ropacity.test((computed && elem.currentStyle ? elem.currentStyle.filter : elem.style.filter) || "") ? .01 * parseFloat(RegExp.$1) + "" : computed ? "1" : "";
        },
        set: function(elem, value) {
            var style = elem.style, currentStyle = elem.currentStyle, opacity = jQuery.isNumeric(value) ? "alpha(opacity=" + 100 * value + ")" : "", filter = currentStyle && currentStyle.filter || style.filter || "";
            style.zoom = 1, (value >= 1 || "" === value) && "" === jQuery.trim(filter.replace(ralpha, "")) && style.removeAttribute && (style.removeAttribute("filter"), 
            "" === value || currentStyle && !currentStyle.filter) || (style.filter = ralpha.test(filter) ? filter.replace(ralpha, opacity) : filter + " " + opacity);
        }
    }), jQuery(function() {
        jQuery.support.reliableMarginRight || (jQuery.cssHooks.marginRight = {
            get: function(elem, computed) {
                return computed ? jQuery.swap(elem, {
                    display: "inline-block"
                }, curCSS, [ elem, "marginRight" ]) : void 0;
            }
        }), !jQuery.support.pixelPosition && jQuery.fn.position && jQuery.each([ "top", "left" ], function(i, prop) {
            jQuery.cssHooks[prop] = {
                get: function(elem, computed) {
                    return computed ? (computed = curCSS(elem, prop), rnumnonpx.test(computed) ? jQuery(elem).position()[prop] + "px" : computed) : void 0;
                }
            };
        });
    }), jQuery.expr && jQuery.expr.filters && (jQuery.expr.filters.hidden = function(elem) {
        return elem.offsetWidth <= 0 && elem.offsetHeight <= 0 || !jQuery.support.reliableHiddenOffsets && "none" === (elem.style && elem.style.display || jQuery.css(elem, "display"));
    }, jQuery.expr.filters.visible = function(elem) {
        return !jQuery.expr.filters.hidden(elem);
    }), jQuery.each({
        margin: "",
        padding: "",
        border: "Width"
    }, function(prefix, suffix) {
        jQuery.cssHooks[prefix + suffix] = {
            expand: function(value) {
                for (var i = 0, expanded = {}, parts = "string" == typeof value ? value.split(" ") : [ value ]; 4 > i; i++) expanded[prefix + cssExpand[i] + suffix] = parts[i] || parts[i - 2] || parts[0];
                return expanded;
            }
        }, rmargin.test(prefix) || (jQuery.cssHooks[prefix + suffix].set = setPositiveNumber);
    });
    var r20 = /%20/g, rbracket = /\[\]$/, rCRLF = /\r?\n/g, rsubmitterTypes = /^(?:submit|button|image|reset|file)$/i, rsubmittable = /^(?:input|select|textarea|keygen)/i;
    jQuery.fn.extend({
        serialize: function() {
            return jQuery.param(this.serializeArray());
        },
        serializeArray: function() {
            return this.map(function() {
                var elements = jQuery.prop(this, "elements");
                return elements ? jQuery.makeArray(elements) : this;
            }).filter(function() {
                var type = this.type;
                return this.name && !jQuery(this).is(":disabled") && rsubmittable.test(this.nodeName) && !rsubmitterTypes.test(type) && (this.checked || !manipulation_rcheckableType.test(type));
            }).map(function(i, elem) {
                var val = jQuery(this).val();
                return null == val ? null : jQuery.isArray(val) ? jQuery.map(val, function(val) {
                    return {
                        name: elem.name,
                        value: val.replace(rCRLF, "\r\n")
                    };
                }) : {
                    name: elem.name,
                    value: val.replace(rCRLF, "\r\n")
                };
            }).get();
        }
    }), jQuery.param = function(a, traditional) {
        var prefix, s = [], add = function(key, value) {
            value = jQuery.isFunction(value) ? value() : null == value ? "" : value, s[s.length] = encodeURIComponent(key) + "=" + encodeURIComponent(value);
        };
        if (traditional === undefined && (traditional = jQuery.ajaxSettings && jQuery.ajaxSettings.traditional), 
        jQuery.isArray(a) || a.jquery && !jQuery.isPlainObject(a)) jQuery.each(a, function() {
            add(this.name, this.value);
        }); else for (prefix in a) buildParams(prefix, a[prefix], traditional, add);
        return s.join("&").replace(r20, "+");
    }, jQuery.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "), function(i, name) {
        jQuery.fn[name] = function(data, fn) {
            return arguments.length > 0 ? this.on(name, null, data, fn) : this.trigger(name);
        };
    }), jQuery.fn.extend({
        hover: function(fnOver, fnOut) {
            return this.mouseenter(fnOver).mouseleave(fnOut || fnOver);
        },
        bind: function(types, data, fn) {
            return this.on(types, null, data, fn);
        },
        unbind: function(types, fn) {
            return this.off(types, null, fn);
        },
        delegate: function(selector, types, data, fn) {
            return this.on(types, selector, data, fn);
        },
        undelegate: function(selector, types, fn) {
            return 1 === arguments.length ? this.off(selector, "**") : this.off(types, selector || "**", fn);
        }
    });
    var ajaxLocParts, ajaxLocation, ajax_nonce = jQuery.now(), ajax_rquery = /\?/, rhash = /#.*$/, rts = /([?&])_=[^&]*/, rheaders = /^(.*?):[ \t]*([^\r\n]*)\r?$/gm, rlocalProtocol = /^(?:about|app|app-storage|.+-extension|file|res|widget):$/, rnoContent = /^(?:GET|HEAD)$/, rprotocol = /^\/\//, rurl = /^([\w.+-]+:)(?:\/\/([^\/?#:]*)(?::(\d+)|)|)/, _load = jQuery.fn.load, prefilters = {}, transports = {}, allTypes = "*/".concat("*");
    try {
        ajaxLocation = location.href;
    } catch (e) {
        ajaxLocation = document.createElement("a"), ajaxLocation.href = "", ajaxLocation = ajaxLocation.href;
    }
    ajaxLocParts = rurl.exec(ajaxLocation.toLowerCase()) || [], jQuery.fn.load = function(url, params, callback) {
        if ("string" != typeof url && _load) return _load.apply(this, arguments);
        var selector, response, type, self = this, off = url.indexOf(" ");
        return off >= 0 && (selector = url.slice(off, url.length), url = url.slice(0, off)), 
        jQuery.isFunction(params) ? (callback = params, params = undefined) : params && "object" == typeof params && (type = "POST"), 
        self.length > 0 && jQuery.ajax({
            url: url,
            type: type,
            dataType: "html",
            data: params
        }).done(function(responseText) {
            response = arguments, self.html(selector ? jQuery("<div>").append(jQuery.parseHTML(responseText)).find(selector) : responseText);
        }).complete(callback && function(jqXHR, status) {
            self.each(callback, response || [ jqXHR.responseText, status, jqXHR ]);
        }), this;
    }, jQuery.each([ "ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend" ], function(i, type) {
        jQuery.fn[type] = function(fn) {
            return this.on(type, fn);
        };
    }), jQuery.extend({
        active: 0,
        lastModified: {},
        etag: {},
        ajaxSettings: {
            url: ajaxLocation,
            type: "GET",
            isLocal: rlocalProtocol.test(ajaxLocParts[1]),
            global: !0,
            processData: !0,
            async: !0,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            accepts: {
                "*": allTypes,
                text: "text/plain",
                html: "text/html",
                xml: "application/xml, text/xml",
                json: "application/json, text/javascript"
            },
            contents: {
                xml: /xml/,
                html: /html/,
                json: /json/
            },
            responseFields: {
                xml: "responseXML",
                text: "responseText",
                json: "responseJSON"
            },
            converters: {
                "* text": String,
                "text html": !0,
                "text json": jQuery.parseJSON,
                "text xml": jQuery.parseXML
            },
            flatOptions: {
                url: !0,
                context: !0
            }
        },
        ajaxSetup: function(target, settings) {
            return settings ? ajaxExtend(ajaxExtend(target, jQuery.ajaxSettings), settings) : ajaxExtend(jQuery.ajaxSettings, target);
        },
        ajaxPrefilter: addToPrefiltersOrTransports(prefilters),
        ajaxTransport: addToPrefiltersOrTransports(transports),
        ajax: function(url, options) {
            function done(status, nativeStatusText, responses, headers) {
                var isSuccess, success, error, response, modified, statusText = nativeStatusText;
                2 !== state && (state = 2, timeoutTimer && clearTimeout(timeoutTimer), transport = undefined, 
                responseHeadersString = headers || "", jqXHR.readyState = status > 0 ? 4 : 0, isSuccess = status >= 200 && 300 > status || 304 === status, 
                responses && (response = ajaxHandleResponses(s, jqXHR, responses)), response = ajaxConvert(s, response, jqXHR, isSuccess), 
                isSuccess ? (s.ifModified && (modified = jqXHR.getResponseHeader("Last-Modified"), 
                modified && (jQuery.lastModified[cacheURL] = modified), modified = jqXHR.getResponseHeader("etag"), 
                modified && (jQuery.etag[cacheURL] = modified)), 204 === status || "HEAD" === s.type ? statusText = "nocontent" : 304 === status ? statusText = "notmodified" : (statusText = response.state, 
                success = response.data, error = response.error, isSuccess = !error)) : (error = statusText, 
                (status || !statusText) && (statusText = "error", 0 > status && (status = 0))), 
                jqXHR.status = status, jqXHR.statusText = (nativeStatusText || statusText) + "", 
                isSuccess ? deferred.resolveWith(callbackContext, [ success, statusText, jqXHR ]) : deferred.rejectWith(callbackContext, [ jqXHR, statusText, error ]), 
                jqXHR.statusCode(statusCode), statusCode = undefined, fireGlobals && globalEventContext.trigger(isSuccess ? "ajaxSuccess" : "ajaxError", [ jqXHR, s, isSuccess ? success : error ]), 
                completeDeferred.fireWith(callbackContext, [ jqXHR, statusText ]), fireGlobals && (globalEventContext.trigger("ajaxComplete", [ jqXHR, s ]), 
                --jQuery.active || jQuery.event.trigger("ajaxStop")));
            }
            "object" == typeof url && (options = url, url = undefined), options = options || {};
            var parts, i, cacheURL, responseHeadersString, timeoutTimer, fireGlobals, transport, responseHeaders, s = jQuery.ajaxSetup({}, options), callbackContext = s.context || s, globalEventContext = s.context && (callbackContext.nodeType || callbackContext.jquery) ? jQuery(callbackContext) : jQuery.event, deferred = jQuery.Deferred(), completeDeferred = jQuery.Callbacks("once memory"), statusCode = s.statusCode || {}, requestHeaders = {}, requestHeadersNames = {}, state = 0, strAbort = "canceled", jqXHR = {
                readyState: 0,
                getResponseHeader: function(key) {
                    var match;
                    if (2 === state) {
                        if (!responseHeaders) for (responseHeaders = {}; match = rheaders.exec(responseHeadersString); ) responseHeaders[match[1].toLowerCase()] = match[2];
                        match = responseHeaders[key.toLowerCase()];
                    }
                    return null == match ? null : match;
                },
                getAllResponseHeaders: function() {
                    return 2 === state ? responseHeadersString : null;
                },
                setRequestHeader: function(name, value) {
                    var lname = name.toLowerCase();
                    return state || (name = requestHeadersNames[lname] = requestHeadersNames[lname] || name, 
                    requestHeaders[name] = value), this;
                },
                overrideMimeType: function(type) {
                    return state || (s.mimeType = type), this;
                },
                statusCode: function(map) {
                    var code;
                    if (map) if (2 > state) for (code in map) statusCode[code] = [ statusCode[code], map[code] ]; else jqXHR.always(map[jqXHR.status]);
                    return this;
                },
                abort: function(statusText) {
                    var finalText = statusText || strAbort;
                    return transport && transport.abort(finalText), done(0, finalText), this;
                }
            };
            if (deferred.promise(jqXHR).complete = completeDeferred.add, jqXHR.success = jqXHR.done, 
            jqXHR.error = jqXHR.fail, s.url = ((url || s.url || ajaxLocation) + "").replace(rhash, "").replace(rprotocol, ajaxLocParts[1] + "//"), 
            s.type = options.method || options.type || s.method || s.type, s.dataTypes = jQuery.trim(s.dataType || "*").toLowerCase().match(core_rnotwhite) || [ "" ], 
            null == s.crossDomain && (parts = rurl.exec(s.url.toLowerCase()), s.crossDomain = !(!parts || parts[1] === ajaxLocParts[1] && parts[2] === ajaxLocParts[2] && (parts[3] || ("http:" === parts[1] ? "80" : "443")) === (ajaxLocParts[3] || ("http:" === ajaxLocParts[1] ? "80" : "443")))), 
            s.data && s.processData && "string" != typeof s.data && (s.data = jQuery.param(s.data, s.traditional)), 
            inspectPrefiltersOrTransports(prefilters, s, options, jqXHR), 2 === state) return jqXHR;
            fireGlobals = s.global, fireGlobals && 0 === jQuery.active++ && jQuery.event.trigger("ajaxStart"), 
            s.type = s.type.toUpperCase(), s.hasContent = !rnoContent.test(s.type), cacheURL = s.url, 
            s.hasContent || (s.data && (cacheURL = s.url += (ajax_rquery.test(cacheURL) ? "&" : "?") + s.data, 
            delete s.data), s.cache === !1 && (s.url = rts.test(cacheURL) ? cacheURL.replace(rts, "$1_=" + ajax_nonce++) : cacheURL + (ajax_rquery.test(cacheURL) ? "&" : "?") + "_=" + ajax_nonce++)), 
            s.ifModified && (jQuery.lastModified[cacheURL] && jqXHR.setRequestHeader("If-Modified-Since", jQuery.lastModified[cacheURL]), 
            jQuery.etag[cacheURL] && jqXHR.setRequestHeader("If-None-Match", jQuery.etag[cacheURL])), 
            (s.data && s.hasContent && s.contentType !== !1 || options.contentType) && jqXHR.setRequestHeader("Content-Type", s.contentType), 
            jqXHR.setRequestHeader("Accept", s.dataTypes[0] && s.accepts[s.dataTypes[0]] ? s.accepts[s.dataTypes[0]] + ("*" !== s.dataTypes[0] ? ", " + allTypes + "; q=0.01" : "") : s.accepts["*"]);
            for (i in s.headers) jqXHR.setRequestHeader(i, s.headers[i]);
            if (s.beforeSend && (s.beforeSend.call(callbackContext, jqXHR, s) === !1 || 2 === state)) return jqXHR.abort();
            strAbort = "abort";
            for (i in {
                success: 1,
                error: 1,
                complete: 1
            }) jqXHR[i](s[i]);
            if (transport = inspectPrefiltersOrTransports(transports, s, options, jqXHR)) {
                jqXHR.readyState = 1, fireGlobals && globalEventContext.trigger("ajaxSend", [ jqXHR, s ]), 
                s.async && s.timeout > 0 && (timeoutTimer = setTimeout(function() {
                    jqXHR.abort("timeout");
                }, s.timeout));
                try {
                    state = 1, transport.send(requestHeaders, done);
                } catch (e) {
                    if (!(2 > state)) throw e;
                    done(-1, e);
                }
            } else done(-1, "No Transport");
            return jqXHR;
        },
        getJSON: function(url, data, callback) {
            return jQuery.get(url, data, callback, "json");
        },
        getScript: function(url, callback) {
            return jQuery.get(url, undefined, callback, "script");
        }
    }), jQuery.each([ "get", "post" ], function(i, method) {
        jQuery[method] = function(url, data, callback, type) {
            return jQuery.isFunction(data) && (type = type || callback, callback = data, data = undefined), 
            jQuery.ajax({
                url: url,
                type: method,
                dataType: type,
                data: data,
                success: callback
            });
        };
    }), jQuery.ajaxSetup({
        accepts: {
            script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"
        },
        contents: {
            script: /(?:java|ecma)script/
        },
        converters: {
            "text script": function(text) {
                return jQuery.globalEval(text), text;
            }
        }
    }), jQuery.ajaxPrefilter("script", function(s) {
        s.cache === undefined && (s.cache = !1), s.crossDomain && (s.type = "GET", s.global = !1);
    }), jQuery.ajaxTransport("script", function(s) {
        if (s.crossDomain) {
            var script, head = document.head || jQuery("head")[0] || document.documentElement;
            return {
                send: function(_, callback) {
                    script = document.createElement("script"), script.async = !0, s.scriptCharset && (script.charset = s.scriptCharset), 
                    script.src = s.url, script.onload = script.onreadystatechange = function(_, isAbort) {
                        (isAbort || !script.readyState || /loaded|complete/.test(script.readyState)) && (script.onload = script.onreadystatechange = null, 
                        script.parentNode && script.parentNode.removeChild(script), script = null, isAbort || callback(200, "success"));
                    }, head.insertBefore(script, head.firstChild);
                },
                abort: function() {
                    script && script.onload(undefined, !0);
                }
            };
        }
    });
    var oldCallbacks = [], rjsonp = /(=)\?(?=&|$)|\?\?/;
    jQuery.ajaxSetup({
        jsonp: "callback",
        jsonpCallback: function() {
            var callback = oldCallbacks.pop() || jQuery.expando + "_" + ajax_nonce++;
            return this[callback] = !0, callback;
        }
    }), jQuery.ajaxPrefilter("json jsonp", function(s, originalSettings, jqXHR) {
        var callbackName, overwritten, responseContainer, jsonProp = s.jsonp !== !1 && (rjsonp.test(s.url) ? "url" : "string" == typeof s.data && !(s.contentType || "").indexOf("application/x-www-form-urlencoded") && rjsonp.test(s.data) && "data");
        return jsonProp || "jsonp" === s.dataTypes[0] ? (callbackName = s.jsonpCallback = jQuery.isFunction(s.jsonpCallback) ? s.jsonpCallback() : s.jsonpCallback, 
        jsonProp ? s[jsonProp] = s[jsonProp].replace(rjsonp, "$1" + callbackName) : s.jsonp !== !1 && (s.url += (ajax_rquery.test(s.url) ? "&" : "?") + s.jsonp + "=" + callbackName), 
        s.converters["script json"] = function() {
            return responseContainer || jQuery.error(callbackName + " was not called"), responseContainer[0];
        }, s.dataTypes[0] = "json", overwritten = window[callbackName], window[callbackName] = function() {
            responseContainer = arguments;
        }, jqXHR.always(function() {
            window[callbackName] = overwritten, s[callbackName] && (s.jsonpCallback = originalSettings.jsonpCallback, 
            oldCallbacks.push(callbackName)), responseContainer && jQuery.isFunction(overwritten) && overwritten(responseContainer[0]), 
            responseContainer = overwritten = undefined;
        }), "script") : void 0;
    });
    var xhrCallbacks, xhrSupported, xhrId = 0, xhrOnUnloadAbort = window.ActiveXObject && function() {
        var key;
        for (key in xhrCallbacks) xhrCallbacks[key](undefined, !0);
    };
    jQuery.ajaxSettings.xhr = window.ActiveXObject ? function() {
        return !this.isLocal && createStandardXHR() || createActiveXHR();
    } : createStandardXHR, xhrSupported = jQuery.ajaxSettings.xhr(), jQuery.support.cors = !!xhrSupported && "withCredentials" in xhrSupported, 
    xhrSupported = jQuery.support.ajax = !!xhrSupported, xhrSupported && jQuery.ajaxTransport(function(s) {
        if (!s.crossDomain || jQuery.support.cors) {
            var callback;
            return {
                send: function(headers, complete) {
                    var handle, i, xhr = s.xhr();
                    if (s.username ? xhr.open(s.type, s.url, s.async, s.username, s.password) : xhr.open(s.type, s.url, s.async), 
                    s.xhrFields) for (i in s.xhrFields) xhr[i] = s.xhrFields[i];
                    s.mimeType && xhr.overrideMimeType && xhr.overrideMimeType(s.mimeType), s.crossDomain || headers["X-Requested-With"] || (headers["X-Requested-With"] = "XMLHttpRequest");
                    try {
                        for (i in headers) xhr.setRequestHeader(i, headers[i]);
                    } catch (err) {}
                    xhr.send(s.hasContent && s.data || null), callback = function(_, isAbort) {
                        var status, responseHeaders, statusText, responses;
                        try {
                            if (callback && (isAbort || 4 === xhr.readyState)) if (callback = undefined, handle && (xhr.onreadystatechange = jQuery.noop, 
                            xhrOnUnloadAbort && delete xhrCallbacks[handle]), isAbort) 4 !== xhr.readyState && xhr.abort(); else {
                                responses = {}, status = xhr.status, responseHeaders = xhr.getAllResponseHeaders(), 
                                "string" == typeof xhr.responseText && (responses.text = xhr.responseText);
                                try {
                                    statusText = xhr.statusText;
                                } catch (e) {
                                    statusText = "";
                                }
                                status || !s.isLocal || s.crossDomain ? 1223 === status && (status = 204) : status = responses.text ? 200 : 404;
                            }
                        } catch (firefoxAccessException) {
                            isAbort || complete(-1, firefoxAccessException);
                        }
                        responses && complete(status, statusText, responses, responseHeaders);
                    }, s.async ? 4 === xhr.readyState ? setTimeout(callback) : (handle = ++xhrId, xhrOnUnloadAbort && (xhrCallbacks || (xhrCallbacks = {}, 
                    jQuery(window).unload(xhrOnUnloadAbort)), xhrCallbacks[handle] = callback), xhr.onreadystatechange = callback) : callback();
                },
                abort: function() {
                    callback && callback(undefined, !0);
                }
            };
        }
    });
    var fxNow, timerId, rfxtypes = /^(?:toggle|show|hide)$/, rfxnum = new RegExp("^(?:([+-])=|)(" + core_pnum + ")([a-z%]*)$", "i"), rrun = /queueHooks$/, animationPrefilters = [ defaultPrefilter ], tweeners = {
        "*": [ function(prop, value) {
            var tween = this.createTween(prop, value), target = tween.cur(), parts = rfxnum.exec(value), unit = parts && parts[3] || (jQuery.cssNumber[prop] ? "" : "px"), start = (jQuery.cssNumber[prop] || "px" !== unit && +target) && rfxnum.exec(jQuery.css(tween.elem, prop)), scale = 1, maxIterations = 20;
            if (start && start[3] !== unit) {
                unit = unit || start[3], parts = parts || [], start = +target || 1;
                do scale = scale || ".5", start /= scale, jQuery.style(tween.elem, prop, start + unit); while (scale !== (scale = tween.cur() / target) && 1 !== scale && --maxIterations);
            }
            return parts && (start = tween.start = +start || +target || 0, tween.unit = unit, 
            tween.end = parts[1] ? start + (parts[1] + 1) * parts[2] : +parts[2]), tween;
        } ]
    };
    jQuery.Animation = jQuery.extend(Animation, {
        tweener: function(props, callback) {
            jQuery.isFunction(props) ? (callback = props, props = [ "*" ]) : props = props.split(" ");
            for (var prop, index = 0, length = props.length; length > index; index++) prop = props[index], 
            tweeners[prop] = tweeners[prop] || [], tweeners[prop].unshift(callback);
        },
        prefilter: function(callback, prepend) {
            prepend ? animationPrefilters.unshift(callback) : animationPrefilters.push(callback);
        }
    }), jQuery.Tween = Tween, Tween.prototype = {
        constructor: Tween,
        init: function(elem, options, prop, end, easing, unit) {
            this.elem = elem, this.prop = prop, this.easing = easing || "swing", this.options = options, 
            this.start = this.now = this.cur(), this.end = end, this.unit = unit || (jQuery.cssNumber[prop] ? "" : "px");
        },
        cur: function() {
            var hooks = Tween.propHooks[this.prop];
            return hooks && hooks.get ? hooks.get(this) : Tween.propHooks._default.get(this);
        },
        run: function(percent) {
            var eased, hooks = Tween.propHooks[this.prop];
            return this.pos = eased = this.options.duration ? jQuery.easing[this.easing](percent, this.options.duration * percent, 0, 1, this.options.duration) : percent, 
            this.now = (this.end - this.start) * eased + this.start, this.options.step && this.options.step.call(this.elem, this.now, this), 
            hooks && hooks.set ? hooks.set(this) : Tween.propHooks._default.set(this), this;
        }
    }, Tween.prototype.init.prototype = Tween.prototype, Tween.propHooks = {
        _default: {
            get: function(tween) {
                var result;
                return null == tween.elem[tween.prop] || tween.elem.style && null != tween.elem.style[tween.prop] ? (result = jQuery.css(tween.elem, tween.prop, ""), 
                result && "auto" !== result ? result : 0) : tween.elem[tween.prop];
            },
            set: function(tween) {
                jQuery.fx.step[tween.prop] ? jQuery.fx.step[tween.prop](tween) : tween.elem.style && (null != tween.elem.style[jQuery.cssProps[tween.prop]] || jQuery.cssHooks[tween.prop]) ? jQuery.style(tween.elem, tween.prop, tween.now + tween.unit) : tween.elem[tween.prop] = tween.now;
            }
        }
    }, Tween.propHooks.scrollTop = Tween.propHooks.scrollLeft = {
        set: function(tween) {
            tween.elem.nodeType && tween.elem.parentNode && (tween.elem[tween.prop] = tween.now);
        }
    }, jQuery.each([ "toggle", "show", "hide" ], function(i, name) {
        var cssFn = jQuery.fn[name];
        jQuery.fn[name] = function(speed, easing, callback) {
            return null == speed || "boolean" == typeof speed ? cssFn.apply(this, arguments) : this.animate(genFx(name, !0), speed, easing, callback);
        };
    }), jQuery.fn.extend({
        fadeTo: function(speed, to, easing, callback) {
            return this.filter(isHidden).css("opacity", 0).show().end().animate({
                opacity: to
            }, speed, easing, callback);
        },
        animate: function(prop, speed, easing, callback) {
            var empty = jQuery.isEmptyObject(prop), optall = jQuery.speed(speed, easing, callback), doAnimation = function() {
                var anim = Animation(this, jQuery.extend({}, prop), optall);
                (empty || jQuery._data(this, "finish")) && anim.stop(!0);
            };
            return doAnimation.finish = doAnimation, empty || optall.queue === !1 ? this.each(doAnimation) : this.queue(optall.queue, doAnimation);
        },
        stop: function(type, clearQueue, gotoEnd) {
            var stopQueue = function(hooks) {
                var stop = hooks.stop;
                delete hooks.stop, stop(gotoEnd);
            };
            return "string" != typeof type && (gotoEnd = clearQueue, clearQueue = type, type = undefined), 
            clearQueue && type !== !1 && this.queue(type || "fx", []), this.each(function() {
                var dequeue = !0, index = null != type && type + "queueHooks", timers = jQuery.timers, data = jQuery._data(this);
                if (index) data[index] && data[index].stop && stopQueue(data[index]); else for (index in data) data[index] && data[index].stop && rrun.test(index) && stopQueue(data[index]);
                for (index = timers.length; index--; ) timers[index].elem !== this || null != type && timers[index].queue !== type || (timers[index].anim.stop(gotoEnd), 
                dequeue = !1, timers.splice(index, 1));
                (dequeue || !gotoEnd) && jQuery.dequeue(this, type);
            });
        },
        finish: function(type) {
            return type !== !1 && (type = type || "fx"), this.each(function() {
                var index, data = jQuery._data(this), queue = data[type + "queue"], hooks = data[type + "queueHooks"], timers = jQuery.timers, length = queue ? queue.length : 0;
                for (data.finish = !0, jQuery.queue(this, type, []), hooks && hooks.stop && hooks.stop.call(this, !0), 
                index = timers.length; index--; ) timers[index].elem === this && timers[index].queue === type && (timers[index].anim.stop(!0), 
                timers.splice(index, 1));
                for (index = 0; length > index; index++) queue[index] && queue[index].finish && queue[index].finish.call(this);
                delete data.finish;
            });
        }
    }), jQuery.each({
        slideDown: genFx("show"),
        slideUp: genFx("hide"),
        slideToggle: genFx("toggle"),
        fadeIn: {
            opacity: "show"
        },
        fadeOut: {
            opacity: "hide"
        },
        fadeToggle: {
            opacity: "toggle"
        }
    }, function(name, props) {
        jQuery.fn[name] = function(speed, easing, callback) {
            return this.animate(props, speed, easing, callback);
        };
    }), jQuery.speed = function(speed, easing, fn) {
        var opt = speed && "object" == typeof speed ? jQuery.extend({}, speed) : {
            complete: fn || !fn && easing || jQuery.isFunction(speed) && speed,
            duration: speed,
            easing: fn && easing || easing && !jQuery.isFunction(easing) && easing
        };
        return opt.duration = jQuery.fx.off ? 0 : "number" == typeof opt.duration ? opt.duration : opt.duration in jQuery.fx.speeds ? jQuery.fx.speeds[opt.duration] : jQuery.fx.speeds._default, 
        (null == opt.queue || opt.queue === !0) && (opt.queue = "fx"), opt.old = opt.complete, 
        opt.complete = function() {
            jQuery.isFunction(opt.old) && opt.old.call(this), opt.queue && jQuery.dequeue(this, opt.queue);
        }, opt;
    }, jQuery.easing = {
        linear: function(p) {
            return p;
        },
        swing: function(p) {
            return .5 - Math.cos(p * Math.PI) / 2;
        }
    }, jQuery.timers = [], jQuery.fx = Tween.prototype.init, jQuery.fx.tick = function() {
        var timer, timers = jQuery.timers, i = 0;
        for (fxNow = jQuery.now(); i < timers.length; i++) timer = timers[i], timer() || timers[i] !== timer || timers.splice(i--, 1);
        timers.length || jQuery.fx.stop(), fxNow = undefined;
    }, jQuery.fx.timer = function(timer) {
        timer() && jQuery.timers.push(timer) && jQuery.fx.start();
    }, jQuery.fx.interval = 13, jQuery.fx.start = function() {
        timerId || (timerId = setInterval(jQuery.fx.tick, jQuery.fx.interval));
    }, jQuery.fx.stop = function() {
        clearInterval(timerId), timerId = null;
    }, jQuery.fx.speeds = {
        slow: 600,
        fast: 200,
        _default: 400
    }, jQuery.fx.step = {}, jQuery.expr && jQuery.expr.filters && (jQuery.expr.filters.animated = function(elem) {
        return jQuery.grep(jQuery.timers, function(fn) {
            return elem === fn.elem;
        }).length;
    }), jQuery.fn.offset = function(options) {
        if (arguments.length) return options === undefined ? this : this.each(function(i) {
            jQuery.offset.setOffset(this, options, i);
        });
        var docElem, win, box = {
            top: 0,
            left: 0
        }, elem = this[0], doc = elem && elem.ownerDocument;
        if (doc) return docElem = doc.documentElement, jQuery.contains(docElem, elem) ? (typeof elem.getBoundingClientRect !== core_strundefined && (box = elem.getBoundingClientRect()), 
        win = getWindow(doc), {
            top: box.top + (win.pageYOffset || docElem.scrollTop) - (docElem.clientTop || 0),
            left: box.left + (win.pageXOffset || docElem.scrollLeft) - (docElem.clientLeft || 0)
        }) : box;
    }, jQuery.offset = {
        setOffset: function(elem, options, i) {
            var position = jQuery.css(elem, "position");
            "static" === position && (elem.style.position = "relative");
            var curTop, curLeft, curElem = jQuery(elem), curOffset = curElem.offset(), curCSSTop = jQuery.css(elem, "top"), curCSSLeft = jQuery.css(elem, "left"), calculatePosition = ("absolute" === position || "fixed" === position) && jQuery.inArray("auto", [ curCSSTop, curCSSLeft ]) > -1, props = {}, curPosition = {};
            calculatePosition ? (curPosition = curElem.position(), curTop = curPosition.top, 
            curLeft = curPosition.left) : (curTop = parseFloat(curCSSTop) || 0, curLeft = parseFloat(curCSSLeft) || 0), 
            jQuery.isFunction(options) && (options = options.call(elem, i, curOffset)), null != options.top && (props.top = options.top - curOffset.top + curTop), 
            null != options.left && (props.left = options.left - curOffset.left + curLeft), 
            "using" in options ? options.using.call(elem, props) : curElem.css(props);
        }
    }, jQuery.fn.extend({
        position: function() {
            if (this[0]) {
                var offsetParent, offset, parentOffset = {
                    top: 0,
                    left: 0
                }, elem = this[0];
                return "fixed" === jQuery.css(elem, "position") ? offset = elem.getBoundingClientRect() : (offsetParent = this.offsetParent(), 
                offset = this.offset(), jQuery.nodeName(offsetParent[0], "html") || (parentOffset = offsetParent.offset()), 
                parentOffset.top += jQuery.css(offsetParent[0], "borderTopWidth", !0), parentOffset.left += jQuery.css(offsetParent[0], "borderLeftWidth", !0)), 
                {
                    top: offset.top - parentOffset.top - jQuery.css(elem, "marginTop", !0),
                    left: offset.left - parentOffset.left - jQuery.css(elem, "marginLeft", !0)
                };
            }
        },
        offsetParent: function() {
            return this.map(function() {
                for (var offsetParent = this.offsetParent || docElem; offsetParent && !jQuery.nodeName(offsetParent, "html") && "static" === jQuery.css(offsetParent, "position"); ) offsetParent = offsetParent.offsetParent;
                return offsetParent || docElem;
            });
        }
    }), jQuery.each({
        scrollLeft: "pageXOffset",
        scrollTop: "pageYOffset"
    }, function(method, prop) {
        var top = /Y/.test(prop);
        jQuery.fn[method] = function(val) {
            return jQuery.access(this, function(elem, method, val) {
                var win = getWindow(elem);
                return val === undefined ? win ? prop in win ? win[prop] : win.document.documentElement[method] : elem[method] : void (win ? win.scrollTo(top ? jQuery(win).scrollLeft() : val, top ? val : jQuery(win).scrollTop()) : elem[method] = val);
            }, method, val, arguments.length, null);
        };
    }), jQuery.each({
        Height: "height",
        Width: "width"
    }, function(name, type) {
        jQuery.each({
            padding: "inner" + name,
            content: type,
            "": "outer" + name
        }, function(defaultExtra, funcName) {
            jQuery.fn[funcName] = function(margin, value) {
                var chainable = arguments.length && (defaultExtra || "boolean" != typeof margin), extra = defaultExtra || (margin === !0 || value === !0 ? "margin" : "border");
                return jQuery.access(this, function(elem, type, value) {
                    var doc;
                    return jQuery.isWindow(elem) ? elem.document.documentElement["client" + name] : 9 === elem.nodeType ? (doc = elem.documentElement, 
                    Math.max(elem.body["scroll" + name], doc["scroll" + name], elem.body["offset" + name], doc["offset" + name], doc["client" + name])) : value === undefined ? jQuery.css(elem, type, extra) : jQuery.style(elem, type, value, extra);
                }, type, chainable ? margin : undefined, chainable, null);
            };
        });
    }), jQuery.fn.size = function() {
        return this.length;
    }, jQuery.fn.andSelf = jQuery.fn.addBack, "object" == typeof module && module && "object" == typeof module.exports ? module.exports = jQuery : (window.jQuery = window.$ = jQuery, 
    "function" == typeof define && define.amd && define("jquery", [], function() {
        return jQuery;
    }));
}(window), function() {
    var n = this, t = n._, r = {}, e = Array.prototype, u = Object.prototype, i = Function.prototype, a = e.push, o = e.slice, c = e.concat, l = u.toString, f = u.hasOwnProperty, s = e.forEach, p = e.map, h = e.reduce, v = e.reduceRight, g = e.filter, d = e.every, m = e.some, y = e.indexOf, b = e.lastIndexOf, x = Array.isArray, w = Object.keys, _ = i.bind, j = function(n) {
        return n instanceof j ? n : this instanceof j ? void (this._wrapped = n) : new j(n);
    };
    "undefined" != typeof exports ? ("undefined" != typeof module && module.exports && (exports = module.exports = j), 
    exports._ = j) : n._ = j, j.VERSION = "1.6.0";
    var A = j.each = j.forEach = function(n, t, e) {
        if (null == n) return n;
        if (s && n.forEach === s) n.forEach(t, e); else if (n.length === +n.length) {
            for (var u = 0, i = n.length; i > u; u++) if (t.call(e, n[u], u, n) === r) return;
        } else for (var a = j.keys(n), u = 0, i = a.length; i > u; u++) if (t.call(e, n[a[u]], a[u], n) === r) return;
        return n;
    };
    j.map = j.collect = function(n, t, r) {
        var e = [];
        return null == n ? e : p && n.map === p ? n.map(t, r) : (A(n, function(n, u, i) {
            e.push(t.call(r, n, u, i));
        }), e);
    };
    var O = "Reduce of empty array with no initial value";
    j.reduce = j.foldl = j.inject = function(n, t, r, e) {
        var u = arguments.length > 2;
        if (null == n && (n = []), h && n.reduce === h) return e && (t = j.bind(t, e)), 
        u ? n.reduce(t, r) : n.reduce(t);
        if (A(n, function(n, i, a) {
            u ? r = t.call(e, r, n, i, a) : (r = n, u = !0);
        }), !u) throw new TypeError(O);
        return r;
    }, j.reduceRight = j.foldr = function(n, t, r, e) {
        var u = arguments.length > 2;
        if (null == n && (n = []), v && n.reduceRight === v) return e && (t = j.bind(t, e)), 
        u ? n.reduceRight(t, r) : n.reduceRight(t);
        var i = n.length;
        if (i !== +i) {
            var a = j.keys(n);
            i = a.length;
        }
        if (A(n, function(o, c, l) {
            c = a ? a[--i] : --i, u ? r = t.call(e, r, n[c], c, l) : (r = n[c], u = !0);
        }), !u) throw new TypeError(O);
        return r;
    }, j.find = j.detect = function(n, t, r) {
        var e;
        return k(n, function(n, u, i) {
            return t.call(r, n, u, i) ? (e = n, !0) : void 0;
        }), e;
    }, j.filter = j.select = function(n, t, r) {
        var e = [];
        return null == n ? e : g && n.filter === g ? n.filter(t, r) : (A(n, function(n, u, i) {
            t.call(r, n, u, i) && e.push(n);
        }), e);
    }, j.reject = function(n, t, r) {
        return j.filter(n, function(n, e, u) {
            return !t.call(r, n, e, u);
        }, r);
    }, j.every = j.all = function(n, t, e) {
        t || (t = j.identity);
        var u = !0;
        return null == n ? u : d && n.every === d ? n.every(t, e) : (A(n, function(n, i, a) {
            return (u = u && t.call(e, n, i, a)) ? void 0 : r;
        }), !!u);
    };
    var k = j.some = j.any = function(n, t, e) {
        t || (t = j.identity);
        var u = !1;
        return null == n ? u : m && n.some === m ? n.some(t, e) : (A(n, function(n, i, a) {
            return u || (u = t.call(e, n, i, a)) ? r : void 0;
        }), !!u);
    };
    j.contains = j.include = function(n, t) {
        return null == n ? !1 : y && n.indexOf === y ? -1 != n.indexOf(t) : k(n, function(n) {
            return n === t;
        });
    }, j.invoke = function(n, t) {
        var r = o.call(arguments, 2), e = j.isFunction(t);
        return j.map(n, function(n) {
            return (e ? t : n[t]).apply(n, r);
        });
    }, j.pluck = function(n, t) {
        return j.map(n, j.property(t));
    }, j.where = function(n, t) {
        return j.filter(n, j.matches(t));
    }, j.findWhere = function(n, t) {
        return j.find(n, j.matches(t));
    }, j.max = function(n, t, r) {
        if (!t && j.isArray(n) && n[0] === +n[0] && n.length < 65535) return Math.max.apply(Math, n);
        var e = -1 / 0, u = -1 / 0;
        return A(n, function(n, i, a) {
            var o = t ? t.call(r, n, i, a) : n;
            o > u && (e = n, u = o);
        }), e;
    }, j.min = function(n, t, r) {
        if (!t && j.isArray(n) && n[0] === +n[0] && n.length < 65535) return Math.min.apply(Math, n);
        var e = 1 / 0, u = 1 / 0;
        return A(n, function(n, i, a) {
            var o = t ? t.call(r, n, i, a) : n;
            u > o && (e = n, u = o);
        }), e;
    }, j.shuffle = function(n) {
        var t, r = 0, e = [];
        return A(n, function(n) {
            t = j.random(r++), e[r - 1] = e[t], e[t] = n;
        }), e;
    }, j.sample = function(n, t, r) {
        return null == t || r ? (n.length !== +n.length && (n = j.values(n)), n[j.random(n.length - 1)]) : j.shuffle(n).slice(0, Math.max(0, t));
    };
    var E = function(n) {
        return null == n ? j.identity : j.isFunction(n) ? n : j.property(n);
    };
    j.sortBy = function(n, t, r) {
        return t = E(t), j.pluck(j.map(n, function(n, e, u) {
            return {
                value: n,
                index: e,
                criteria: t.call(r, n, e, u)
            };
        }).sort(function(n, t) {
            var r = n.criteria, e = t.criteria;
            if (r !== e) {
                if (r > e || void 0 === r) return 1;
                if (e > r || void 0 === e) return -1;
            }
            return n.index - t.index;
        }), "value");
    };
    var F = function(n) {
        return function(t, r, e) {
            var u = {};
            return r = E(r), A(t, function(i, a) {
                var o = r.call(e, i, a, t);
                n(u, o, i);
            }), u;
        };
    };
    j.groupBy = F(function(n, t, r) {
        j.has(n, t) ? n[t].push(r) : n[t] = [ r ];
    }), j.indexBy = F(function(n, t, r) {
        n[t] = r;
    }), j.countBy = F(function(n, t) {
        j.has(n, t) ? n[t]++ : n[t] = 1;
    }), j.sortedIndex = function(n, t, r, e) {
        r = E(r);
        for (var u = r.call(e, t), i = 0, a = n.length; a > i; ) {
            var o = i + a >>> 1;
            r.call(e, n[o]) < u ? i = o + 1 : a = o;
        }
        return i;
    }, j.toArray = function(n) {
        return n ? j.isArray(n) ? o.call(n) : n.length === +n.length ? j.map(n, j.identity) : j.values(n) : [];
    }, j.size = function(n) {
        return null == n ? 0 : n.length === +n.length ? n.length : j.keys(n).length;
    }, j.first = j.head = j.take = function(n, t, r) {
        return null == n ? void 0 : null == t || r ? n[0] : 0 > t ? [] : o.call(n, 0, t);
    }, j.initial = function(n, t, r) {
        return o.call(n, 0, n.length - (null == t || r ? 1 : t));
    }, j.last = function(n, t, r) {
        return null == n ? void 0 : null == t || r ? n[n.length - 1] : o.call(n, Math.max(n.length - t, 0));
    }, j.rest = j.tail = j.drop = function(n, t, r) {
        return o.call(n, null == t || r ? 1 : t);
    }, j.compact = function(n) {
        return j.filter(n, j.identity);
    };
    var M = function(n, t, r) {
        return t && j.every(n, j.isArray) ? c.apply(r, n) : (A(n, function(n) {
            j.isArray(n) || j.isArguments(n) ? t ? a.apply(r, n) : M(n, t, r) : r.push(n);
        }), r);
    };
    j.flatten = function(n, t) {
        return M(n, t, []);
    }, j.without = function(n) {
        return j.difference(n, o.call(arguments, 1));
    }, j.partition = function(n, t) {
        var r = [], e = [];
        return A(n, function(n) {
            (t(n) ? r : e).push(n);
        }), [ r, e ];
    }, j.uniq = j.unique = function(n, t, r, e) {
        j.isFunction(t) && (e = r, r = t, t = !1);
        var u = r ? j.map(n, r, e) : n, i = [], a = [];
        return A(u, function(r, e) {
            (t ? e && a[a.length - 1] === r : j.contains(a, r)) || (a.push(r), i.push(n[e]));
        }), i;
    }, j.union = function() {
        return j.uniq(j.flatten(arguments, !0));
    }, j.intersection = function(n) {
        var t = o.call(arguments, 1);
        return j.filter(j.uniq(n), function(n) {
            return j.every(t, function(t) {
                return j.contains(t, n);
            });
        });
    }, j.difference = function(n) {
        var t = c.apply(e, o.call(arguments, 1));
        return j.filter(n, function(n) {
            return !j.contains(t, n);
        });
    }, j.zip = function() {
        for (var n = j.max(j.pluck(arguments, "length").concat(0)), t = new Array(n), r = 0; n > r; r++) t[r] = j.pluck(arguments, "" + r);
        return t;
    }, j.object = function(n, t) {
        if (null == n) return {};
        for (var r = {}, e = 0, u = n.length; u > e; e++) t ? r[n[e]] = t[e] : r[n[e][0]] = n[e][1];
        return r;
    }, j.indexOf = function(n, t, r) {
        if (null == n) return -1;
        var e = 0, u = n.length;
        if (r) {
            if ("number" != typeof r) return e = j.sortedIndex(n, t), n[e] === t ? e : -1;
            e = 0 > r ? Math.max(0, u + r) : r;
        }
        if (y && n.indexOf === y) return n.indexOf(t, r);
        for (;u > e; e++) if (n[e] === t) return e;
        return -1;
    }, j.lastIndexOf = function(n, t, r) {
        if (null == n) return -1;
        var e = null != r;
        if (b && n.lastIndexOf === b) return e ? n.lastIndexOf(t, r) : n.lastIndexOf(t);
        for (var u = e ? r : n.length; u--; ) if (n[u] === t) return u;
        return -1;
    }, j.range = function(n, t, r) {
        arguments.length <= 1 && (t = n || 0, n = 0), r = arguments[2] || 1;
        for (var e = Math.max(Math.ceil((t - n) / r), 0), u = 0, i = new Array(e); e > u; ) i[u++] = n, 
        n += r;
        return i;
    };
    var R = function() {};
    j.bind = function(n, t) {
        var r, e;
        if (_ && n.bind === _) return _.apply(n, o.call(arguments, 1));
        if (!j.isFunction(n)) throw new TypeError();
        return r = o.call(arguments, 2), e = function() {
            if (!(this instanceof e)) return n.apply(t, r.concat(o.call(arguments)));
            R.prototype = n.prototype;
            var u = new R();
            R.prototype = null;
            var i = n.apply(u, r.concat(o.call(arguments)));
            return Object(i) === i ? i : u;
        };
    }, j.partial = function(n) {
        var t = o.call(arguments, 1);
        return function() {
            for (var r = 0, e = t.slice(), u = 0, i = e.length; i > u; u++) e[u] === j && (e[u] = arguments[r++]);
            for (;r < arguments.length; ) e.push(arguments[r++]);
            return n.apply(this, e);
        };
    }, j.bindAll = function(n) {
        var t = o.call(arguments, 1);
        if (0 === t.length) throw new Error("bindAll must be passed function names");
        return A(t, function(t) {
            n[t] = j.bind(n[t], n);
        }), n;
    }, j.memoize = function(n, t) {
        var r = {};
        return t || (t = j.identity), function() {
            var e = t.apply(this, arguments);
            return j.has(r, e) ? r[e] : r[e] = n.apply(this, arguments);
        };
    }, j.delay = function(n, t) {
        var r = o.call(arguments, 2);
        return setTimeout(function() {
            return n.apply(null, r);
        }, t);
    }, j.defer = function(n) {
        return j.delay.apply(j, [ n, 1 ].concat(o.call(arguments, 1)));
    }, j.throttle = function(n, t, r) {
        var e, u, i, a = null, o = 0;
        r || (r = {});
        var c = function() {
            o = r.leading === !1 ? 0 : j.now(), a = null, i = n.apply(e, u), e = u = null;
        };
        return function() {
            var l = j.now();
            o || r.leading !== !1 || (o = l);
            var f = t - (l - o);
            return e = this, u = arguments, 0 >= f ? (clearTimeout(a), a = null, o = l, i = n.apply(e, u), 
            e = u = null) : a || r.trailing === !1 || (a = setTimeout(c, f)), i;
        };
    }, j.debounce = function(n, t, r) {
        var e, u, i, a, o, c = function() {
            var l = j.now() - a;
            t > l ? e = setTimeout(c, t - l) : (e = null, r || (o = n.apply(i, u), i = u = null));
        };
        return function() {
            i = this, u = arguments, a = j.now();
            var l = r && !e;
            return e || (e = setTimeout(c, t)), l && (o = n.apply(i, u), i = u = null), o;
        };
    }, j.once = function(n) {
        var t, r = !1;
        return function() {
            return r ? t : (r = !0, t = n.apply(this, arguments), n = null, t);
        };
    }, j.wrap = function(n, t) {
        return j.partial(t, n);
    }, j.compose = function() {
        var n = arguments;
        return function() {
            for (var t = arguments, r = n.length - 1; r >= 0; r--) t = [ n[r].apply(this, t) ];
            return t[0];
        };
    }, j.after = function(n, t) {
        return function() {
            return --n < 1 ? t.apply(this, arguments) : void 0;
        };
    }, j.keys = function(n) {
        if (!j.isObject(n)) return [];
        if (w) return w(n);
        var t = [];
        for (var r in n) j.has(n, r) && t.push(r);
        return t;
    }, j.values = function(n) {
        for (var t = j.keys(n), r = t.length, e = new Array(r), u = 0; r > u; u++) e[u] = n[t[u]];
        return e;
    }, j.pairs = function(n) {
        for (var t = j.keys(n), r = t.length, e = new Array(r), u = 0; r > u; u++) e[u] = [ t[u], n[t[u]] ];
        return e;
    }, j.invert = function(n) {
        for (var t = {}, r = j.keys(n), e = 0, u = r.length; u > e; e++) t[n[r[e]]] = r[e];
        return t;
    }, j.functions = j.methods = function(n) {
        var t = [];
        for (var r in n) j.isFunction(n[r]) && t.push(r);
        return t.sort();
    }, j.extend = function(n) {
        return A(o.call(arguments, 1), function(t) {
            if (t) for (var r in t) n[r] = t[r];
        }), n;
    }, j.pick = function(n) {
        var t = {}, r = c.apply(e, o.call(arguments, 1));
        return A(r, function(r) {
            r in n && (t[r] = n[r]);
        }), t;
    }, j.omit = function(n) {
        var t = {}, r = c.apply(e, o.call(arguments, 1));
        for (var u in n) j.contains(r, u) || (t[u] = n[u]);
        return t;
    }, j.defaults = function(n) {
        return A(o.call(arguments, 1), function(t) {
            if (t) for (var r in t) void 0 === n[r] && (n[r] = t[r]);
        }), n;
    }, j.clone = function(n) {
        return j.isObject(n) ? j.isArray(n) ? n.slice() : j.extend({}, n) : n;
    }, j.tap = function(n, t) {
        return t(n), n;
    };
    var S = function(n, t, r, e) {
        if (n === t) return 0 !== n || 1 / n == 1 / t;
        if (null == n || null == t) return n === t;
        n instanceof j && (n = n._wrapped), t instanceof j && (t = t._wrapped);
        var u = l.call(n);
        if (u != l.call(t)) return !1;
        switch (u) {
          case "[object String]":
            return n == String(t);

          case "[object Number]":
            return n != +n ? t != +t : 0 == n ? 1 / n == 1 / t : n == +t;

          case "[object Date]":
          case "[object Boolean]":
            return +n == +t;

          case "[object RegExp]":
            return n.source == t.source && n.global == t.global && n.multiline == t.multiline && n.ignoreCase == t.ignoreCase;
        }
        if ("object" != typeof n || "object" != typeof t) return !1;
        for (var i = r.length; i--; ) if (r[i] == n) return e[i] == t;
        var a = n.constructor, o = t.constructor;
        if (a !== o && !(j.isFunction(a) && a instanceof a && j.isFunction(o) && o instanceof o) && "constructor" in n && "constructor" in t) return !1;
        r.push(n), e.push(t);
        var c = 0, f = !0;
        if ("[object Array]" == u) {
            if (c = n.length, f = c == t.length) for (;c-- && (f = S(n[c], t[c], r, e)); ) ;
        } else {
            for (var s in n) if (j.has(n, s) && (c++, !(f = j.has(t, s) && S(n[s], t[s], r, e)))) break;
            if (f) {
                for (s in t) if (j.has(t, s) && !c--) break;
                f = !c;
            }
        }
        return r.pop(), e.pop(), f;
    };
    j.isEqual = function(n, t) {
        return S(n, t, [], []);
    }, j.isEmpty = function(n) {
        if (null == n) return !0;
        if (j.isArray(n) || j.isString(n)) return 0 === n.length;
        for (var t in n) if (j.has(n, t)) return !1;
        return !0;
    }, j.isElement = function(n) {
        return !(!n || 1 !== n.nodeType);
    }, j.isArray = x || function(n) {
        return "[object Array]" == l.call(n);
    }, j.isObject = function(n) {
        return n === Object(n);
    }, A([ "Arguments", "Function", "String", "Number", "Date", "RegExp" ], function(n) {
        j["is" + n] = function(t) {
            return l.call(t) == "[object " + n + "]";
        };
    }), j.isArguments(arguments) || (j.isArguments = function(n) {
        return !(!n || !j.has(n, "callee"));
    }), "function" != typeof /./ && (j.isFunction = function(n) {
        return "function" == typeof n;
    }), j.isFinite = function(n) {
        return isFinite(n) && !isNaN(parseFloat(n));
    }, j.isNaN = function(n) {
        return j.isNumber(n) && n != +n;
    }, j.isBoolean = function(n) {
        return n === !0 || n === !1 || "[object Boolean]" == l.call(n);
    }, j.isNull = function(n) {
        return null === n;
    }, j.isUndefined = function(n) {
        return void 0 === n;
    }, j.has = function(n, t) {
        return f.call(n, t);
    }, j.noConflict = function() {
        return n._ = t, this;
    }, j.identity = function(n) {
        return n;
    }, j.constant = function(n) {
        return function() {
            return n;
        };
    }, j.property = function(n) {
        return function(t) {
            return t[n];
        };
    }, j.matches = function(n) {
        return function(t) {
            if (t === n) return !0;
            for (var r in n) if (n[r] !== t[r]) return !1;
            return !0;
        };
    }, j.times = function(n, t, r) {
        for (var e = Array(Math.max(0, n)), u = 0; n > u; u++) e[u] = t.call(r, u);
        return e;
    }, j.random = function(n, t) {
        return null == t && (t = n, n = 0), n + Math.floor(Math.random() * (t - n + 1));
    }, j.now = Date.now || function() {
        return new Date().getTime();
    };
    var T = {
        escape: {
            "&": "&amp;",
            "<": "&lt;",
            ">": "&gt;",
            '"': "&quot;",
            "'": "&#x27;"
        }
    };
    T.unescape = j.invert(T.escape);
    var I = {
        escape: new RegExp("[" + j.keys(T.escape).join("") + "]", "g"),
        unescape: new RegExp("(" + j.keys(T.unescape).join("|") + ")", "g")
    };
    j.each([ "escape", "unescape" ], function(n) {
        j[n] = function(t) {
            return null == t ? "" : ("" + t).replace(I[n], function(t) {
                return T[n][t];
            });
        };
    }), j.result = function(n, t) {
        if (null == n) return void 0;
        var r = n[t];
        return j.isFunction(r) ? r.call(n) : r;
    }, j.mixin = function(n) {
        A(j.functions(n), function(t) {
            var r = j[t] = n[t];
            j.prototype[t] = function() {
                var n = [ this._wrapped ];
                return a.apply(n, arguments), z.call(this, r.apply(j, n));
            };
        });
    };
    var N = 0;
    j.uniqueId = function(n) {
        var t = ++N + "";
        return n ? n + t : t;
    }, j.templateSettings = {
        evaluate: /<%([\s\S]+?)%>/g,
        interpolate: /<%=([\s\S]+?)%>/g,
        escape: /<%-([\s\S]+?)%>/g
    };
    var q = /(.)^/, B = {
        "'": "'",
        "\\": "\\",
        "\r": "r",
        "\n": "n",
        " ": "t",
        "\u2028": "u2028",
        "\u2029": "u2029"
    }, D = /\\|'|\r|\n|\t|\u2028|\u2029/g;
    j.template = function(n, t, r) {
        var e;
        r = j.defaults({}, r, j.templateSettings);
        var u = new RegExp([ (r.escape || q).source, (r.interpolate || q).source, (r.evaluate || q).source ].join("|") + "|$", "g"), i = 0, a = "__p+='";
        n.replace(u, function(t, r, e, u, o) {
            return a += n.slice(i, o).replace(D, function(n) {
                return "\\" + B[n];
            }), r && (a += "'+\n((__t=(" + r + "))==null?'':_.escape(__t))+\n'"), e && (a += "'+\n((__t=(" + e + "))==null?'':__t)+\n'"), 
            u && (a += "';\n" + u + "\n__p+='"), i = o + t.length, t;
        }), a += "';\n", r.variable || (a = "with(obj||{}){\n" + a + "}\n"), a = "var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};\n" + a + "return __p;\n";
        try {
            e = new Function(r.variable || "obj", "_", a);
        } catch (o) {
            throw o.source = a, o;
        }
        if (t) return e(t, j);
        var c = function(n) {
            return e.call(this, n, j);
        };
        return c.source = "function(" + (r.variable || "obj") + "){\n" + a + "}", c;
    }, j.chain = function(n) {
        return j(n).chain();
    };
    var z = function(n) {
        return this._chain ? j(n).chain() : n;
    };
    j.mixin(j), A([ "pop", "push", "reverse", "shift", "sort", "splice", "unshift" ], function(n) {
        var t = e[n];
        j.prototype[n] = function() {
            var r = this._wrapped;
            return t.apply(r, arguments), "shift" != n && "splice" != n || 0 !== r.length || delete r[0], 
            z.call(this, r);
        };
    }), A([ "concat", "join", "slice" ], function(n) {
        var t = e[n];
        j.prototype[n] = function() {
            return z.call(this, t.apply(this._wrapped, arguments));
        };
    }), j.extend(j.prototype, {
        chain: function() {
            return this._chain = !0, this;
        },
        value: function() {
            return this._wrapped;
        }
    }), "function" == typeof define && define.amd && define("underscore", [], function() {
        return j;
    });
}.call(this), function(window, document, undefined) {
    "use strict";
    function minErr(module) {
        return function() {
            var message, i, code = arguments[0], prefix = "[" + (module ? module + ":" : "") + code + "] ", template = arguments[1], templateArgs = arguments, stringify = function(obj) {
                return "function" == typeof obj ? obj.toString().replace(/ \{[\s\S]*$/, "") : "undefined" == typeof obj ? "undefined" : "string" != typeof obj ? JSON.stringify(obj) : obj;
            };
            for (message = prefix + template.replace(/\{\d+\}/g, function(match) {
                var arg, index = +match.slice(1, -1);
                return index + 2 < templateArgs.length ? (arg = templateArgs[index + 2], "function" == typeof arg ? arg.toString().replace(/ ?\{[\s\S]*$/, "") : "undefined" == typeof arg ? "undefined" : "string" != typeof arg ? toJson(arg) : arg) : match;
            }), message = message + "\nhttp://errors.angularjs.org/1.2.9/" + (module ? module + "/" : "") + code, 
            i = 2; i < arguments.length; i++) message = message + (2 == i ? "?" : "&") + "p" + (i - 2) + "=" + encodeURIComponent(stringify(arguments[i]));
            return new Error(message);
        };
    }
    function isArrayLike(obj) {
        if (null == obj || isWindow(obj)) return !1;
        var length = obj.length;
        return 1 === obj.nodeType && length ? !0 : isString(obj) || isArray(obj) || 0 === length || "number" == typeof length && length > 0 && length - 1 in obj;
    }
    function forEach(obj, iterator, context) {
        var key;
        if (obj) if (isFunction(obj)) for (key in obj) "prototype" == key || "length" == key || "name" == key || obj.hasOwnProperty && !obj.hasOwnProperty(key) || iterator.call(context, obj[key], key); else if (obj.forEach && obj.forEach !== forEach) obj.forEach(iterator, context); else if (isArrayLike(obj)) for (key = 0; key < obj.length; key++) iterator.call(context, obj[key], key); else for (key in obj) obj.hasOwnProperty(key) && iterator.call(context, obj[key], key);
        return obj;
    }
    function sortedKeys(obj) {
        var keys = [];
        for (var key in obj) obj.hasOwnProperty(key) && keys.push(key);
        return keys.sort();
    }
    function forEachSorted(obj, iterator, context) {
        for (var keys = sortedKeys(obj), i = 0; i < keys.length; i++) iterator.call(context, obj[keys[i]], keys[i]);
        return keys;
    }
    function reverseParams(iteratorFn) {
        return function(value, key) {
            iteratorFn(key, value);
        };
    }
    function nextUid() {
        for (var digit, index = uid.length; index; ) {
            if (index--, digit = uid[index].charCodeAt(0), 57 == digit) return uid[index] = "A", 
            uid.join("");
            if (90 != digit) return uid[index] = String.fromCharCode(digit + 1), uid.join("");
            uid[index] = "0";
        }
        return uid.unshift("0"), uid.join("");
    }
    function setHashKey(obj, h) {
        h ? obj.$$hashKey = h : delete obj.$$hashKey;
    }
    function extend(dst) {
        var h = dst.$$hashKey;
        return forEach(arguments, function(obj) {
            obj !== dst && forEach(obj, function(value, key) {
                dst[key] = value;
            });
        }), setHashKey(dst, h), dst;
    }
    function int(str) {
        return parseInt(str, 10);
    }
    function inherit(parent, extra) {
        return extend(new (extend(function() {}, {
            prototype: parent
        }))(), extra);
    }
    function noop() {}
    function identity($) {
        return $;
    }
    function valueFn(value) {
        return function() {
            return value;
        };
    }
    function isUndefined(value) {
        return "undefined" == typeof value;
    }
    function isDefined(value) {
        return "undefined" != typeof value;
    }
    function isObject(value) {
        return null != value && "object" == typeof value;
    }
    function isString(value) {
        return "string" == typeof value;
    }
    function isNumber(value) {
        return "number" == typeof value;
    }
    function isDate(value) {
        return "[object Date]" === toString.call(value);
    }
    function isArray(value) {
        return "[object Array]" === toString.call(value);
    }
    function isFunction(value) {
        return "function" == typeof value;
    }
    function isRegExp(value) {
        return "[object RegExp]" === toString.call(value);
    }
    function isWindow(obj) {
        return obj && obj.document && obj.location && obj.alert && obj.setInterval;
    }
    function isScope(obj) {
        return obj && obj.$evalAsync && obj.$watch;
    }
    function isFile(obj) {
        return "[object File]" === toString.call(obj);
    }
    function isElement(node) {
        return !(!node || !(node.nodeName || node.on && node.find));
    }
    function map(obj, iterator, context) {
        var results = [];
        return forEach(obj, function(value, index, list) {
            results.push(iterator.call(context, value, index, list));
        }), results;
    }
    function includes(array, obj) {
        return -1 != indexOf(array, obj);
    }
    function indexOf(array, obj) {
        if (array.indexOf) return array.indexOf(obj);
        for (var i = 0; i < array.length; i++) if (obj === array[i]) return i;
        return -1;
    }
    function arrayRemove(array, value) {
        var index = indexOf(array, value);
        return index >= 0 && array.splice(index, 1), value;
    }
    function copy(source, destination) {
        if (isWindow(source) || isScope(source)) throw ngMinErr("cpws", "Can't copy! Making copies of Window or Scope instances is not supported.");
        if (destination) {
            if (source === destination) throw ngMinErr("cpi", "Can't copy! Source and destination are identical.");
            if (isArray(source)) {
                destination.length = 0;
                for (var i = 0; i < source.length; i++) destination.push(copy(source[i]));
            } else {
                var h = destination.$$hashKey;
                forEach(destination, function(value, key) {
                    delete destination[key];
                });
                for (var key in source) destination[key] = copy(source[key]);
                setHashKey(destination, h);
            }
        } else destination = source, source && (isArray(source) ? destination = copy(source, []) : isDate(source) ? destination = new Date(source.getTime()) : isRegExp(source) ? destination = new RegExp(source.source) : isObject(source) && (destination = copy(source, {})));
        return destination;
    }
    function shallowCopy(src, dst) {
        dst = dst || {};
        for (var key in src) src.hasOwnProperty(key) && "$" !== key.charAt(0) && "$" !== key.charAt(1) && (dst[key] = src[key]);
        return dst;
    }
    function equals(o1, o2) {
        if (o1 === o2) return !0;
        if (null === o1 || null === o2) return !1;
        if (o1 !== o1 && o2 !== o2) return !0;
        var length, key, keySet, t1 = typeof o1, t2 = typeof o2;
        if (t1 == t2 && "object" == t1) {
            if (!isArray(o1)) {
                if (isDate(o1)) return isDate(o2) && o1.getTime() == o2.getTime();
                if (isRegExp(o1) && isRegExp(o2)) return o1.toString() == o2.toString();
                if (isScope(o1) || isScope(o2) || isWindow(o1) || isWindow(o2) || isArray(o2)) return !1;
                keySet = {};
                for (key in o1) if ("$" !== key.charAt(0) && !isFunction(o1[key])) {
                    if (!equals(o1[key], o2[key])) return !1;
                    keySet[key] = !0;
                }
                for (key in o2) if (!keySet.hasOwnProperty(key) && "$" !== key.charAt(0) && o2[key] !== undefined && !isFunction(o2[key])) return !1;
                return !0;
            }
            if (!isArray(o2)) return !1;
            if ((length = o1.length) == o2.length) {
                for (key = 0; length > key; key++) if (!equals(o1[key], o2[key])) return !1;
                return !0;
            }
        }
        return !1;
    }
    function csp() {
        return document.securityPolicy && document.securityPolicy.isActive || document.querySelector && !(!document.querySelector("[ng-csp]") && !document.querySelector("[data-ng-csp]"));
    }
    function concat(array1, array2, index) {
        return array1.concat(slice.call(array2, index));
    }
    function sliceArgs(args, startIndex) {
        return slice.call(args, startIndex || 0);
    }
    function bind(self, fn) {
        var curryArgs = arguments.length > 2 ? sliceArgs(arguments, 2) : [];
        return !isFunction(fn) || fn instanceof RegExp ? fn : curryArgs.length ? function() {
            return arguments.length ? fn.apply(self, curryArgs.concat(slice.call(arguments, 0))) : fn.apply(self, curryArgs);
        } : function() {
            return arguments.length ? fn.apply(self, arguments) : fn.call(self);
        };
    }
    function toJsonReplacer(key, value) {
        var val = value;
        return "string" == typeof key && "$" === key.charAt(0) ? val = undefined : isWindow(value) ? val = "$WINDOW" : value && document === value ? val = "$DOCUMENT" : isScope(value) && (val = "$SCOPE"), 
        val;
    }
    function toJson(obj, pretty) {
        return "undefined" == typeof obj ? undefined : JSON.stringify(obj, toJsonReplacer, pretty ? "  " : null);
    }
    function fromJson(json) {
        return isString(json) ? JSON.parse(json) : json;
    }
    function toBoolean(value) {
        if ("function" == typeof value) value = !0; else if (value && 0 !== value.length) {
            var v = lowercase("" + value);
            value = !("f" == v || "0" == v || "false" == v || "no" == v || "n" == v || "[]" == v);
        } else value = !1;
        return value;
    }
    function startingTag(element) {
        element = jqLite(element).clone();
        try {
            element.empty();
        } catch (e) {}
        var TEXT_NODE = 3, elemHtml = jqLite("<div>").append(element).html();
        try {
            return element[0].nodeType === TEXT_NODE ? lowercase(elemHtml) : elemHtml.match(/^(<[^>]+>)/)[1].replace(/^<([\w\-]+)/, function(match, nodeName) {
                return "<" + lowercase(nodeName);
            });
        } catch (e) {
            return lowercase(elemHtml);
        }
    }
    function tryDecodeURIComponent(value) {
        try {
            return decodeURIComponent(value);
        } catch (e) {}
    }
    function parseKeyValue(keyValue) {
        var key_value, key, obj = {};
        return forEach((keyValue || "").split("&"), function(keyValue) {
            if (keyValue && (key_value = keyValue.split("="), key = tryDecodeURIComponent(key_value[0]), 
            isDefined(key))) {
                var val = isDefined(key_value[1]) ? tryDecodeURIComponent(key_value[1]) : !0;
                obj[key] ? isArray(obj[key]) ? obj[key].push(val) : obj[key] = [ obj[key], val ] : obj[key] = val;
            }
        }), obj;
    }
    function toKeyValue(obj) {
        var parts = [];
        return forEach(obj, function(value, key) {
            isArray(value) ? forEach(value, function(arrayValue) {
                parts.push(encodeUriQuery(key, !0) + (arrayValue === !0 ? "" : "=" + encodeUriQuery(arrayValue, !0)));
            }) : parts.push(encodeUriQuery(key, !0) + (value === !0 ? "" : "=" + encodeUriQuery(value, !0)));
        }), parts.length ? parts.join("&") : "";
    }
    function encodeUriSegment(val) {
        return encodeUriQuery(val, !0).replace(/%26/gi, "&").replace(/%3D/gi, "=").replace(/%2B/gi, "+");
    }
    function encodeUriQuery(val, pctEncodeSpaces) {
        return encodeURIComponent(val).replace(/%40/gi, "@").replace(/%3A/gi, ":").replace(/%24/g, "$").replace(/%2C/gi, ",").replace(/%20/g, pctEncodeSpaces ? "%20" : "+");
    }
    function angularInit(element, bootstrap) {
        function append(element) {
            element && elements.push(element);
        }
        var appElement, module, elements = [ element ], names = [ "ng:app", "ng-app", "x-ng-app", "data-ng-app" ], NG_APP_CLASS_REGEXP = /\sng[:\-]app(:\s*([\w\d_]+);?)?\s/;
        forEach(names, function(name) {
            names[name] = !0, append(document.getElementById(name)), name = name.replace(":", "\\:"), 
            element.querySelectorAll && (forEach(element.querySelectorAll("." + name), append), 
            forEach(element.querySelectorAll("." + name + "\\:"), append), forEach(element.querySelectorAll("[" + name + "]"), append));
        }), forEach(elements, function(element) {
            if (!appElement) {
                var className = " " + element.className + " ", match = NG_APP_CLASS_REGEXP.exec(className);
                match ? (appElement = element, module = (match[2] || "").replace(/\s+/g, ",")) : forEach(element.attributes, function(attr) {
                    !appElement && names[attr.name] && (appElement = element, module = attr.value);
                });
            }
        }), appElement && bootstrap(appElement, module ? [ module ] : []);
    }
    function bootstrap(element, modules) {
        var doBootstrap = function() {
            if (element = jqLite(element), element.injector()) {
                var tag = element[0] === document ? "document" : startingTag(element);
                throw ngMinErr("btstrpd", "App Already Bootstrapped with this Element '{0}'", tag);
            }
            modules = modules || [], modules.unshift([ "$provide", function($provide) {
                $provide.value("$rootElement", element);
            } ]), modules.unshift("ng");
            var injector = createInjector(modules);
            return injector.invoke([ "$rootScope", "$rootElement", "$compile", "$injector", "$animate", function(scope, element, compile, injector) {
                scope.$apply(function() {
                    element.data("$injector", injector), compile(element)(scope);
                });
            } ]), injector;
        }, NG_DEFER_BOOTSTRAP = /^NG_DEFER_BOOTSTRAP!/;
        return window && !NG_DEFER_BOOTSTRAP.test(window.name) ? doBootstrap() : (window.name = window.name.replace(NG_DEFER_BOOTSTRAP, ""), 
        void (angular.resumeBootstrap = function(extraModules) {
            forEach(extraModules, function(module) {
                modules.push(module);
            }), doBootstrap();
        }));
    }
    function snake_case(name, separator) {
        return separator = separator || "_", name.replace(SNAKE_CASE_REGEXP, function(letter, pos) {
            return (pos ? separator : "") + letter.toLowerCase();
        });
    }
    function bindJQuery() {
        jQuery = window.jQuery, jQuery ? (jqLite = jQuery, extend(jQuery.fn, {
            scope: JQLitePrototype.scope,
            isolateScope: JQLitePrototype.isolateScope,
            controller: JQLitePrototype.controller,
            injector: JQLitePrototype.injector,
            inheritedData: JQLitePrototype.inheritedData
        }), jqLitePatchJQueryRemove("remove", !0, !0, !1), jqLitePatchJQueryRemove("empty", !1, !1, !1), 
        jqLitePatchJQueryRemove("html", !1, !1, !0)) : jqLite = JQLite, angular.element = jqLite;
    }
    function assertArg(arg, name, reason) {
        if (!arg) throw ngMinErr("areq", "Argument '{0}' is {1}", name || "?", reason || "required");
        return arg;
    }
    function assertArgFn(arg, name, acceptArrayAnnotation) {
        return acceptArrayAnnotation && isArray(arg) && (arg = arg[arg.length - 1]), assertArg(isFunction(arg), name, "not a function, got " + (arg && "object" == typeof arg ? arg.constructor.name || "Object" : typeof arg)), 
        arg;
    }
    function assertNotHasOwnProperty(name, context) {
        if ("hasOwnProperty" === name) throw ngMinErr("badname", "hasOwnProperty is not a valid {0} name", context);
    }
    function getter(obj, path, bindFnToScope) {
        if (!path) return obj;
        for (var key, keys = path.split("."), lastInstance = obj, len = keys.length, i = 0; len > i; i++) key = keys[i], 
        obj && (obj = (lastInstance = obj)[key]);
        return !bindFnToScope && isFunction(obj) ? bind(lastInstance, obj) : obj;
    }
    function getBlockElements(nodes) {
        var startNode = nodes[0], endNode = nodes[nodes.length - 1];
        if (startNode === endNode) return jqLite(startNode);
        var element = startNode, elements = [ element ];
        do {
            if (element = element.nextSibling, !element) break;
            elements.push(element);
        } while (element !== endNode);
        return jqLite(elements);
    }
    function setupModuleLoader(window) {
        function ensure(obj, name, factory) {
            return obj[name] || (obj[name] = factory());
        }
        var $injectorMinErr = minErr("$injector"), ngMinErr = minErr("ng"), angular = ensure(window, "angular", Object);
        return angular.$$minErr = angular.$$minErr || minErr, ensure(angular, "module", function() {
            var modules = {};
            return function(name, requires, configFn) {
                var assertNotHasOwnProperty = function(name, context) {
                    if ("hasOwnProperty" === name) throw ngMinErr("badname", "hasOwnProperty is not a valid {0} name", context);
                };
                return assertNotHasOwnProperty(name, "module"), requires && modules.hasOwnProperty(name) && (modules[name] = null), 
                ensure(modules, name, function() {
                    function invokeLater(provider, method, insertMethod) {
                        return function() {
                            return invokeQueue[insertMethod || "push"]([ provider, method, arguments ]), moduleInstance;
                        };
                    }
                    if (!requires) throw $injectorMinErr("nomod", "Module '{0}' is not available! You either misspelled the module name or forgot to load it. If registering a module ensure that you specify the dependencies as the second argument.", name);
                    var invokeQueue = [], runBlocks = [], config = invokeLater("$injector", "invoke"), moduleInstance = {
                        _invokeQueue: invokeQueue,
                        _runBlocks: runBlocks,
                        requires: requires,
                        name: name,
                        provider: invokeLater("$provide", "provider"),
                        factory: invokeLater("$provide", "factory"),
                        service: invokeLater("$provide", "service"),
                        value: invokeLater("$provide", "value"),
                        constant: invokeLater("$provide", "constant", "unshift"),
                        animation: invokeLater("$animateProvider", "register"),
                        filter: invokeLater("$filterProvider", "register"),
                        controller: invokeLater("$controllerProvider", "register"),
                        directive: invokeLater("$compileProvider", "directive"),
                        config: config,
                        run: function(block) {
                            return runBlocks.push(block), this;
                        }
                    };
                    return configFn && config(configFn), moduleInstance;
                });
            };
        });
    }
    function publishExternalAPI(angular) {
        extend(angular, {
            bootstrap: bootstrap,
            copy: copy,
            extend: extend,
            equals: equals,
            element: jqLite,
            forEach: forEach,
            injector: createInjector,
            noop: noop,
            bind: bind,
            toJson: toJson,
            fromJson: fromJson,
            identity: identity,
            isUndefined: isUndefined,
            isDefined: isDefined,
            isString: isString,
            isFunction: isFunction,
            isObject: isObject,
            isNumber: isNumber,
            isElement: isElement,
            isArray: isArray,
            version: version,
            isDate: isDate,
            lowercase: lowercase,
            uppercase: uppercase,
            callbacks: {
                counter: 0
            },
            $$minErr: minErr,
            $$csp: csp
        }), angularModule = setupModuleLoader(window);
        try {
            angularModule("ngLocale");
        } catch (e) {
            angularModule("ngLocale", []).provider("$locale", $LocaleProvider);
        }
        angularModule("ng", [ "ngLocale" ], [ "$provide", function($provide) {
            $provide.provider({
                $$sanitizeUri: $$SanitizeUriProvider
            }), $provide.provider("$compile", $CompileProvider).directive({
                a: htmlAnchorDirective,
                input: inputDirective,
                textarea: inputDirective,
                form: formDirective,
                script: scriptDirective,
                select: selectDirective,
                style: styleDirective,
                option: optionDirective,
                ngBind: ngBindDirective,
                ngBindHtml: ngBindHtmlDirective,
                ngBindTemplate: ngBindTemplateDirective,
                ngClass: ngClassDirective,
                ngClassEven: ngClassEvenDirective,
                ngClassOdd: ngClassOddDirective,
                ngCloak: ngCloakDirective,
                ngController: ngControllerDirective,
                ngForm: ngFormDirective,
                ngHide: ngHideDirective,
                ngIf: ngIfDirective,
                ngInclude: ngIncludeDirective,
                ngInit: ngInitDirective,
                ngNonBindable: ngNonBindableDirective,
                ngPluralize: ngPluralizeDirective,
                ngRepeat: ngRepeatDirective,
                ngShow: ngShowDirective,
                ngStyle: ngStyleDirective,
                ngSwitch: ngSwitchDirective,
                ngSwitchWhen: ngSwitchWhenDirective,
                ngSwitchDefault: ngSwitchDefaultDirective,
                ngOptions: ngOptionsDirective,
                ngTransclude: ngTranscludeDirective,
                ngModel: ngModelDirective,
                ngList: ngListDirective,
                ngChange: ngChangeDirective,
                required: requiredDirective,
                ngRequired: requiredDirective,
                ngValue: ngValueDirective
            }).directive({
                ngInclude: ngIncludeFillContentDirective
            }).directive(ngAttributeAliasDirectives).directive(ngEventDirectives), $provide.provider({
                $anchorScroll: $AnchorScrollProvider,
                $animate: $AnimateProvider,
                $browser: $BrowserProvider,
                $cacheFactory: $CacheFactoryProvider,
                $controller: $ControllerProvider,
                $document: $DocumentProvider,
                $exceptionHandler: $ExceptionHandlerProvider,
                $filter: $FilterProvider,
                $interpolate: $InterpolateProvider,
                $interval: $IntervalProvider,
                $http: $HttpProvider,
                $httpBackend: $HttpBackendProvider,
                $location: $LocationProvider,
                $log: $LogProvider,
                $parse: $ParseProvider,
                $rootScope: $RootScopeProvider,
                $q: $QProvider,
                $sce: $SceProvider,
                $sceDelegate: $SceDelegateProvider,
                $sniffer: $SnifferProvider,
                $templateCache: $TemplateCacheProvider,
                $timeout: $TimeoutProvider,
                $window: $WindowProvider
            });
        } ]);
    }
    function jqNextId() {
        return ++jqId;
    }
    function camelCase(name) {
        return name.replace(SPECIAL_CHARS_REGEXP, function(_, separator, letter, offset) {
            return offset ? letter.toUpperCase() : letter;
        }).replace(MOZ_HACK_REGEXP, "Moz$1");
    }
    function jqLitePatchJQueryRemove(name, dispatchThis, filterElems, getterIfNoArguments) {
        function removePatch(param) {
            var set, setIndex, setLength, element, childIndex, childLength, children, list = filterElems && param ? [ this.filter(param) ] : [ this ], fireEvent = dispatchThis;
            if (!getterIfNoArguments || null != param) for (;list.length; ) for (set = list.shift(), 
            setIndex = 0, setLength = set.length; setLength > setIndex; setIndex++) for (element = jqLite(set[setIndex]), 
            fireEvent ? element.triggerHandler("$destroy") : fireEvent = !fireEvent, childIndex = 0, 
            childLength = (children = element.children()).length; childLength > childIndex; childIndex++) list.push(jQuery(children[childIndex]));
            return originalJqFn.apply(this, arguments);
        }
        var originalJqFn = jQuery.fn[name];
        originalJqFn = originalJqFn.$original || originalJqFn, removePatch.$original = originalJqFn, 
        jQuery.fn[name] = removePatch;
    }
    function JQLite(element) {
        if (element instanceof JQLite) return element;
        if (!(this instanceof JQLite)) {
            if (isString(element) && "<" != element.charAt(0)) throw jqLiteMinErr("nosel", "Looking up elements via selectors is not supported by jqLite! See: http://docs.angularjs.org/api/angular.element");
            return new JQLite(element);
        }
        if (isString(element)) {
            var div = document.createElement("div");
            div.innerHTML = "<div>&#160;</div>" + element, div.removeChild(div.firstChild), 
            jqLiteAddNodes(this, div.childNodes);
            var fragment = jqLite(document.createDocumentFragment());
            fragment.append(this);
        } else jqLiteAddNodes(this, element);
    }
    function jqLiteClone(element) {
        return element.cloneNode(!0);
    }
    function jqLiteDealoc(element) {
        jqLiteRemoveData(element);
        for (var i = 0, children = element.childNodes || []; i < children.length; i++) jqLiteDealoc(children[i]);
    }
    function jqLiteOff(element, type, fn, unsupported) {
        if (isDefined(unsupported)) throw jqLiteMinErr("offargs", "jqLite#off() does not support the `selector` argument");
        var events = jqLiteExpandoStore(element, "events"), handle = jqLiteExpandoStore(element, "handle");
        handle && (isUndefined(type) ? forEach(events, function(eventHandler, type) {
            removeEventListenerFn(element, type, eventHandler), delete events[type];
        }) : forEach(type.split(" "), function(type) {
            isUndefined(fn) ? (removeEventListenerFn(element, type, events[type]), delete events[type]) : arrayRemove(events[type] || [], fn);
        }));
    }
    function jqLiteRemoveData(element, name) {
        var expandoId = element[jqName], expandoStore = jqCache[expandoId];
        if (expandoStore) {
            if (name) return void delete jqCache[expandoId].data[name];
            expandoStore.handle && (expandoStore.events.$destroy && expandoStore.handle({}, "$destroy"), 
            jqLiteOff(element)), delete jqCache[expandoId], element[jqName] = undefined;
        }
    }
    function jqLiteExpandoStore(element, key, value) {
        var expandoId = element[jqName], expandoStore = jqCache[expandoId || -1];
        return isDefined(value) ? (expandoStore || (element[jqName] = expandoId = jqNextId(), 
        expandoStore = jqCache[expandoId] = {}), void (expandoStore[key] = value)) : expandoStore && expandoStore[key];
    }
    function jqLiteData(element, key, value) {
        var data = jqLiteExpandoStore(element, "data"), isSetter = isDefined(value), keyDefined = !isSetter && isDefined(key), isSimpleGetter = keyDefined && !isObject(key);
        if (data || isSimpleGetter || jqLiteExpandoStore(element, "data", data = {}), isSetter) data[key] = value; else {
            if (!keyDefined) return data;
            if (isSimpleGetter) return data && data[key];
            extend(data, key);
        }
    }
    function jqLiteHasClass(element, selector) {
        return element.getAttribute ? (" " + (element.getAttribute("class") || "") + " ").replace(/[\n\t]/g, " ").indexOf(" " + selector + " ") > -1 : !1;
    }
    function jqLiteRemoveClass(element, cssClasses) {
        cssClasses && element.setAttribute && forEach(cssClasses.split(" "), function(cssClass) {
            element.setAttribute("class", trim((" " + (element.getAttribute("class") || "") + " ").replace(/[\n\t]/g, " ").replace(" " + trim(cssClass) + " ", " ")));
        });
    }
    function jqLiteAddClass(element, cssClasses) {
        if (cssClasses && element.setAttribute) {
            var existingClasses = (" " + (element.getAttribute("class") || "") + " ").replace(/[\n\t]/g, " ");
            forEach(cssClasses.split(" "), function(cssClass) {
                cssClass = trim(cssClass), -1 === existingClasses.indexOf(" " + cssClass + " ") && (existingClasses += cssClass + " ");
            }), element.setAttribute("class", trim(existingClasses));
        }
    }
    function jqLiteAddNodes(root, elements) {
        if (elements) {
            elements = elements.nodeName || !isDefined(elements.length) || isWindow(elements) ? [ elements ] : elements;
            for (var i = 0; i < elements.length; i++) root.push(elements[i]);
        }
    }
    function jqLiteController(element, name) {
        return jqLiteInheritedData(element, "$" + (name || "ngController") + "Controller");
    }
    function jqLiteInheritedData(element, name, value) {
        element = jqLite(element), 9 == element[0].nodeType && (element = element.find("html"));
        for (var names = isArray(name) ? name : [ name ]; element.length; ) {
            for (var i = 0, ii = names.length; ii > i; i++) if ((value = element.data(names[i])) !== undefined) return value;
            element = element.parent();
        }
    }
    function jqLiteEmpty(element) {
        for (var i = 0, childNodes = element.childNodes; i < childNodes.length; i++) jqLiteDealoc(childNodes[i]);
        for (;element.firstChild; ) element.removeChild(element.firstChild);
    }
    function getBooleanAttrName(element, name) {
        var booleanAttr = BOOLEAN_ATTR[name.toLowerCase()];
        return booleanAttr && BOOLEAN_ELEMENTS[element.nodeName] && booleanAttr;
    }
    function createEventHandler(element, events) {
        var eventHandler = function(event, type) {
            if (event.preventDefault || (event.preventDefault = function() {
                event.returnValue = !1;
            }), event.stopPropagation || (event.stopPropagation = function() {
                event.cancelBubble = !0;
            }), event.target || (event.target = event.srcElement || document), isUndefined(event.defaultPrevented)) {
                var prevent = event.preventDefault;
                event.preventDefault = function() {
                    event.defaultPrevented = !0, prevent.call(event);
                }, event.defaultPrevented = !1;
            }
            event.isDefaultPrevented = function() {
                return event.defaultPrevented || event.returnValue === !1;
            };
            var eventHandlersCopy = shallowCopy(events[type || event.type] || []);
            forEach(eventHandlersCopy, function(fn) {
                fn.call(element, event);
            }), 8 >= msie ? (event.preventDefault = null, event.stopPropagation = null, event.isDefaultPrevented = null) : (delete event.preventDefault, 
            delete event.stopPropagation, delete event.isDefaultPrevented);
        };
        return eventHandler.elem = element, eventHandler;
    }
    function hashKey(obj) {
        var key, objType = typeof obj;
        return "object" == objType && null !== obj ? "function" == typeof (key = obj.$$hashKey) ? key = obj.$$hashKey() : key === undefined && (key = obj.$$hashKey = nextUid()) : key = obj, 
        objType + ":" + key;
    }
    function HashMap(array) {
        forEach(array, this.put, this);
    }
    function annotate(fn) {
        var $inject, fnText, argDecl, last;
        return "function" == typeof fn ? ($inject = fn.$inject) || ($inject = [], fn.length && (fnText = fn.toString().replace(STRIP_COMMENTS, ""), 
        argDecl = fnText.match(FN_ARGS), forEach(argDecl[1].split(FN_ARG_SPLIT), function(arg) {
            arg.replace(FN_ARG, function(all, underscore, name) {
                $inject.push(name);
            });
        })), fn.$inject = $inject) : isArray(fn) ? (last = fn.length - 1, assertArgFn(fn[last], "fn"), 
        $inject = fn.slice(0, last)) : assertArgFn(fn, "fn", !0), $inject;
    }
    function createInjector(modulesToLoad) {
        function supportObject(delegate) {
            return function(key, value) {
                return isObject(key) ? void forEach(key, reverseParams(delegate)) : delegate(key, value);
            };
        }
        function provider(name, provider_) {
            if (assertNotHasOwnProperty(name, "service"), (isFunction(provider_) || isArray(provider_)) && (provider_ = providerInjector.instantiate(provider_)), 
            !provider_.$get) throw $injectorMinErr("pget", "Provider '{0}' must define $get factory method.", name);
            return providerCache[name + providerSuffix] = provider_;
        }
        function factory(name, factoryFn) {
            return provider(name, {
                $get: factoryFn
            });
        }
        function service(name, constructor) {
            return factory(name, [ "$injector", function($injector) {
                return $injector.instantiate(constructor);
            } ]);
        }
        function value(name, val) {
            return factory(name, valueFn(val));
        }
        function constant(name, value) {
            assertNotHasOwnProperty(name, "constant"), providerCache[name] = value, instanceCache[name] = value;
        }
        function decorator(serviceName, decorFn) {
            var origProvider = providerInjector.get(serviceName + providerSuffix), orig$get = origProvider.$get;
            origProvider.$get = function() {
                var origInstance = instanceInjector.invoke(orig$get, origProvider);
                return instanceInjector.invoke(decorFn, null, {
                    $delegate: origInstance
                });
            };
        }
        function loadModules(modulesToLoad) {
            var moduleFn, invokeQueue, i, ii, runBlocks = [];
            return forEach(modulesToLoad, function(module) {
                if (!loadedModules.get(module)) {
                    loadedModules.put(module, !0);
                    try {
                        if (isString(module)) for (moduleFn = angularModule(module), runBlocks = runBlocks.concat(loadModules(moduleFn.requires)).concat(moduleFn._runBlocks), 
                        invokeQueue = moduleFn._invokeQueue, i = 0, ii = invokeQueue.length; ii > i; i++) {
                            var invokeArgs = invokeQueue[i], provider = providerInjector.get(invokeArgs[0]);
                            provider[invokeArgs[1]].apply(provider, invokeArgs[2]);
                        } else isFunction(module) ? runBlocks.push(providerInjector.invoke(module)) : isArray(module) ? runBlocks.push(providerInjector.invoke(module)) : assertArgFn(module, "module");
                    } catch (e) {
                        throw isArray(module) && (module = module[module.length - 1]), e.message && e.stack && -1 == e.stack.indexOf(e.message) && (e = e.message + "\n" + e.stack), 
                        $injectorMinErr("modulerr", "Failed to instantiate module {0} due to:\n{1}", module, e.stack || e.message || e);
                    }
                }
            }), runBlocks;
        }
        function createInternalInjector(cache, factory) {
            function getService(serviceName) {
                if (cache.hasOwnProperty(serviceName)) {
                    if (cache[serviceName] === INSTANTIATING) throw $injectorMinErr("cdep", "Circular dependency found: {0}", path.join(" <- "));
                    return cache[serviceName];
                }
                try {
                    return path.unshift(serviceName), cache[serviceName] = INSTANTIATING, cache[serviceName] = factory(serviceName);
                } catch (err) {
                    throw cache[serviceName] === INSTANTIATING && delete cache[serviceName], err;
                } finally {
                    path.shift();
                }
            }
            function invoke(fn, self, locals) {
                var length, i, key, args = [], $inject = annotate(fn);
                for (i = 0, length = $inject.length; length > i; i++) {
                    if (key = $inject[i], "string" != typeof key) throw $injectorMinErr("itkn", "Incorrect injection token! Expected service name as string, got {0}", key);
                    args.push(locals && locals.hasOwnProperty(key) ? locals[key] : getService(key));
                }
                return fn.$inject || (fn = fn[length]), fn.apply(self, args);
            }
            function instantiate(Type, locals) {
                var instance, returnedValue, Constructor = function() {};
                return Constructor.prototype = (isArray(Type) ? Type[Type.length - 1] : Type).prototype, 
                instance = new Constructor(), returnedValue = invoke(Type, instance, locals), isObject(returnedValue) || isFunction(returnedValue) ? returnedValue : instance;
            }
            return {
                invoke: invoke,
                instantiate: instantiate,
                get: getService,
                annotate: annotate,
                has: function(name) {
                    return providerCache.hasOwnProperty(name + providerSuffix) || cache.hasOwnProperty(name);
                }
            };
        }
        var INSTANTIATING = {}, providerSuffix = "Provider", path = [], loadedModules = new HashMap(), providerCache = {
            $provide: {
                provider: supportObject(provider),
                factory: supportObject(factory),
                service: supportObject(service),
                value: supportObject(value),
                constant: supportObject(constant),
                decorator: decorator
            }
        }, providerInjector = providerCache.$injector = createInternalInjector(providerCache, function() {
            throw $injectorMinErr("unpr", "Unknown provider: {0}", path.join(" <- "));
        }), instanceCache = {}, instanceInjector = instanceCache.$injector = createInternalInjector(instanceCache, function(servicename) {
            var provider = providerInjector.get(servicename + providerSuffix);
            return instanceInjector.invoke(provider.$get, provider);
        });
        return forEach(loadModules(modulesToLoad), function(fn) {
            instanceInjector.invoke(fn || noop);
        }), instanceInjector;
    }
    function $AnchorScrollProvider() {
        var autoScrollingEnabled = !0;
        this.disableAutoScrolling = function() {
            autoScrollingEnabled = !1;
        }, this.$get = [ "$window", "$location", "$rootScope", function($window, $location, $rootScope) {
            function getFirstAnchor(list) {
                var result = null;
                return forEach(list, function(element) {
                    result || "a" !== lowercase(element.nodeName) || (result = element);
                }), result;
            }
            function scroll() {
                var elm, hash = $location.hash();
                hash ? (elm = document.getElementById(hash)) ? elm.scrollIntoView() : (elm = getFirstAnchor(document.getElementsByName(hash))) ? elm.scrollIntoView() : "top" === hash && $window.scrollTo(0, 0) : $window.scrollTo(0, 0);
            }
            var document = $window.document;
            return autoScrollingEnabled && $rootScope.$watch(function() {
                return $location.hash();
            }, function() {
                $rootScope.$evalAsync(scroll);
            }), scroll;
        } ];
    }
    function Browser(window, document, $log, $sniffer) {
        function completeOutstandingRequest(fn) {
            try {
                fn.apply(null, sliceArgs(arguments, 1));
            } finally {
                if (outstandingRequestCount--, 0 === outstandingRequestCount) for (;outstandingRequestCallbacks.length; ) try {
                    outstandingRequestCallbacks.pop()();
                } catch (e) {
                    $log.error(e);
                }
            }
        }
        function startPoller(interval, setTimeout) {
            !function check() {
                forEach(pollFns, function(pollFn) {
                    pollFn();
                }), pollTimeout = setTimeout(check, interval);
            }();
        }
        function fireUrlChange() {
            newLocation = null, lastBrowserUrl != self.url() && (lastBrowserUrl = self.url(), 
            forEach(urlChangeListeners, function(listener) {
                listener(self.url());
            }));
        }
        var self = this, rawDocument = document[0], location = window.location, history = window.history, setTimeout = window.setTimeout, clearTimeout = window.clearTimeout, pendingDeferIds = {};
        self.isMock = !1;
        var outstandingRequestCount = 0, outstandingRequestCallbacks = [];
        self.$$completeOutstandingRequest = completeOutstandingRequest, self.$$incOutstandingRequestCount = function() {
            outstandingRequestCount++;
        }, self.notifyWhenNoOutstandingRequests = function(callback) {
            forEach(pollFns, function(pollFn) {
                pollFn();
            }), 0 === outstandingRequestCount ? callback() : outstandingRequestCallbacks.push(callback);
        };
        var pollTimeout, pollFns = [];
        self.addPollFn = function(fn) {
            return isUndefined(pollTimeout) && startPoller(100, setTimeout), pollFns.push(fn), 
            fn;
        };
        var lastBrowserUrl = location.href, baseElement = document.find("base"), newLocation = null;
        self.url = function(url, replace) {
            if (location !== window.location && (location = window.location), history !== window.history && (history = window.history), 
            url) {
                if (lastBrowserUrl == url) return;
                return lastBrowserUrl = url, $sniffer.history ? replace ? history.replaceState(null, "", url) : (history.pushState(null, "", url), 
                baseElement.attr("href", baseElement.attr("href"))) : (newLocation = url, replace ? location.replace(url) : location.href = url), 
                self;
            }
            return newLocation || location.href.replace(/%27/g, "'");
        };
        var urlChangeListeners = [], urlChangeInit = !1;
        self.onUrlChange = function(callback) {
            return urlChangeInit || ($sniffer.history && jqLite(window).on("popstate", fireUrlChange), 
            $sniffer.hashchange ? jqLite(window).on("hashchange", fireUrlChange) : self.addPollFn(fireUrlChange), 
            urlChangeInit = !0), urlChangeListeners.push(callback), callback;
        }, self.baseHref = function() {
            var href = baseElement.attr("href");
            return href ? href.replace(/^(https?\:)?\/\/[^\/]*/, "") : "";
        };
        var lastCookies = {}, lastCookieString = "", cookiePath = self.baseHref();
        self.cookies = function(name, value) {
            var cookieLength, cookieArray, cookie, i, index;
            if (!name) {
                if (rawDocument.cookie !== lastCookieString) for (lastCookieString = rawDocument.cookie, 
                cookieArray = lastCookieString.split("; "), lastCookies = {}, i = 0; i < cookieArray.length; i++) cookie = cookieArray[i], 
                index = cookie.indexOf("="), index > 0 && (name = unescape(cookie.substring(0, index)), 
                lastCookies[name] === undefined && (lastCookies[name] = unescape(cookie.substring(index + 1))));
                return lastCookies;
            }
            value === undefined ? rawDocument.cookie = escape(name) + "=;path=" + cookiePath + ";expires=Thu, 01 Jan 1970 00:00:00 GMT" : isString(value) && (cookieLength = (rawDocument.cookie = escape(name) + "=" + escape(value) + ";path=" + cookiePath).length + 1, 
            cookieLength > 4096 && $log.warn("Cookie '" + name + "' possibly not set or overflowed because it was too large (" + cookieLength + " > 4096 bytes)!"));
        }, self.defer = function(fn, delay) {
            var timeoutId;
            return outstandingRequestCount++, timeoutId = setTimeout(function() {
                delete pendingDeferIds[timeoutId], completeOutstandingRequest(fn);
            }, delay || 0), pendingDeferIds[timeoutId] = !0, timeoutId;
        }, self.defer.cancel = function(deferId) {
            return pendingDeferIds[deferId] ? (delete pendingDeferIds[deferId], clearTimeout(deferId), 
            completeOutstandingRequest(noop), !0) : !1;
        };
    }
    function $BrowserProvider() {
        this.$get = [ "$window", "$log", "$sniffer", "$document", function($window, $log, $sniffer, $document) {
            return new Browser($window, $document, $log, $sniffer);
        } ];
    }
    function $CacheFactoryProvider() {
        this.$get = function() {
            function cacheFactory(cacheId, options) {
                function refresh(entry) {
                    entry != freshEnd && (staleEnd ? staleEnd == entry && (staleEnd = entry.n) : staleEnd = entry, 
                    link(entry.n, entry.p), link(entry, freshEnd), freshEnd = entry, freshEnd.n = null);
                }
                function link(nextEntry, prevEntry) {
                    nextEntry != prevEntry && (nextEntry && (nextEntry.p = prevEntry), prevEntry && (prevEntry.n = nextEntry));
                }
                if (cacheId in caches) throw minErr("$cacheFactory")("iid", "CacheId '{0}' is already taken!", cacheId);
                var size = 0, stats = extend({}, options, {
                    id: cacheId
                }), data = {}, capacity = options && options.capacity || Number.MAX_VALUE, lruHash = {}, freshEnd = null, staleEnd = null;
                return caches[cacheId] = {
                    put: function(key, value) {
                        var lruEntry = lruHash[key] || (lruHash[key] = {
                            key: key
                        });
                        return refresh(lruEntry), isUndefined(value) ? void 0 : (key in data || size++, 
                        data[key] = value, size > capacity && this.remove(staleEnd.key), value);
                    },
                    get: function(key) {
                        var lruEntry = lruHash[key];
                        if (lruEntry) return refresh(lruEntry), data[key];
                    },
                    remove: function(key) {
                        var lruEntry = lruHash[key];
                        lruEntry && (lruEntry == freshEnd && (freshEnd = lruEntry.p), lruEntry == staleEnd && (staleEnd = lruEntry.n), 
                        link(lruEntry.n, lruEntry.p), delete lruHash[key], delete data[key], size--);
                    },
                    removeAll: function() {
                        data = {}, size = 0, lruHash = {}, freshEnd = staleEnd = null;
                    },
                    destroy: function() {
                        data = null, stats = null, lruHash = null, delete caches[cacheId];
                    },
                    info: function() {
                        return extend({}, stats, {
                            size: size
                        });
                    }
                };
            }
            var caches = {};
            return cacheFactory.info = function() {
                var info = {};
                return forEach(caches, function(cache, cacheId) {
                    info[cacheId] = cache.info();
                }), info;
            }, cacheFactory.get = function(cacheId) {
                return caches[cacheId];
            }, cacheFactory;
        };
    }
    function $TemplateCacheProvider() {
        this.$get = [ "$cacheFactory", function($cacheFactory) {
            return $cacheFactory("templates");
        } ];
    }
    function $CompileProvider($provide, $$sanitizeUriProvider) {
        var hasDirectives = {}, Suffix = "Directive", COMMENT_DIRECTIVE_REGEXP = /^\s*directive\:\s*([\d\w\-_]+)\s+(.*)$/, CLASS_DIRECTIVE_REGEXP = /(([\d\w\-_]+)(?:\:([^;]+))?;?)/, EVENT_HANDLER_ATTR_REGEXP = /^(on[a-z]+|formaction)$/;
        this.directive = function registerDirective(name, directiveFactory) {
            return assertNotHasOwnProperty(name, "directive"), isString(name) ? (assertArg(directiveFactory, "directiveFactory"), 
            hasDirectives.hasOwnProperty(name) || (hasDirectives[name] = [], $provide.factory(name + Suffix, [ "$injector", "$exceptionHandler", function($injector, $exceptionHandler) {
                var directives = [];
                return forEach(hasDirectives[name], function(directiveFactory, index) {
                    try {
                        var directive = $injector.invoke(directiveFactory);
                        isFunction(directive) ? directive = {
                            compile: valueFn(directive)
                        } : !directive.compile && directive.link && (directive.compile = valueFn(directive.link)), 
                        directive.priority = directive.priority || 0, directive.index = index, directive.name = directive.name || name, 
                        directive.require = directive.require || directive.controller && directive.name, 
                        directive.restrict = directive.restrict || "A", directives.push(directive);
                    } catch (e) {
                        $exceptionHandler(e);
                    }
                }), directives;
            } ])), hasDirectives[name].push(directiveFactory)) : forEach(name, reverseParams(registerDirective)), 
            this;
        }, this.aHrefSanitizationWhitelist = function(regexp) {
            return isDefined(regexp) ? ($$sanitizeUriProvider.aHrefSanitizationWhitelist(regexp), 
            this) : $$sanitizeUriProvider.aHrefSanitizationWhitelist();
        }, this.imgSrcSanitizationWhitelist = function(regexp) {
            return isDefined(regexp) ? ($$sanitizeUriProvider.imgSrcSanitizationWhitelist(regexp), 
            this) : $$sanitizeUriProvider.imgSrcSanitizationWhitelist();
        }, this.$get = [ "$injector", "$interpolate", "$exceptionHandler", "$http", "$templateCache", "$parse", "$controller", "$rootScope", "$document", "$sce", "$animate", "$$sanitizeUri", function($injector, $interpolate, $exceptionHandler, $http, $templateCache, $parse, $controller, $rootScope, $document, $sce, $animate, $$sanitizeUri) {
            function compile($compileNodes, transcludeFn, maxPriority, ignoreDirective, previousCompileContext) {
                $compileNodes instanceof jqLite || ($compileNodes = jqLite($compileNodes)), forEach($compileNodes, function(node, index) {
                    3 == node.nodeType && node.nodeValue.match(/\S+/) && ($compileNodes[index] = node = jqLite(node).wrap("<span></span>").parent()[0]);
                });
                var compositeLinkFn = compileNodes($compileNodes, transcludeFn, $compileNodes, maxPriority, ignoreDirective, previousCompileContext);
                return safeAddClass($compileNodes, "ng-scope"), function(scope, cloneConnectFn, transcludeControllers) {
                    assertArg(scope, "scope");
                    var $linkNode = cloneConnectFn ? JQLitePrototype.clone.call($compileNodes) : $compileNodes;
                    forEach(transcludeControllers, function(instance, name) {
                        $linkNode.data("$" + name + "Controller", instance);
                    });
                    for (var i = 0, ii = $linkNode.length; ii > i; i++) {
                        var node = $linkNode[i], nodeType = node.nodeType;
                        (1 === nodeType || 9 === nodeType) && $linkNode.eq(i).data("$scope", scope);
                    }
                    return cloneConnectFn && cloneConnectFn($linkNode, scope), compositeLinkFn && compositeLinkFn(scope, $linkNode, $linkNode), 
                    $linkNode;
                };
            }
            function safeAddClass($element, className) {
                try {
                    $element.addClass(className);
                } catch (e) {}
            }
            function compileNodes(nodeList, transcludeFn, $rootElement, maxPriority, ignoreDirective, previousCompileContext) {
                function compositeLinkFn(scope, nodeList, $rootElement, boundTranscludeFn) {
                    var nodeLinkFn, childLinkFn, node, $node, childScope, childTranscludeFn, i, ii, n, nodeListLength = nodeList.length, stableNodeList = new Array(nodeListLength);
                    for (i = 0; nodeListLength > i; i++) stableNodeList[i] = nodeList[i];
                    for (i = 0, n = 0, ii = linkFns.length; ii > i; n++) node = stableNodeList[n], nodeLinkFn = linkFns[i++], 
                    childLinkFn = linkFns[i++], $node = jqLite(node), nodeLinkFn ? (nodeLinkFn.scope ? (childScope = scope.$new(), 
                    $node.data("$scope", childScope)) : childScope = scope, childTranscludeFn = nodeLinkFn.transclude, 
                    childTranscludeFn || !boundTranscludeFn && transcludeFn ? nodeLinkFn(childLinkFn, childScope, node, $rootElement, createBoundTranscludeFn(scope, childTranscludeFn || transcludeFn)) : nodeLinkFn(childLinkFn, childScope, node, $rootElement, boundTranscludeFn)) : childLinkFn && childLinkFn(scope, node.childNodes, undefined, boundTranscludeFn);
                }
                for (var attrs, directives, nodeLinkFn, childNodes, childLinkFn, linkFnFound, linkFns = [], i = 0; i < nodeList.length; i++) attrs = new Attributes(), 
                directives = collectDirectives(nodeList[i], [], attrs, 0 === i ? maxPriority : undefined, ignoreDirective), 
                nodeLinkFn = directives.length ? applyDirectivesToNode(directives, nodeList[i], attrs, transcludeFn, $rootElement, null, [], [], previousCompileContext) : null, 
                nodeLinkFn && nodeLinkFn.scope && safeAddClass(jqLite(nodeList[i]), "ng-scope"), 
                childLinkFn = nodeLinkFn && nodeLinkFn.terminal || !(childNodes = nodeList[i].childNodes) || !childNodes.length ? null : compileNodes(childNodes, nodeLinkFn ? nodeLinkFn.transclude : transcludeFn), 
                linkFns.push(nodeLinkFn, childLinkFn), linkFnFound = linkFnFound || nodeLinkFn || childLinkFn, 
                previousCompileContext = null;
                return linkFnFound ? compositeLinkFn : null;
            }
            function createBoundTranscludeFn(scope, transcludeFn) {
                return function(transcludedScope, cloneFn, controllers) {
                    var scopeCreated = !1;
                    transcludedScope || (transcludedScope = scope.$new(), transcludedScope.$$transcluded = !0, 
                    scopeCreated = !0);
                    var clone = transcludeFn(transcludedScope, cloneFn, controllers);
                    return scopeCreated && clone.on("$destroy", bind(transcludedScope, transcludedScope.$destroy)), 
                    clone;
                };
            }
            function collectDirectives(node, directives, attrs, maxPriority, ignoreDirective) {
                var match, className, nodeType = node.nodeType, attrsMap = attrs.$attr;
                switch (nodeType) {
                  case 1:
                    addDirective(directives, directiveNormalize(nodeName_(node).toLowerCase()), "E", maxPriority, ignoreDirective);
                    for (var attr, name, nName, ngAttrName, value, nAttrs = node.attributes, j = 0, jj = nAttrs && nAttrs.length; jj > j; j++) {
                        var attrStartName = !1, attrEndName = !1;
                        if (attr = nAttrs[j], !msie || msie >= 8 || attr.specified) {
                            name = attr.name, ngAttrName = directiveNormalize(name), NG_ATTR_BINDING.test(ngAttrName) && (name = snake_case(ngAttrName.substr(6), "-"));
                            var directiveNName = ngAttrName.replace(/(Start|End)$/, "");
                            ngAttrName === directiveNName + "Start" && (attrStartName = name, attrEndName = name.substr(0, name.length - 5) + "end", 
                            name = name.substr(0, name.length - 6)), nName = directiveNormalize(name.toLowerCase()), 
                            attrsMap[nName] = name, attrs[nName] = value = trim(attr.value), getBooleanAttrName(node, nName) && (attrs[nName] = !0), 
                            addAttrInterpolateDirective(node, directives, value, nName), addDirective(directives, nName, "A", maxPriority, ignoreDirective, attrStartName, attrEndName);
                        }
                    }
                    if (className = node.className, isString(className) && "" !== className) for (;match = CLASS_DIRECTIVE_REGEXP.exec(className); ) nName = directiveNormalize(match[2]), 
                    addDirective(directives, nName, "C", maxPriority, ignoreDirective) && (attrs[nName] = trim(match[3])), 
                    className = className.substr(match.index + match[0].length);
                    break;

                  case 3:
                    addTextInterpolateDirective(directives, node.nodeValue);
                    break;

                  case 8:
                    try {
                        match = COMMENT_DIRECTIVE_REGEXP.exec(node.nodeValue), match && (nName = directiveNormalize(match[1]), 
                        addDirective(directives, nName, "M", maxPriority, ignoreDirective) && (attrs[nName] = trim(match[2])));
                    } catch (e) {}
                }
                return directives.sort(byPriority), directives;
            }
            function groupScan(node, attrStart, attrEnd) {
                var nodes = [], depth = 0;
                if (attrStart && node.hasAttribute && node.hasAttribute(attrStart)) {
                    do {
                        if (!node) throw $compileMinErr("uterdir", "Unterminated attribute, found '{0}' but no matching '{1}' found.", attrStart, attrEnd);
                        1 == node.nodeType && (node.hasAttribute(attrStart) && depth++, node.hasAttribute(attrEnd) && depth--), 
                        nodes.push(node), node = node.nextSibling;
                    } while (depth > 0);
                } else nodes.push(node);
                return jqLite(nodes);
            }
            function groupElementsLinkFnWrapper(linkFn, attrStart, attrEnd) {
                return function(scope, element, attrs, controllers, transcludeFn) {
                    return element = groupScan(element[0], attrStart, attrEnd), linkFn(scope, element, attrs, controllers, transcludeFn);
                };
            }
            function applyDirectivesToNode(directives, compileNode, templateAttrs, transcludeFn, jqCollection, originalReplaceDirective, preLinkFns, postLinkFns, previousCompileContext) {
                function addLinkFns(pre, post, attrStart, attrEnd) {
                    pre && (attrStart && (pre = groupElementsLinkFnWrapper(pre, attrStart, attrEnd)), 
                    pre.require = directive.require, (newIsolateScopeDirective === directive || directive.$$isolateScope) && (pre = cloneAndAnnotateFn(pre, {
                        isolateScope: !0
                    })), preLinkFns.push(pre)), post && (attrStart && (post = groupElementsLinkFnWrapper(post, attrStart, attrEnd)), 
                    post.require = directive.require, (newIsolateScopeDirective === directive || directive.$$isolateScope) && (post = cloneAndAnnotateFn(post, {
                        isolateScope: !0
                    })), postLinkFns.push(post));
                }
                function getControllers(require, $element, elementControllers) {
                    var value, retrievalMethod = "data", optional = !1;
                    if (isString(require)) {
                        for (;"^" == (value = require.charAt(0)) || "?" == value; ) require = require.substr(1), 
                        "^" == value && (retrievalMethod = "inheritedData"), optional = optional || "?" == value;
                        if (value = null, elementControllers && "data" === retrievalMethod && (value = elementControllers[require]), 
                        value = value || $element[retrievalMethod]("$" + require + "Controller"), !value && !optional) throw $compileMinErr("ctreq", "Controller '{0}', required by directive '{1}', can't be found!", require, directiveName);
                        return value;
                    }
                    return isArray(require) && (value = [], forEach(require, function(require) {
                        value.push(getControllers(require, $element, elementControllers));
                    })), value;
                }
                function nodeLinkFn(childLinkFn, scope, linkNode, $rootElement, boundTranscludeFn) {
                    function controllersBoundTransclude(scope, cloneAttachFn) {
                        var transcludeControllers;
                        return arguments.length < 2 && (cloneAttachFn = scope, scope = undefined), hasElementTranscludeDirective && (transcludeControllers = elementControllers), 
                        boundTranscludeFn(scope, cloneAttachFn, transcludeControllers);
                    }
                    var attrs, $element, i, ii, linkFn, controller, isolateScope, transcludeFn, elementControllers = {};
                    if (attrs = compileNode === linkNode ? templateAttrs : shallowCopy(templateAttrs, new Attributes(jqLite(linkNode), templateAttrs.$attr)), 
                    $element = attrs.$$element, newIsolateScopeDirective) {
                        var LOCAL_REGEXP = /^\s*([@=&])(\??)\s*(\w*)\s*$/, $linkNode = jqLite(linkNode);
                        isolateScope = scope.$new(!0), templateDirective && templateDirective === newIsolateScopeDirective.$$originalDirective ? $linkNode.data("$isolateScope", isolateScope) : $linkNode.data("$isolateScopeNoTemplate", isolateScope), 
                        safeAddClass($linkNode, "ng-isolate-scope"), forEach(newIsolateScopeDirective.scope, function(definition, scopeName) {
                            var lastValue, parentGet, parentSet, compare, match = definition.match(LOCAL_REGEXP) || [], attrName = match[3] || scopeName, optional = "?" == match[2], mode = match[1];
                            switch (isolateScope.$$isolateBindings[scopeName] = mode + attrName, mode) {
                              case "@":
                                attrs.$observe(attrName, function(value) {
                                    isolateScope[scopeName] = value;
                                }), attrs.$$observers[attrName].$$scope = scope, attrs[attrName] && (isolateScope[scopeName] = $interpolate(attrs[attrName])(scope));
                                break;

                              case "=":
                                if (optional && !attrs[attrName]) return;
                                parentGet = $parse(attrs[attrName]), compare = parentGet.literal ? equals : function(a, b) {
                                    return a === b;
                                }, parentSet = parentGet.assign || function() {
                                    throw lastValue = isolateScope[scopeName] = parentGet(scope), $compileMinErr("nonassign", "Expression '{0}' used with directive '{1}' is non-assignable!", attrs[attrName], newIsolateScopeDirective.name);
                                }, lastValue = isolateScope[scopeName] = parentGet(scope), isolateScope.$watch(function() {
                                    var parentValue = parentGet(scope);
                                    return compare(parentValue, isolateScope[scopeName]) || (compare(parentValue, lastValue) ? parentSet(scope, parentValue = isolateScope[scopeName]) : isolateScope[scopeName] = parentValue), 
                                    lastValue = parentValue;
                                }, null, parentGet.literal);
                                break;

                              case "&":
                                parentGet = $parse(attrs[attrName]), isolateScope[scopeName] = function(locals) {
                                    return parentGet(scope, locals);
                                };
                                break;

                              default:
                                throw $compileMinErr("iscp", "Invalid isolate scope definition for directive '{0}'. Definition: {... {1}: '{2}' ...}", newIsolateScopeDirective.name, scopeName, definition);
                            }
                        });
                    }
                    for (transcludeFn = boundTranscludeFn && controllersBoundTransclude, controllerDirectives && forEach(controllerDirectives, function(directive) {
                        var controllerInstance, locals = {
                            $scope: directive === newIsolateScopeDirective || directive.$$isolateScope ? isolateScope : scope,
                            $element: $element,
                            $attrs: attrs,
                            $transclude: transcludeFn
                        };
                        controller = directive.controller, "@" == controller && (controller = attrs[directive.name]), 
                        controllerInstance = $controller(controller, locals), elementControllers[directive.name] = controllerInstance, 
                        hasElementTranscludeDirective || $element.data("$" + directive.name + "Controller", controllerInstance), 
                        directive.controllerAs && (locals.$scope[directive.controllerAs] = controllerInstance);
                    }), i = 0, ii = preLinkFns.length; ii > i; i++) try {
                        linkFn = preLinkFns[i], linkFn(linkFn.isolateScope ? isolateScope : scope, $element, attrs, linkFn.require && getControllers(linkFn.require, $element, elementControllers), transcludeFn);
                    } catch (e) {
                        $exceptionHandler(e, startingTag($element));
                    }
                    var scopeToChild = scope;
                    for (newIsolateScopeDirective && (newIsolateScopeDirective.template || null === newIsolateScopeDirective.templateUrl) && (scopeToChild = isolateScope), 
                    childLinkFn && childLinkFn(scopeToChild, linkNode.childNodes, undefined, boundTranscludeFn), 
                    i = postLinkFns.length - 1; i >= 0; i--) try {
                        linkFn = postLinkFns[i], linkFn(linkFn.isolateScope ? isolateScope : scope, $element, attrs, linkFn.require && getControllers(linkFn.require, $element, elementControllers), transcludeFn);
                    } catch (e) {
                        $exceptionHandler(e, startingTag($element));
                    }
                }
                previousCompileContext = previousCompileContext || {};
                for (var newScopeDirective, directive, directiveName, $template, linkFn, directiveValue, terminalPriority = -Number.MAX_VALUE, controllerDirectives = previousCompileContext.controllerDirectives, newIsolateScopeDirective = previousCompileContext.newIsolateScopeDirective, templateDirective = previousCompileContext.templateDirective, nonTlbTranscludeDirective = previousCompileContext.nonTlbTranscludeDirective, hasTranscludeDirective = !1, hasElementTranscludeDirective = !1, $compileNode = templateAttrs.$$element = jqLite(compileNode), replaceDirective = originalReplaceDirective, childTranscludeFn = transcludeFn, i = 0, ii = directives.length; ii > i; i++) {
                    directive = directives[i];
                    var attrStart = directive.$$start, attrEnd = directive.$$end;
                    if (attrStart && ($compileNode = groupScan(compileNode, attrStart, attrEnd)), $template = undefined, 
                    terminalPriority > directive.priority) break;
                    if ((directiveValue = directive.scope) && (newScopeDirective = newScopeDirective || directive, 
                    directive.templateUrl || (assertNoDuplicate("new/isolated scope", newIsolateScopeDirective, directive, $compileNode), 
                    isObject(directiveValue) && (newIsolateScopeDirective = directive))), directiveName = directive.name, 
                    !directive.templateUrl && directive.controller && (directiveValue = directive.controller, 
                    controllerDirectives = controllerDirectives || {}, assertNoDuplicate("'" + directiveName + "' controller", controllerDirectives[directiveName], directive, $compileNode), 
                    controllerDirectives[directiveName] = directive), (directiveValue = directive.transclude) && (hasTranscludeDirective = !0, 
                    directive.$$tlb || (assertNoDuplicate("transclusion", nonTlbTranscludeDirective, directive, $compileNode), 
                    nonTlbTranscludeDirective = directive), "element" == directiveValue ? (hasElementTranscludeDirective = !0, 
                    terminalPriority = directive.priority, $template = groupScan(compileNode, attrStart, attrEnd), 
                    $compileNode = templateAttrs.$$element = jqLite(document.createComment(" " + directiveName + ": " + templateAttrs[directiveName] + " ")), 
                    compileNode = $compileNode[0], replaceWith(jqCollection, jqLite(sliceArgs($template)), compileNode), 
                    childTranscludeFn = compile($template, transcludeFn, terminalPriority, replaceDirective && replaceDirective.name, {
                        nonTlbTranscludeDirective: nonTlbTranscludeDirective
                    })) : ($template = jqLite(jqLiteClone(compileNode)).contents(), $compileNode.empty(), 
                    childTranscludeFn = compile($template, transcludeFn))), directive.template) if (assertNoDuplicate("template", templateDirective, directive, $compileNode), 
                    templateDirective = directive, directiveValue = isFunction(directive.template) ? directive.template($compileNode, templateAttrs) : directive.template, 
                    directiveValue = denormalizeTemplate(directiveValue), directive.replace) {
                        if (replaceDirective = directive, $template = jqLite("<div>" + trim(directiveValue) + "</div>").contents(), 
                        compileNode = $template[0], 1 != $template.length || 1 !== compileNode.nodeType) throw $compileMinErr("tplrt", "Template for directive '{0}' must have exactly one root element. {1}", directiveName, "");
                        replaceWith(jqCollection, $compileNode, compileNode);
                        var newTemplateAttrs = {
                            $attr: {}
                        }, templateDirectives = collectDirectives(compileNode, [], newTemplateAttrs), unprocessedDirectives = directives.splice(i + 1, directives.length - (i + 1));
                        newIsolateScopeDirective && markDirectivesAsIsolate(templateDirectives), directives = directives.concat(templateDirectives).concat(unprocessedDirectives), 
                        mergeTemplateAttributes(templateAttrs, newTemplateAttrs), ii = directives.length;
                    } else $compileNode.html(directiveValue);
                    if (directive.templateUrl) assertNoDuplicate("template", templateDirective, directive, $compileNode), 
                    templateDirective = directive, directive.replace && (replaceDirective = directive), 
                    nodeLinkFn = compileTemplateUrl(directives.splice(i, directives.length - i), $compileNode, templateAttrs, jqCollection, childTranscludeFn, preLinkFns, postLinkFns, {
                        controllerDirectives: controllerDirectives,
                        newIsolateScopeDirective: newIsolateScopeDirective,
                        templateDirective: templateDirective,
                        nonTlbTranscludeDirective: nonTlbTranscludeDirective
                    }), ii = directives.length; else if (directive.compile) try {
                        linkFn = directive.compile($compileNode, templateAttrs, childTranscludeFn), isFunction(linkFn) ? addLinkFns(null, linkFn, attrStart, attrEnd) : linkFn && addLinkFns(linkFn.pre, linkFn.post, attrStart, attrEnd);
                    } catch (e) {
                        $exceptionHandler(e, startingTag($compileNode));
                    }
                    directive.terminal && (nodeLinkFn.terminal = !0, terminalPriority = Math.max(terminalPriority, directive.priority));
                }
                return nodeLinkFn.scope = newScopeDirective && newScopeDirective.scope === !0, nodeLinkFn.transclude = hasTranscludeDirective && childTranscludeFn, 
                nodeLinkFn;
            }
            function markDirectivesAsIsolate(directives) {
                for (var j = 0, jj = directives.length; jj > j; j++) directives[j] = inherit(directives[j], {
                    $$isolateScope: !0
                });
            }
            function addDirective(tDirectives, name, location, maxPriority, ignoreDirective, startAttrName, endAttrName) {
                if (name === ignoreDirective) return null;
                var match = null;
                if (hasDirectives.hasOwnProperty(name)) for (var directive, directives = $injector.get(name + Suffix), i = 0, ii = directives.length; ii > i; i++) try {
                    directive = directives[i], (maxPriority === undefined || maxPriority > directive.priority) && -1 != directive.restrict.indexOf(location) && (startAttrName && (directive = inherit(directive, {
                        $$start: startAttrName,
                        $$end: endAttrName
                    })), tDirectives.push(directive), match = directive);
                } catch (e) {
                    $exceptionHandler(e);
                }
                return match;
            }
            function mergeTemplateAttributes(dst, src) {
                var srcAttr = src.$attr, dstAttr = dst.$attr, $element = dst.$$element;
                forEach(dst, function(value, key) {
                    "$" != key.charAt(0) && (src[key] && (value += ("style" === key ? ";" : " ") + src[key]), 
                    dst.$set(key, value, !0, srcAttr[key]));
                }), forEach(src, function(value, key) {
                    "class" == key ? (safeAddClass($element, value), dst["class"] = (dst["class"] ? dst["class"] + " " : "") + value) : "style" == key ? ($element.attr("style", $element.attr("style") + ";" + value), 
                    dst.style = (dst.style ? dst.style + ";" : "") + value) : "$" == key.charAt(0) || dst.hasOwnProperty(key) || (dst[key] = value, 
                    dstAttr[key] = srcAttr[key]);
                });
            }
            function compileTemplateUrl(directives, $compileNode, tAttrs, $rootElement, childTranscludeFn, preLinkFns, postLinkFns, previousCompileContext) {
                var afterTemplateNodeLinkFn, afterTemplateChildLinkFn, linkQueue = [], beforeTemplateCompileNode = $compileNode[0], origAsyncDirective = directives.shift(), derivedSyncDirective = extend({}, origAsyncDirective, {
                    templateUrl: null,
                    transclude: null,
                    replace: null,
                    $$originalDirective: origAsyncDirective
                }), templateUrl = isFunction(origAsyncDirective.templateUrl) ? origAsyncDirective.templateUrl($compileNode, tAttrs) : origAsyncDirective.templateUrl;
                return $compileNode.empty(), $http.get($sce.getTrustedResourceUrl(templateUrl), {
                    cache: $templateCache
                }).success(function(content) {
                    var compileNode, tempTemplateAttrs, $template, childBoundTranscludeFn;
                    if (content = denormalizeTemplate(content), origAsyncDirective.replace) {
                        if ($template = jqLite("<div>" + trim(content) + "</div>").contents(), compileNode = $template[0], 
                        1 != $template.length || 1 !== compileNode.nodeType) throw $compileMinErr("tplrt", "Template for directive '{0}' must have exactly one root element. {1}", origAsyncDirective.name, templateUrl);
                        tempTemplateAttrs = {
                            $attr: {}
                        }, replaceWith($rootElement, $compileNode, compileNode);
                        var templateDirectives = collectDirectives(compileNode, [], tempTemplateAttrs);
                        isObject(origAsyncDirective.scope) && markDirectivesAsIsolate(templateDirectives), 
                        directives = templateDirectives.concat(directives), mergeTemplateAttributes(tAttrs, tempTemplateAttrs);
                    } else compileNode = beforeTemplateCompileNode, $compileNode.html(content);
                    for (directives.unshift(derivedSyncDirective), afterTemplateNodeLinkFn = applyDirectivesToNode(directives, compileNode, tAttrs, childTranscludeFn, $compileNode, origAsyncDirective, preLinkFns, postLinkFns, previousCompileContext), 
                    forEach($rootElement, function(node, i) {
                        node == compileNode && ($rootElement[i] = $compileNode[0]);
                    }), afterTemplateChildLinkFn = compileNodes($compileNode[0].childNodes, childTranscludeFn); linkQueue.length; ) {
                        var scope = linkQueue.shift(), beforeTemplateLinkNode = linkQueue.shift(), linkRootElement = linkQueue.shift(), boundTranscludeFn = linkQueue.shift(), linkNode = $compileNode[0];
                        beforeTemplateLinkNode !== beforeTemplateCompileNode && (linkNode = jqLiteClone(compileNode), 
                        replaceWith(linkRootElement, jqLite(beforeTemplateLinkNode), linkNode)), childBoundTranscludeFn = afterTemplateNodeLinkFn.transclude ? createBoundTranscludeFn(scope, afterTemplateNodeLinkFn.transclude) : boundTranscludeFn, 
                        afterTemplateNodeLinkFn(afterTemplateChildLinkFn, scope, linkNode, $rootElement, childBoundTranscludeFn);
                    }
                    linkQueue = null;
                }).error(function(response, code, headers, config) {
                    throw $compileMinErr("tpload", "Failed to load template: {0}", config.url);
                }), function(ignoreChildLinkFn, scope, node, rootElement, boundTranscludeFn) {
                    linkQueue ? (linkQueue.push(scope), linkQueue.push(node), linkQueue.push(rootElement), 
                    linkQueue.push(boundTranscludeFn)) : afterTemplateNodeLinkFn(afterTemplateChildLinkFn, scope, node, rootElement, boundTranscludeFn);
                };
            }
            function byPriority(a, b) {
                var diff = b.priority - a.priority;
                return 0 !== diff ? diff : a.name !== b.name ? a.name < b.name ? -1 : 1 : a.index - b.index;
            }
            function assertNoDuplicate(what, previousDirective, directive, element) {
                if (previousDirective) throw $compileMinErr("multidir", "Multiple directives [{0}, {1}] asking for {2} on: {3}", previousDirective.name, directive.name, what, startingTag(element));
            }
            function addTextInterpolateDirective(directives, text) {
                var interpolateFn = $interpolate(text, !0);
                interpolateFn && directives.push({
                    priority: 0,
                    compile: valueFn(function(scope, node) {
                        var parent = node.parent(), bindings = parent.data("$binding") || [];
                        bindings.push(interpolateFn), safeAddClass(parent.data("$binding", bindings), "ng-binding"), 
                        scope.$watch(interpolateFn, function(value) {
                            node[0].nodeValue = value;
                        });
                    })
                });
            }
            function getTrustedContext(node, attrNormalizedName) {
                if ("srcdoc" == attrNormalizedName) return $sce.HTML;
                var tag = nodeName_(node);
                return "xlinkHref" == attrNormalizedName || "FORM" == tag && "action" == attrNormalizedName || "IMG" != tag && ("src" == attrNormalizedName || "ngSrc" == attrNormalizedName) ? $sce.RESOURCE_URL : void 0;
            }
            function addAttrInterpolateDirective(node, directives, value, name) {
                var interpolateFn = $interpolate(value, !0);
                if (interpolateFn) {
                    if ("multiple" === name && "SELECT" === nodeName_(node)) throw $compileMinErr("selmulti", "Binding to the 'multiple' attribute is not supported. Element: {0}", startingTag(node));
                    directives.push({
                        priority: 100,
                        compile: function() {
                            return {
                                pre: function(scope, element, attr) {
                                    var $$observers = attr.$$observers || (attr.$$observers = {});
                                    if (EVENT_HANDLER_ATTR_REGEXP.test(name)) throw $compileMinErr("nodomevents", "Interpolations for HTML DOM event attributes are disallowed.  Please use the ng- versions (such as ng-click instead of onclick) instead.");
                                    interpolateFn = $interpolate(attr[name], !0, getTrustedContext(node, name)), interpolateFn && (attr[name] = interpolateFn(scope), 
                                    ($$observers[name] || ($$observers[name] = [])).$$inter = !0, (attr.$$observers && attr.$$observers[name].$$scope || scope).$watch(interpolateFn, function(newValue, oldValue) {
                                        "class" === name && newValue != oldValue ? attr.$updateClass(newValue, oldValue) : attr.$set(name, newValue);
                                    }));
                                }
                            };
                        }
                    });
                }
            }
            function replaceWith($rootElement, elementsToRemove, newNode) {
                var i, ii, firstElementToRemove = elementsToRemove[0], removeCount = elementsToRemove.length, parent = firstElementToRemove.parentNode;
                if ($rootElement) for (i = 0, ii = $rootElement.length; ii > i; i++) if ($rootElement[i] == firstElementToRemove) {
                    $rootElement[i++] = newNode;
                    for (var j = i, j2 = j + removeCount - 1, jj = $rootElement.length; jj > j; j++, 
                    j2++) jj > j2 ? $rootElement[j] = $rootElement[j2] : delete $rootElement[j];
                    $rootElement.length -= removeCount - 1;
                    break;
                }
                parent && parent.replaceChild(newNode, firstElementToRemove);
                var fragment = document.createDocumentFragment();
                fragment.appendChild(firstElementToRemove), newNode[jqLite.expando] = firstElementToRemove[jqLite.expando];
                for (var k = 1, kk = elementsToRemove.length; kk > k; k++) {
                    var element = elementsToRemove[k];
                    jqLite(element).remove(), fragment.appendChild(element), delete elementsToRemove[k];
                }
                elementsToRemove[0] = newNode, elementsToRemove.length = 1;
            }
            function cloneAndAnnotateFn(fn, annotation) {
                return extend(function() {
                    return fn.apply(null, arguments);
                }, fn, annotation);
            }
            var Attributes = function(element, attr) {
                this.$$element = element, this.$attr = attr || {};
            };
            Attributes.prototype = {
                $normalize: directiveNormalize,
                $addClass: function(classVal) {
                    classVal && classVal.length > 0 && $animate.addClass(this.$$element, classVal);
                },
                $removeClass: function(classVal) {
                    classVal && classVal.length > 0 && $animate.removeClass(this.$$element, classVal);
                },
                $updateClass: function(newClasses, oldClasses) {
                    this.$removeClass(tokenDifference(oldClasses, newClasses)), this.$addClass(tokenDifference(newClasses, oldClasses));
                },
                $set: function(key, value, writeAttr, attrName) {
                    var nodeName, booleanKey = getBooleanAttrName(this.$$element[0], key);
                    booleanKey && (this.$$element.prop(key, value), attrName = booleanKey), this[key] = value, 
                    attrName ? this.$attr[key] = attrName : (attrName = this.$attr[key], attrName || (this.$attr[key] = attrName = snake_case(key, "-"))), 
                    nodeName = nodeName_(this.$$element), ("A" === nodeName && "href" === key || "IMG" === nodeName && "src" === key) && (this[key] = value = $$sanitizeUri(value, "src" === key)), 
                    writeAttr !== !1 && (null === value || value === undefined ? this.$$element.removeAttr(attrName) : this.$$element.attr(attrName, value));
                    var $$observers = this.$$observers;
                    $$observers && forEach($$observers[key], function(fn) {
                        try {
                            fn(value);
                        } catch (e) {
                            $exceptionHandler(e);
                        }
                    });
                },
                $observe: function(key, fn) {
                    var attrs = this, $$observers = attrs.$$observers || (attrs.$$observers = {}), listeners = $$observers[key] || ($$observers[key] = []);
                    return listeners.push(fn), $rootScope.$evalAsync(function() {
                        listeners.$$inter || fn(attrs[key]);
                    }), fn;
                }
            };
            var startSymbol = $interpolate.startSymbol(), endSymbol = $interpolate.endSymbol(), denormalizeTemplate = "{{" == startSymbol || "}}" == endSymbol ? identity : function(template) {
                return template.replace(/\{\{/g, startSymbol).replace(/}}/g, endSymbol);
            }, NG_ATTR_BINDING = /^ngAttr[A-Z]/;
            return compile;
        } ];
    }
    function directiveNormalize(name) {
        return camelCase(name.replace(PREFIX_REGEXP, ""));
    }
    function tokenDifference(str1, str2) {
        var values = "", tokens1 = str1.split(/\s+/), tokens2 = str2.split(/\s+/);
        outer: for (var i = 0; i < tokens1.length; i++) {
            for (var token = tokens1[i], j = 0; j < tokens2.length; j++) if (token == tokens2[j]) continue outer;
            values += (values.length > 0 ? " " : "") + token;
        }
        return values;
    }
    function $ControllerProvider() {
        var controllers = {}, CNTRL_REG = /^(\S+)(\s+as\s+(\w+))?$/;
        this.register = function(name, constructor) {
            assertNotHasOwnProperty(name, "controller"), isObject(name) ? extend(controllers, name) : controllers[name] = constructor;
        }, this.$get = [ "$injector", "$window", function($injector, $window) {
            return function(expression, locals) {
                var instance, match, constructor, identifier;
                if (isString(expression) && (match = expression.match(CNTRL_REG), constructor = match[1], 
                identifier = match[3], expression = controllers.hasOwnProperty(constructor) ? controllers[constructor] : getter(locals.$scope, constructor, !0) || getter($window, constructor, !0), 
                assertArgFn(expression, constructor, !0)), instance = $injector.instantiate(expression, locals), 
                identifier) {
                    if (!locals || "object" != typeof locals.$scope) throw minErr("$controller")("noscp", "Cannot export controller '{0}' as '{1}'! No $scope object provided via `locals`.", constructor || expression.name, identifier);
                    locals.$scope[identifier] = instance;
                }
                return instance;
            };
        } ];
    }
    function $DocumentProvider() {
        this.$get = [ "$window", function(window) {
            return jqLite(window.document);
        } ];
    }
    function $ExceptionHandlerProvider() {
        this.$get = [ "$log", function($log) {
            return function() {
                $log.error.apply($log, arguments);
            };
        } ];
    }
    function parseHeaders(headers) {
        var key, val, i, parsed = {};
        return headers ? (forEach(headers.split("\n"), function(line) {
            i = line.indexOf(":"), key = lowercase(trim(line.substr(0, i))), val = trim(line.substr(i + 1)), 
            key && (parsed[key] ? parsed[key] += ", " + val : parsed[key] = val);
        }), parsed) : parsed;
    }
    function headersGetter(headers) {
        var headersObj = isObject(headers) ? headers : undefined;
        return function(name) {
            return headersObj || (headersObj = parseHeaders(headers)), name ? headersObj[lowercase(name)] || null : headersObj;
        };
    }
    function transformData(data, headers, fns) {
        return isFunction(fns) ? fns(data, headers) : (forEach(fns, function(fn) {
            data = fn(data, headers);
        }), data);
    }
    function isSuccess(status) {
        return status >= 200 && 300 > status;
    }
    function $HttpProvider() {
        var JSON_START = /^\s*(\[|\{[^\{])/, JSON_END = /[\}\]]\s*$/, PROTECTION_PREFIX = /^\)\]\}',?\n/, CONTENT_TYPE_APPLICATION_JSON = {
            "Content-Type": "application/json;charset=utf-8"
        }, defaults = this.defaults = {
            transformResponse: [ function(data) {
                return isString(data) && (data = data.replace(PROTECTION_PREFIX, ""), JSON_START.test(data) && JSON_END.test(data) && (data = fromJson(data))), 
                data;
            } ],
            transformRequest: [ function(d) {
                return isObject(d) && !isFile(d) ? toJson(d) : d;
            } ],
            headers: {
                common: {
                    Accept: "application/json, text/plain, */*"
                },
                post: copy(CONTENT_TYPE_APPLICATION_JSON),
                put: copy(CONTENT_TYPE_APPLICATION_JSON),
                patch: copy(CONTENT_TYPE_APPLICATION_JSON)
            },
            xsrfCookieName: "XSRF-TOKEN",
            xsrfHeaderName: "X-XSRF-TOKEN"
        }, interceptorFactories = this.interceptors = [], responseInterceptorFactories = this.responseInterceptors = [];
        this.$get = [ "$httpBackend", "$browser", "$cacheFactory", "$rootScope", "$q", "$injector", function($httpBackend, $browser, $cacheFactory, $rootScope, $q, $injector) {
            function $http(requestConfig) {
                function transformResponse(response) {
                    var resp = extend({}, response, {
                        data: transformData(response.data, response.headers, config.transformResponse)
                    });
                    return isSuccess(response.status) ? resp : $q.reject(resp);
                }
                function mergeHeaders(config) {
                    function execHeaders(headers) {
                        var headerContent;
                        forEach(headers, function(headerFn, header) {
                            isFunction(headerFn) && (headerContent = headerFn(), null != headerContent ? headers[header] = headerContent : delete headers[header]);
                        });
                    }
                    var defHeaderName, lowercaseDefHeaderName, reqHeaderName, defHeaders = defaults.headers, reqHeaders = extend({}, config.headers);
                    defHeaders = extend({}, defHeaders.common, defHeaders[lowercase(config.method)]), 
                    execHeaders(defHeaders), execHeaders(reqHeaders);
                    defaultHeadersIteration: for (defHeaderName in defHeaders) {
                        lowercaseDefHeaderName = lowercase(defHeaderName);
                        for (reqHeaderName in reqHeaders) if (lowercase(reqHeaderName) === lowercaseDefHeaderName) continue defaultHeadersIteration;
                        reqHeaders[defHeaderName] = defHeaders[defHeaderName];
                    }
                    return reqHeaders;
                }
                var config = {
                    transformRequest: defaults.transformRequest,
                    transformResponse: defaults.transformResponse
                }, headers = mergeHeaders(requestConfig);
                extend(config, requestConfig), config.headers = headers, config.method = uppercase(config.method);
                var xsrfValue = urlIsSameOrigin(config.url) ? $browser.cookies()[config.xsrfCookieName || defaults.xsrfCookieName] : undefined;
                xsrfValue && (headers[config.xsrfHeaderName || defaults.xsrfHeaderName] = xsrfValue);
                var serverRequest = function(config) {
                    headers = config.headers;
                    var reqData = transformData(config.data, headersGetter(headers), config.transformRequest);
                    return isUndefined(config.data) && forEach(headers, function(value, header) {
                        "content-type" === lowercase(header) && delete headers[header];
                    }), isUndefined(config.withCredentials) && !isUndefined(defaults.withCredentials) && (config.withCredentials = defaults.withCredentials), 
                    sendReq(config, reqData, headers).then(transformResponse, transformResponse);
                }, chain = [ serverRequest, undefined ], promise = $q.when(config);
                for (forEach(reversedInterceptors, function(interceptor) {
                    (interceptor.request || interceptor.requestError) && chain.unshift(interceptor.request, interceptor.requestError), 
                    (interceptor.response || interceptor.responseError) && chain.push(interceptor.response, interceptor.responseError);
                }); chain.length; ) {
                    var thenFn = chain.shift(), rejectFn = chain.shift();
                    promise = promise.then(thenFn, rejectFn);
                }
                return promise.success = function(fn) {
                    return promise.then(function(response) {
                        fn(response.data, response.status, response.headers, config);
                    }), promise;
                }, promise.error = function(fn) {
                    return promise.then(null, function(response) {
                        fn(response.data, response.status, response.headers, config);
                    }), promise;
                }, promise;
            }
            function createShortMethods() {
                forEach(arguments, function(name) {
                    $http[name] = function(url, config) {
                        return $http(extend(config || {}, {
                            method: name,
                            url: url
                        }));
                    };
                });
            }
            function createShortMethodsWithData() {
                forEach(arguments, function(name) {
                    $http[name] = function(url, data, config) {
                        return $http(extend(config || {}, {
                            method: name,
                            url: url,
                            data: data
                        }));
                    };
                });
            }
            function sendReq(config, reqData, reqHeaders) {
                function done(status, response, headersString) {
                    cache && (isSuccess(status) ? cache.put(url, [ status, response, parseHeaders(headersString) ]) : cache.remove(url)), 
                    resolvePromise(response, status, headersString), $rootScope.$$phase || $rootScope.$apply();
                }
                function resolvePromise(response, status, headers) {
                    status = Math.max(status, 0), (isSuccess(status) ? deferred.resolve : deferred.reject)({
                        data: response,
                        status: status,
                        headers: headersGetter(headers),
                        config: config
                    });
                }
                function removePendingReq() {
                    var idx = indexOf($http.pendingRequests, config);
                    -1 !== idx && $http.pendingRequests.splice(idx, 1);
                }
                var cache, cachedResp, deferred = $q.defer(), promise = deferred.promise, url = buildUrl(config.url, config.params);
                if ($http.pendingRequests.push(config), promise.then(removePendingReq, removePendingReq), 
                (config.cache || defaults.cache) && config.cache !== !1 && "GET" == config.method && (cache = isObject(config.cache) ? config.cache : isObject(defaults.cache) ? defaults.cache : defaultCache), 
                cache) if (cachedResp = cache.get(url), isDefined(cachedResp)) {
                    if (cachedResp.then) return cachedResp.then(removePendingReq, removePendingReq), 
                    cachedResp;
                    isArray(cachedResp) ? resolvePromise(cachedResp[1], cachedResp[0], copy(cachedResp[2])) : resolvePromise(cachedResp, 200, {});
                } else cache.put(url, promise);
                return isUndefined(cachedResp) && $httpBackend(config.method, url, reqData, done, reqHeaders, config.timeout, config.withCredentials, config.responseType), 
                promise;
            }
            function buildUrl(url, params) {
                if (!params) return url;
                var parts = [];
                return forEachSorted(params, function(value, key) {
                    null === value || isUndefined(value) || (isArray(value) || (value = [ value ]), 
                    forEach(value, function(v) {
                        isObject(v) && (v = toJson(v)), parts.push(encodeUriQuery(key) + "=" + encodeUriQuery(v));
                    }));
                }), url + (-1 == url.indexOf("?") ? "?" : "&") + parts.join("&");
            }
            var defaultCache = $cacheFactory("$http"), reversedInterceptors = [];
            return forEach(interceptorFactories, function(interceptorFactory) {
                reversedInterceptors.unshift(isString(interceptorFactory) ? $injector.get(interceptorFactory) : $injector.invoke(interceptorFactory));
            }), forEach(responseInterceptorFactories, function(interceptorFactory, index) {
                var responseFn = isString(interceptorFactory) ? $injector.get(interceptorFactory) : $injector.invoke(interceptorFactory);
                reversedInterceptors.splice(index, 0, {
                    response: function(response) {
                        return responseFn($q.when(response));
                    },
                    responseError: function(response) {
                        return responseFn($q.reject(response));
                    }
                });
            }), $http.pendingRequests = [], createShortMethods("get", "delete", "head", "jsonp"), 
            createShortMethodsWithData("post", "put"), $http.defaults = defaults, $http;
        } ];
    }
    function createXhr(method) {
        return 8 >= msie && "patch" === lowercase(method) ? new ActiveXObject("Microsoft.XMLHTTP") : new window.XMLHttpRequest();
    }
    function $HttpBackendProvider() {
        this.$get = [ "$browser", "$window", "$document", function($browser, $window, $document) {
            return createHttpBackend($browser, createXhr, $browser.defer, $window.angular.callbacks, $document[0]);
        } ];
    }
    function createHttpBackend($browser, createXhr, $browserDefer, callbacks, rawDocument) {
        function jsonpReq(url, done) {
            var script = rawDocument.createElement("script"), doneWrapper = function() {
                script.onreadystatechange = script.onload = script.onerror = null, rawDocument.body.removeChild(script), 
                done && done();
            };
            return script.type = "text/javascript", script.src = url, msie && 8 >= msie ? script.onreadystatechange = function() {
                /loaded|complete/.test(script.readyState) && doneWrapper();
            } : script.onload = script.onerror = function() {
                doneWrapper();
            }, rawDocument.body.appendChild(script), doneWrapper;
        }
        var ABORTED = -1;
        return function(method, url, post, callback, headers, timeout, withCredentials, responseType) {
            function timeoutRequest() {
                status = ABORTED, jsonpDone && jsonpDone(), xhr && xhr.abort();
            }
            function completeRequest(callback, status, response, headersString) {
                timeoutId && $browserDefer.cancel(timeoutId), jsonpDone = xhr = null, status = 0 === status ? response ? 200 : 404 : status, 
                status = 1223 == status ? 204 : status, callback(status, response, headersString), 
                $browser.$$completeOutstandingRequest(noop);
            }
            var status;
            if ($browser.$$incOutstandingRequestCount(), url = url || $browser.url(), "jsonp" == lowercase(method)) {
                var callbackId = "_" + (callbacks.counter++).toString(36);
                callbacks[callbackId] = function(data) {
                    callbacks[callbackId].data = data;
                };
                var jsonpDone = jsonpReq(url.replace("JSON_CALLBACK", "angular.callbacks." + callbackId), function() {
                    callbacks[callbackId].data ? completeRequest(callback, 200, callbacks[callbackId].data) : completeRequest(callback, status || -2), 
                    callbacks[callbackId] = angular.noop;
                });
            } else {
                var xhr = createXhr(method);
                xhr.open(method, url, !0), forEach(headers, function(value, key) {
                    isDefined(value) && xhr.setRequestHeader(key, value);
                }), xhr.onreadystatechange = function() {
                    if (xhr && 4 == xhr.readyState) {
                        var responseHeaders = null, response = null;
                        status !== ABORTED && (responseHeaders = xhr.getAllResponseHeaders(), response = "response" in xhr ? xhr.response : xhr.responseText), 
                        completeRequest(callback, status || xhr.status, response, responseHeaders);
                    }
                }, withCredentials && (xhr.withCredentials = !0), responseType && (xhr.responseType = responseType), 
                xhr.send(post || null);
            }
            if (timeout > 0) var timeoutId = $browserDefer(timeoutRequest, timeout); else timeout && timeout.then && timeout.then(timeoutRequest);
        };
    }
    function $InterpolateProvider() {
        var startSymbol = "{{", endSymbol = "}}";
        this.startSymbol = function(value) {
            return value ? (startSymbol = value, this) : startSymbol;
        }, this.endSymbol = function(value) {
            return value ? (endSymbol = value, this) : endSymbol;
        }, this.$get = [ "$parse", "$exceptionHandler", "$sce", function($parse, $exceptionHandler, $sce) {
            function $interpolate(text, mustHaveExpression, trustedContext) {
                for (var startIndex, endIndex, fn, exp, index = 0, parts = [], length = text.length, hasInterpolation = !1, concat = []; length > index; ) -1 != (startIndex = text.indexOf(startSymbol, index)) && -1 != (endIndex = text.indexOf(endSymbol, startIndex + startSymbolLength)) ? (index != startIndex && parts.push(text.substring(index, startIndex)), 
                parts.push(fn = $parse(exp = text.substring(startIndex + startSymbolLength, endIndex))), 
                fn.exp = exp, index = endIndex + endSymbolLength, hasInterpolation = !0) : (index != length && parts.push(text.substring(index)), 
                index = length);
                if ((length = parts.length) || (parts.push(""), length = 1), trustedContext && parts.length > 1) throw $interpolateMinErr("noconcat", "Error while interpolating: {0}\nStrict Contextual Escaping disallows interpolations that concatenate multiple expressions when a trusted value is required.  See http://docs.angularjs.org/api/ng.$sce", text);
                return !mustHaveExpression || hasInterpolation ? (concat.length = length, fn = function(context) {
                    try {
                        for (var part, i = 0, ii = length; ii > i; i++) "function" == typeof (part = parts[i]) && (part = part(context), 
                        part = trustedContext ? $sce.getTrusted(trustedContext, part) : $sce.valueOf(part), 
                        null === part || isUndefined(part) ? part = "" : "string" != typeof part && (part = toJson(part))), 
                        concat[i] = part;
                        return concat.join("");
                    } catch (err) {
                        var newErr = $interpolateMinErr("interr", "Can't interpolate: {0}\n{1}", text, err.toString());
                        $exceptionHandler(newErr);
                    }
                }, fn.exp = text, fn.parts = parts, fn) : void 0;
            }
            var startSymbolLength = startSymbol.length, endSymbolLength = endSymbol.length;
            return $interpolate.startSymbol = function() {
                return startSymbol;
            }, $interpolate.endSymbol = function() {
                return endSymbol;
            }, $interpolate;
        } ];
    }
    function $IntervalProvider() {
        this.$get = [ "$rootScope", "$window", "$q", function($rootScope, $window, $q) {
            function interval(fn, delay, count, invokeApply) {
                var setInterval = $window.setInterval, clearInterval = $window.clearInterval, deferred = $q.defer(), promise = deferred.promise, iteration = 0, skipApply = isDefined(invokeApply) && !invokeApply;
                return count = isDefined(count) ? count : 0, promise.then(null, null, fn), promise.$$intervalId = setInterval(function() {
                    deferred.notify(iteration++), count > 0 && iteration >= count && (deferred.resolve(iteration), 
                    clearInterval(promise.$$intervalId), delete intervals[promise.$$intervalId]), skipApply || $rootScope.$apply();
                }, delay), intervals[promise.$$intervalId] = deferred, promise;
            }
            var intervals = {};
            return interval.cancel = function(promise) {
                return promise && promise.$$intervalId in intervals ? (intervals[promise.$$intervalId].reject("canceled"), 
                clearInterval(promise.$$intervalId), delete intervals[promise.$$intervalId], !0) : !1;
            }, interval;
        } ];
    }
    function $LocaleProvider() {
        this.$get = function() {
            return {
                id: "en-us",
                NUMBER_FORMATS: {
                    DECIMAL_SEP: ".",
                    GROUP_SEP: ",",
                    PATTERNS: [ {
                        minInt: 1,
                        minFrac: 0,
                        maxFrac: 3,
                        posPre: "",
                        posSuf: "",
                        negPre: "-",
                        negSuf: "",
                        gSize: 3,
                        lgSize: 3
                    }, {
                        minInt: 1,
                        minFrac: 2,
                        maxFrac: 2,
                        posPre: "¤",
                        posSuf: "",
                        negPre: "(¤",
                        negSuf: ")",
                        gSize: 3,
                        lgSize: 3
                    } ],
                    CURRENCY_SYM: "$"
                },
                DATETIME_FORMATS: {
                    MONTH: "January,February,March,April,May,June,July,August,September,October,November,December".split(","),
                    SHORTMONTH: "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec".split(","),
                    DAY: "Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday".split(","),
                    SHORTDAY: "Sun,Mon,Tue,Wed,Thu,Fri,Sat".split(","),
                    AMPMS: [ "AM", "PM" ],
                    medium: "MMM d, y h:mm:ss a",
                    "short": "M/d/yy h:mm a",
                    fullDate: "EEEE, MMMM d, y",
                    longDate: "MMMM d, y",
                    mediumDate: "MMM d, y",
                    shortDate: "M/d/yy",
                    mediumTime: "h:mm:ss a",
                    shortTime: "h:mm a"
                },
                pluralCat: function(num) {
                    return 1 === num ? "one" : "other";
                }
            };
        };
    }
    function encodePath(path) {
        for (var segments = path.split("/"), i = segments.length; i--; ) segments[i] = encodeUriSegment(segments[i]);
        return segments.join("/");
    }
    function parseAbsoluteUrl(absoluteUrl, locationObj, appBase) {
        var parsedUrl = urlResolve(absoluteUrl, appBase);
        locationObj.$$protocol = parsedUrl.protocol, locationObj.$$host = parsedUrl.hostname, 
        locationObj.$$port = int(parsedUrl.port) || DEFAULT_PORTS[parsedUrl.protocol] || null;
    }
    function parseAppUrl(relativeUrl, locationObj, appBase) {
        var prefixed = "/" !== relativeUrl.charAt(0);
        prefixed && (relativeUrl = "/" + relativeUrl);
        var match = urlResolve(relativeUrl, appBase);
        locationObj.$$path = decodeURIComponent(prefixed && "/" === match.pathname.charAt(0) ? match.pathname.substring(1) : match.pathname), 
        locationObj.$$search = parseKeyValue(match.search), locationObj.$$hash = decodeURIComponent(match.hash), 
        locationObj.$$path && "/" != locationObj.$$path.charAt(0) && (locationObj.$$path = "/" + locationObj.$$path);
    }
    function beginsWith(begin, whole) {
        return 0 === whole.indexOf(begin) ? whole.substr(begin.length) : void 0;
    }
    function stripHash(url) {
        var index = url.indexOf("#");
        return -1 == index ? url : url.substr(0, index);
    }
    function stripFile(url) {
        return url.substr(0, stripHash(url).lastIndexOf("/") + 1);
    }
    function serverBase(url) {
        return url.substring(0, url.indexOf("/", url.indexOf("//") + 2));
    }
    function LocationHtml5Url(appBase, basePrefix) {
        this.$$html5 = !0, basePrefix = basePrefix || "";
        var appBaseNoFile = stripFile(appBase);
        parseAbsoluteUrl(appBase, this, appBase), this.$$parse = function(url) {
            var pathUrl = beginsWith(appBaseNoFile, url);
            if (!isString(pathUrl)) throw $locationMinErr("ipthprfx", 'Invalid url "{0}", missing path prefix "{1}".', url, appBaseNoFile);
            parseAppUrl(pathUrl, this, appBase), this.$$path || (this.$$path = "/"), this.$$compose();
        }, this.$$compose = function() {
            var search = toKeyValue(this.$$search), hash = this.$$hash ? "#" + encodeUriSegment(this.$$hash) : "";
            this.$$url = encodePath(this.$$path) + (search ? "?" + search : "") + hash, this.$$absUrl = appBaseNoFile + this.$$url.substr(1);
        }, this.$$rewrite = function(url) {
            var appUrl, prevAppUrl;
            return (appUrl = beginsWith(appBase, url)) !== undefined ? (prevAppUrl = appUrl, 
            (appUrl = beginsWith(basePrefix, appUrl)) !== undefined ? appBaseNoFile + (beginsWith("/", appUrl) || appUrl) : appBase + prevAppUrl) : (appUrl = beginsWith(appBaseNoFile, url)) !== undefined ? appBaseNoFile + appUrl : appBaseNoFile == url + "/" ? appBaseNoFile : void 0;
        };
    }
    function LocationHashbangUrl(appBase, hashPrefix) {
        var appBaseNoFile = stripFile(appBase);
        parseAbsoluteUrl(appBase, this, appBase), this.$$parse = function(url) {
            function removeWindowsDriveName(path, url, base) {
                var firstPathSegmentMatch, windowsFilePathExp = /^\/?.*?:(\/.*)/;
                return 0 === url.indexOf(base) && (url = url.replace(base, "")), windowsFilePathExp.exec(url) ? path : (firstPathSegmentMatch = windowsFilePathExp.exec(path), 
                firstPathSegmentMatch ? firstPathSegmentMatch[1] : path);
            }
            var withoutBaseUrl = beginsWith(appBase, url) || beginsWith(appBaseNoFile, url), withoutHashUrl = "#" == withoutBaseUrl.charAt(0) ? beginsWith(hashPrefix, withoutBaseUrl) : this.$$html5 ? withoutBaseUrl : "";
            if (!isString(withoutHashUrl)) throw $locationMinErr("ihshprfx", 'Invalid url "{0}", missing hash prefix "{1}".', url, hashPrefix);
            parseAppUrl(withoutHashUrl, this, appBase), this.$$path = removeWindowsDriveName(this.$$path, withoutHashUrl, appBase), 
            this.$$compose();
        }, this.$$compose = function() {
            var search = toKeyValue(this.$$search), hash = this.$$hash ? "#" + encodeUriSegment(this.$$hash) : "";
            this.$$url = encodePath(this.$$path) + (search ? "?" + search : "") + hash, this.$$absUrl = appBase + (this.$$url ? hashPrefix + this.$$url : "");
        }, this.$$rewrite = function(url) {
            return stripHash(appBase) == stripHash(url) ? url : void 0;
        };
    }
    function LocationHashbangInHtml5Url(appBase, hashPrefix) {
        this.$$html5 = !0, LocationHashbangUrl.apply(this, arguments);
        var appBaseNoFile = stripFile(appBase);
        this.$$rewrite = function(url) {
            var appUrl;
            return appBase == stripHash(url) ? url : (appUrl = beginsWith(appBaseNoFile, url)) ? appBase + hashPrefix + appUrl : appBaseNoFile === url + "/" ? appBaseNoFile : void 0;
        };
    }
    function locationGetter(property) {
        return function() {
            return this[property];
        };
    }
    function locationGetterSetter(property, preprocess) {
        return function(value) {
            return isUndefined(value) ? this[property] : (this[property] = preprocess(value), 
            this.$$compose(), this);
        };
    }
    function $LocationProvider() {
        var hashPrefix = "", html5Mode = !1;
        this.hashPrefix = function(prefix) {
            return isDefined(prefix) ? (hashPrefix = prefix, this) : hashPrefix;
        }, this.html5Mode = function(mode) {
            return isDefined(mode) ? (html5Mode = mode, this) : html5Mode;
        }, this.$get = [ "$rootScope", "$browser", "$sniffer", "$rootElement", function($rootScope, $browser, $sniffer, $rootElement) {
            function afterLocationChange(oldUrl) {
                $rootScope.$broadcast("$locationChangeSuccess", $location.absUrl(), oldUrl);
            }
            var $location, LocationMode, appBase, baseHref = $browser.baseHref(), initialUrl = $browser.url();
            html5Mode ? (appBase = serverBase(initialUrl) + (baseHref || "/"), LocationMode = $sniffer.history ? LocationHtml5Url : LocationHashbangInHtml5Url) : (appBase = stripHash(initialUrl), 
            LocationMode = LocationHashbangUrl), $location = new LocationMode(appBase, "#" + hashPrefix), 
            $location.$$parse($location.$$rewrite(initialUrl)), $rootElement.on("click", function(event) {
                if (!event.ctrlKey && !event.metaKey && 2 != event.which) {
                    for (var elm = jqLite(event.target); "a" !== lowercase(elm[0].nodeName); ) if (elm[0] === $rootElement[0] || !(elm = elm.parent())[0]) return;
                    var absHref = elm.prop("href");
                    isObject(absHref) && "[object SVGAnimatedString]" === absHref.toString() && (absHref = urlResolve(absHref.animVal).href);
                    var rewrittenUrl = $location.$$rewrite(absHref);
                    absHref && !elm.attr("target") && rewrittenUrl && !event.isDefaultPrevented() && (event.preventDefault(), 
                    rewrittenUrl != $browser.url() && ($location.$$parse(rewrittenUrl), $rootScope.$apply(), 
                    window.angular["ff-684208-preventDefault"] = !0));
                }
            }), $location.absUrl() != initialUrl && $browser.url($location.absUrl(), !0), $browser.onUrlChange(function(newUrl) {
                $location.absUrl() != newUrl && ($rootScope.$evalAsync(function() {
                    var oldUrl = $location.absUrl();
                    $location.$$parse(newUrl), $rootScope.$broadcast("$locationChangeStart", newUrl, oldUrl).defaultPrevented ? ($location.$$parse(oldUrl), 
                    $browser.url(oldUrl)) : afterLocationChange(oldUrl);
                }), $rootScope.$$phase || $rootScope.$digest());
            });
            var changeCounter = 0;
            return $rootScope.$watch(function() {
                var oldUrl = $browser.url(), currentReplace = $location.$$replace;
                return changeCounter && oldUrl == $location.absUrl() || (changeCounter++, $rootScope.$evalAsync(function() {
                    $rootScope.$broadcast("$locationChangeStart", $location.absUrl(), oldUrl).defaultPrevented ? $location.$$parse(oldUrl) : ($browser.url($location.absUrl(), currentReplace), 
                    afterLocationChange(oldUrl));
                })), $location.$$replace = !1, changeCounter;
            }), $location;
        } ];
    }
    function $LogProvider() {
        var debug = !0, self = this;
        this.debugEnabled = function(flag) {
            return isDefined(flag) ? (debug = flag, this) : debug;
        }, this.$get = [ "$window", function($window) {
            function formatError(arg) {
                return arg instanceof Error && (arg.stack ? arg = arg.message && -1 === arg.stack.indexOf(arg.message) ? "Error: " + arg.message + "\n" + arg.stack : arg.stack : arg.sourceURL && (arg = arg.message + "\n" + arg.sourceURL + ":" + arg.line)), 
                arg;
            }
            function consoleLog(type) {
                var console = $window.console || {}, logFn = console[type] || console.log || noop, hasApply = !1;
                try {
                    hasApply = !!logFn.apply;
                } catch (e) {}
                return hasApply ? function() {
                    var args = [];
                    return forEach(arguments, function(arg) {
                        args.push(formatError(arg));
                    }), logFn.apply(console, args);
                } : function(arg1, arg2) {
                    logFn(arg1, null == arg2 ? "" : arg2);
                };
            }
            return {
                log: consoleLog("log"),
                info: consoleLog("info"),
                warn: consoleLog("warn"),
                error: consoleLog("error"),
                debug: function() {
                    var fn = consoleLog("debug");
                    return function() {
                        debug && fn.apply(self, arguments);
                    };
                }()
            };
        } ];
    }
    function ensureSafeMemberName(name, fullExpression) {
        if ("constructor" === name) throw $parseMinErr("isecfld", 'Referencing "constructor" field in Angular expressions is disallowed! Expression: {0}', fullExpression);
        return name;
    }
    function ensureSafeObject(obj, fullExpression) {
        if (obj) {
            if (obj.constructor === obj) throw $parseMinErr("isecfn", "Referencing Function in Angular expressions is disallowed! Expression: {0}", fullExpression);
            if (obj.document && obj.location && obj.alert && obj.setInterval) throw $parseMinErr("isecwindow", "Referencing the Window in Angular expressions is disallowed! Expression: {0}", fullExpression);
            if (obj.children && (obj.nodeName || obj.on && obj.find)) throw $parseMinErr("isecdom", "Referencing DOM nodes in Angular expressions is disallowed! Expression: {0}", fullExpression);
        }
        return obj;
    }
    function setter(obj, path, setValue, fullExp, options) {
        options = options || {};
        for (var key, element = path.split("."), i = 0; element.length > 1; i++) {
            key = ensureSafeMemberName(element.shift(), fullExp);
            var propertyObj = obj[key];
            propertyObj || (propertyObj = {}, obj[key] = propertyObj), obj = propertyObj, obj.then && options.unwrapPromises && (promiseWarning(fullExp), 
            "$$v" in obj || !function(promise) {
                promise.then(function(val) {
                    promise.$$v = val;
                });
            }(obj), obj.$$v === undefined && (obj.$$v = {}), obj = obj.$$v);
        }
        return key = ensureSafeMemberName(element.shift(), fullExp), obj[key] = setValue, 
        setValue;
    }
    function cspSafeGetterFn(key0, key1, key2, key3, key4, fullExp, options) {
        return ensureSafeMemberName(key0, fullExp), ensureSafeMemberName(key1, fullExp), 
        ensureSafeMemberName(key2, fullExp), ensureSafeMemberName(key3, fullExp), ensureSafeMemberName(key4, fullExp), 
        options.unwrapPromises ? function(scope, locals) {
            var promise, pathVal = locals && locals.hasOwnProperty(key0) ? locals : scope;
            return null == pathVal ? pathVal : (pathVal = pathVal[key0], pathVal && pathVal.then && (promiseWarning(fullExp), 
            "$$v" in pathVal || (promise = pathVal, promise.$$v = undefined, promise.then(function(val) {
                promise.$$v = val;
            })), pathVal = pathVal.$$v), key1 ? null == pathVal ? undefined : (pathVal = pathVal[key1], 
            pathVal && pathVal.then && (promiseWarning(fullExp), "$$v" in pathVal || (promise = pathVal, 
            promise.$$v = undefined, promise.then(function(val) {
                promise.$$v = val;
            })), pathVal = pathVal.$$v), key2 ? null == pathVal ? undefined : (pathVal = pathVal[key2], 
            pathVal && pathVal.then && (promiseWarning(fullExp), "$$v" in pathVal || (promise = pathVal, 
            promise.$$v = undefined, promise.then(function(val) {
                promise.$$v = val;
            })), pathVal = pathVal.$$v), key3 ? null == pathVal ? undefined : (pathVal = pathVal[key3], 
            pathVal && pathVal.then && (promiseWarning(fullExp), "$$v" in pathVal || (promise = pathVal, 
            promise.$$v = undefined, promise.then(function(val) {
                promise.$$v = val;
            })), pathVal = pathVal.$$v), key4 ? null == pathVal ? undefined : (pathVal = pathVal[key4], 
            pathVal && pathVal.then && (promiseWarning(fullExp), "$$v" in pathVal || (promise = pathVal, 
            promise.$$v = undefined, promise.then(function(val) {
                promise.$$v = val;
            })), pathVal = pathVal.$$v), pathVal) : pathVal) : pathVal) : pathVal) : pathVal);
        } : function(scope, locals) {
            var pathVal = locals && locals.hasOwnProperty(key0) ? locals : scope;
            return null == pathVal ? pathVal : (pathVal = pathVal[key0], key1 ? null == pathVal ? undefined : (pathVal = pathVal[key1], 
            key2 ? null == pathVal ? undefined : (pathVal = pathVal[key2], key3 ? null == pathVal ? undefined : (pathVal = pathVal[key3], 
            key4 ? null == pathVal ? undefined : pathVal = pathVal[key4] : pathVal) : pathVal) : pathVal) : pathVal);
        };
    }
    function simpleGetterFn1(key0, fullExp) {
        return ensureSafeMemberName(key0, fullExp), function(scope, locals) {
            return null == scope ? undefined : (locals && locals.hasOwnProperty(key0) ? locals : scope)[key0];
        };
    }
    function simpleGetterFn2(key0, key1, fullExp) {
        return ensureSafeMemberName(key0, fullExp), ensureSafeMemberName(key1, fullExp), 
        function(scope, locals) {
            return null == scope ? undefined : (scope = (locals && locals.hasOwnProperty(key0) ? locals : scope)[key0], 
            null == scope ? undefined : scope[key1]);
        };
    }
    function getterFn(path, options, fullExp) {
        if (getterFnCache.hasOwnProperty(path)) return getterFnCache[path];
        var fn, pathKeys = path.split("."), pathKeysLength = pathKeys.length;
        if (options.unwrapPromises || 1 !== pathKeysLength) if (options.unwrapPromises || 2 !== pathKeysLength) if (options.csp) fn = 6 > pathKeysLength ? cspSafeGetterFn(pathKeys[0], pathKeys[1], pathKeys[2], pathKeys[3], pathKeys[4], fullExp, options) : function(scope, locals) {
            var val, i = 0;
            do val = cspSafeGetterFn(pathKeys[i++], pathKeys[i++], pathKeys[i++], pathKeys[i++], pathKeys[i++], fullExp, options)(scope, locals), 
            locals = undefined, scope = val; while (pathKeysLength > i);
            return val;
        }; else {
            var code = "var p;\n";
            forEach(pathKeys, function(key, index) {
                ensureSafeMemberName(key, fullExp), code += "if(s == null) return undefined;\ns=" + (index ? "s" : '((k&&k.hasOwnProperty("' + key + '"))?k:s)') + '["' + key + '"];\n' + (options.unwrapPromises ? 'if (s && s.then) {\n pw("' + fullExp.replace(/(["\r\n])/g, "\\$1") + '");\n if (!("$$v" in s)) {\n p=s;\n p.$$v = undefined;\n p.then(function(v) {p.$$v=v;});\n}\n s=s.$$v\n}\n' : "");
            }), code += "return s;";
            var evaledFnGetter = new Function("s", "k", "pw", code);
            evaledFnGetter.toString = valueFn(code), fn = options.unwrapPromises ? function(scope, locals) {
                return evaledFnGetter(scope, locals, promiseWarning);
            } : evaledFnGetter;
        } else fn = simpleGetterFn2(pathKeys[0], pathKeys[1], fullExp); else fn = simpleGetterFn1(pathKeys[0], fullExp);
        return "hasOwnProperty" !== path && (getterFnCache[path] = fn), fn;
    }
    function $ParseProvider() {
        var cache = {}, $parseOptions = {
            csp: !1,
            unwrapPromises: !1,
            logPromiseWarnings: !0
        };
        this.unwrapPromises = function(value) {
            return isDefined(value) ? ($parseOptions.unwrapPromises = !!value, this) : $parseOptions.unwrapPromises;
        }, this.logPromiseWarnings = function(value) {
            return isDefined(value) ? ($parseOptions.logPromiseWarnings = value, this) : $parseOptions.logPromiseWarnings;
        }, this.$get = [ "$filter", "$sniffer", "$log", function($filter, $sniffer, $log) {
            return $parseOptions.csp = $sniffer.csp, promiseWarning = function(fullExp) {
                $parseOptions.logPromiseWarnings && !promiseWarningCache.hasOwnProperty(fullExp) && (promiseWarningCache[fullExp] = !0, 
                $log.warn("[$parse] Promise found in the expression `" + fullExp + "`. Automatic unwrapping of promises in Angular expressions is deprecated."));
            }, function(exp) {
                var parsedExpression;
                switch (typeof exp) {
                  case "string":
                    if (cache.hasOwnProperty(exp)) return cache[exp];
                    var lexer = new Lexer($parseOptions), parser = new Parser(lexer, $filter, $parseOptions);
                    return parsedExpression = parser.parse(exp, !1), "hasOwnProperty" !== exp && (cache[exp] = parsedExpression), 
                    parsedExpression;

                  case "function":
                    return exp;

                  default:
                    return noop;
                }
            };
        } ];
    }
    function $QProvider() {
        this.$get = [ "$rootScope", "$exceptionHandler", function($rootScope, $exceptionHandler) {
            return qFactory(function(callback) {
                $rootScope.$evalAsync(callback);
            }, $exceptionHandler);
        } ];
    }
    function qFactory(nextTick, exceptionHandler) {
        function defaultCallback(value) {
            return value;
        }
        function defaultErrback(reason) {
            return reject(reason);
        }
        function all(promises) {
            var deferred = defer(), counter = 0, results = isArray(promises) ? [] : {};
            return forEach(promises, function(promise, key) {
                counter++, ref(promise).then(function(value) {
                    results.hasOwnProperty(key) || (results[key] = value, --counter || deferred.resolve(results));
                }, function(reason) {
                    results.hasOwnProperty(key) || deferred.reject(reason);
                });
            }), 0 === counter && deferred.resolve(results), deferred.promise;
        }
        var defer = function() {
            var value, deferred, pending = [];
            return deferred = {
                resolve: function(val) {
                    if (pending) {
                        var callbacks = pending;
                        pending = undefined, value = ref(val), callbacks.length && nextTick(function() {
                            for (var callback, i = 0, ii = callbacks.length; ii > i; i++) callback = callbacks[i], 
                            value.then(callback[0], callback[1], callback[2]);
                        });
                    }
                },
                reject: function(reason) {
                    deferred.resolve(reject(reason));
                },
                notify: function(progress) {
                    if (pending) {
                        var callbacks = pending;
                        pending.length && nextTick(function() {
                            for (var callback, i = 0, ii = callbacks.length; ii > i; i++) callback = callbacks[i], 
                            callback[2](progress);
                        });
                    }
                },
                promise: {
                    then: function(callback, errback, progressback) {
                        var result = defer(), wrappedCallback = function(value) {
                            try {
                                result.resolve((isFunction(callback) ? callback : defaultCallback)(value));
                            } catch (e) {
                                result.reject(e), exceptionHandler(e);
                            }
                        }, wrappedErrback = function(reason) {
                            try {
                                result.resolve((isFunction(errback) ? errback : defaultErrback)(reason));
                            } catch (e) {
                                result.reject(e), exceptionHandler(e);
                            }
                        }, wrappedProgressback = function(progress) {
                            try {
                                result.notify((isFunction(progressback) ? progressback : defaultCallback)(progress));
                            } catch (e) {
                                exceptionHandler(e);
                            }
                        };
                        return pending ? pending.push([ wrappedCallback, wrappedErrback, wrappedProgressback ]) : value.then(wrappedCallback, wrappedErrback, wrappedProgressback), 
                        result.promise;
                    },
                    "catch": function(callback) {
                        return this.then(null, callback);
                    },
                    "finally": function(callback) {
                        function makePromise(value, resolved) {
                            var result = defer();
                            return resolved ? result.resolve(value) : result.reject(value), result.promise;
                        }
                        function handleCallback(value, isResolved) {
                            var callbackOutput = null;
                            try {
                                callbackOutput = (callback || defaultCallback)();
                            } catch (e) {
                                return makePromise(e, !1);
                            }
                            return callbackOutput && isFunction(callbackOutput.then) ? callbackOutput.then(function() {
                                return makePromise(value, isResolved);
                            }, function(error) {
                                return makePromise(error, !1);
                            }) : makePromise(value, isResolved);
                        }
                        return this.then(function(value) {
                            return handleCallback(value, !0);
                        }, function(error) {
                            return handleCallback(error, !1);
                        });
                    }
                }
            };
        }, ref = function(value) {
            return value && isFunction(value.then) ? value : {
                then: function(callback) {
                    var result = defer();
                    return nextTick(function() {
                        result.resolve(callback(value));
                    }), result.promise;
                }
            };
        }, reject = function(reason) {
            return {
                then: function(callback, errback) {
                    var result = defer();
                    return nextTick(function() {
                        try {
                            result.resolve((isFunction(errback) ? errback : defaultErrback)(reason));
                        } catch (e) {
                            result.reject(e), exceptionHandler(e);
                        }
                    }), result.promise;
                }
            };
        }, when = function(value, callback, errback, progressback) {
            var done, result = defer(), wrappedCallback = function(value) {
                try {
                    return (isFunction(callback) ? callback : defaultCallback)(value);
                } catch (e) {
                    return exceptionHandler(e), reject(e);
                }
            }, wrappedErrback = function(reason) {
                try {
                    return (isFunction(errback) ? errback : defaultErrback)(reason);
                } catch (e) {
                    return exceptionHandler(e), reject(e);
                }
            }, wrappedProgressback = function(progress) {
                try {
                    return (isFunction(progressback) ? progressback : defaultCallback)(progress);
                } catch (e) {
                    exceptionHandler(e);
                }
            };
            return nextTick(function() {
                ref(value).then(function(value) {
                    done || (done = !0, result.resolve(ref(value).then(wrappedCallback, wrappedErrback, wrappedProgressback)));
                }, function(reason) {
                    done || (done = !0, result.resolve(wrappedErrback(reason)));
                }, function(progress) {
                    done || result.notify(wrappedProgressback(progress));
                });
            }), result.promise;
        };
        return {
            defer: defer,
            reject: reject,
            when: when,
            all: all
        };
    }
    function $RootScopeProvider() {
        var TTL = 10, $rootScopeMinErr = minErr("$rootScope"), lastDirtyWatch = null;
        this.digestTtl = function(value) {
            return arguments.length && (TTL = value), TTL;
        }, this.$get = [ "$injector", "$exceptionHandler", "$parse", "$browser", function($injector, $exceptionHandler, $parse, $browser) {
            function Scope() {
                this.$id = nextUid(), this.$$phase = this.$parent = this.$$watchers = this.$$nextSibling = this.$$prevSibling = this.$$childHead = this.$$childTail = null, 
                this["this"] = this.$root = this, this.$$destroyed = !1, this.$$asyncQueue = [], 
                this.$$postDigestQueue = [], this.$$listeners = {}, this.$$listenerCount = {}, this.$$isolateBindings = {};
            }
            function beginPhase(phase) {
                if ($rootScope.$$phase) throw $rootScopeMinErr("inprog", "{0} already in progress", $rootScope.$$phase);
                $rootScope.$$phase = phase;
            }
            function clearPhase() {
                $rootScope.$$phase = null;
            }
            function compileToFn(exp, name) {
                var fn = $parse(exp);
                return assertArgFn(fn, name), fn;
            }
            function decrementListenerCount(current, count, name) {
                do current.$$listenerCount[name] -= count, 0 === current.$$listenerCount[name] && delete current.$$listenerCount[name]; while (current = current.$parent);
            }
            function initWatchVal() {}
            Scope.prototype = {
                constructor: Scope,
                $new: function(isolate) {
                    var ChildScope, child;
                    return isolate ? (child = new Scope(), child.$root = this.$root, child.$$asyncQueue = this.$$asyncQueue, 
                    child.$$postDigestQueue = this.$$postDigestQueue) : (ChildScope = function() {}, 
                    ChildScope.prototype = this, child = new ChildScope(), child.$id = nextUid()), child["this"] = child, 
                    child.$$listeners = {}, child.$$listenerCount = {}, child.$parent = this, child.$$watchers = child.$$nextSibling = child.$$childHead = child.$$childTail = null, 
                    child.$$prevSibling = this.$$childTail, this.$$childHead ? (this.$$childTail.$$nextSibling = child, 
                    this.$$childTail = child) : this.$$childHead = this.$$childTail = child, child;
                },
                $watch: function(watchExp, listener, objectEquality) {
                    var scope = this, get = compileToFn(watchExp, "watch"), array = scope.$$watchers, watcher = {
                        fn: listener,
                        last: initWatchVal,
                        get: get,
                        exp: watchExp,
                        eq: !!objectEquality
                    };
                    if (lastDirtyWatch = null, !isFunction(listener)) {
                        var listenFn = compileToFn(listener || noop, "listener");
                        watcher.fn = function(newVal, oldVal, scope) {
                            listenFn(scope);
                        };
                    }
                    if ("string" == typeof watchExp && get.constant) {
                        var originalFn = watcher.fn;
                        watcher.fn = function(newVal, oldVal, scope) {
                            originalFn.call(this, newVal, oldVal, scope), arrayRemove(array, watcher);
                        };
                    }
                    return array || (array = scope.$$watchers = []), array.unshift(watcher), function() {
                        arrayRemove(array, watcher), lastDirtyWatch = null;
                    };
                },
                $watchCollection: function(obj, listener) {
                    function $watchCollectionWatch() {
                        newValue = objGetter(self);
                        var newLength, key;
                        if (isObject(newValue)) if (isArrayLike(newValue)) {
                            oldValue !== internalArray && (oldValue = internalArray, oldLength = oldValue.length = 0, 
                            changeDetected++), newLength = newValue.length, oldLength !== newLength && (changeDetected++, 
                            oldValue.length = oldLength = newLength);
                            for (var i = 0; newLength > i; i++) oldValue[i] !== newValue[i] && (changeDetected++, 
                            oldValue[i] = newValue[i]);
                        } else {
                            oldValue !== internalObject && (oldValue = internalObject = {}, oldLength = 0, changeDetected++), 
                            newLength = 0;
                            for (key in newValue) newValue.hasOwnProperty(key) && (newLength++, oldValue.hasOwnProperty(key) ? oldValue[key] !== newValue[key] && (changeDetected++, 
                            oldValue[key] = newValue[key]) : (oldLength++, oldValue[key] = newValue[key], changeDetected++));
                            if (oldLength > newLength) {
                                changeDetected++;
                                for (key in oldValue) oldValue.hasOwnProperty(key) && !newValue.hasOwnProperty(key) && (oldLength--, 
                                delete oldValue[key]);
                            }
                        } else oldValue !== newValue && (oldValue = newValue, changeDetected++);
                        return changeDetected;
                    }
                    function $watchCollectionAction() {
                        listener(newValue, oldValue, self);
                    }
                    var oldValue, newValue, self = this, changeDetected = 0, objGetter = $parse(obj), internalArray = [], internalObject = {}, oldLength = 0;
                    return this.$watch($watchCollectionWatch, $watchCollectionAction);
                },
                $digest: function() {
                    var watch, value, last, watchers, length, dirty, next, current, logIdx, logMsg, asyncTask, asyncQueue = this.$$asyncQueue, postDigestQueue = this.$$postDigestQueue, ttl = TTL, target = this, watchLog = [];
                    beginPhase("$digest"), lastDirtyWatch = null;
                    do {
                        for (dirty = !1, current = target; asyncQueue.length; ) {
                            try {
                                asyncTask = asyncQueue.shift(), asyncTask.scope.$eval(asyncTask.expression);
                            } catch (e) {
                                clearPhase(), $exceptionHandler(e);
                            }
                            lastDirtyWatch = null;
                        }
                        traverseScopesLoop: do {
                            if (watchers = current.$$watchers) for (length = watchers.length; length--; ) try {
                                if (watch = watchers[length]) if ((value = watch.get(current)) === (last = watch.last) || (watch.eq ? equals(value, last) : "number" == typeof value && "number" == typeof last && isNaN(value) && isNaN(last))) {
                                    if (watch === lastDirtyWatch) {
                                        dirty = !1;
                                        break traverseScopesLoop;
                                    }
                                } else dirty = !0, lastDirtyWatch = watch, watch.last = watch.eq ? copy(value) : value, 
                                watch.fn(value, last === initWatchVal ? value : last, current), 5 > ttl && (logIdx = 4 - ttl, 
                                watchLog[logIdx] || (watchLog[logIdx] = []), logMsg = isFunction(watch.exp) ? "fn: " + (watch.exp.name || watch.exp.toString()) : watch.exp, 
                                logMsg += "; newVal: " + toJson(value) + "; oldVal: " + toJson(last), watchLog[logIdx].push(logMsg));
                            } catch (e) {
                                clearPhase(), $exceptionHandler(e);
                            }
                            if (!(next = current.$$childHead || current !== target && current.$$nextSibling)) for (;current !== target && !(next = current.$$nextSibling); ) current = current.$parent;
                        } while (current = next);
                        if ((dirty || asyncQueue.length) && !ttl--) throw clearPhase(), $rootScopeMinErr("infdig", "{0} $digest() iterations reached. Aborting!\nWatchers fired in the last 5 iterations: {1}", TTL, toJson(watchLog));
                    } while (dirty || asyncQueue.length);
                    for (clearPhase(); postDigestQueue.length; ) try {
                        postDigestQueue.shift()();
                    } catch (e) {
                        $exceptionHandler(e);
                    }
                },
                $destroy: function() {
                    if (!this.$$destroyed) {
                        var parent = this.$parent;
                        this.$broadcast("$destroy"), this.$$destroyed = !0, this !== $rootScope && (forEach(this.$$listenerCount, bind(null, decrementListenerCount, this)), 
                        parent.$$childHead == this && (parent.$$childHead = this.$$nextSibling), parent.$$childTail == this && (parent.$$childTail = this.$$prevSibling), 
                        this.$$prevSibling && (this.$$prevSibling.$$nextSibling = this.$$nextSibling), this.$$nextSibling && (this.$$nextSibling.$$prevSibling = this.$$prevSibling), 
                        this.$parent = this.$$nextSibling = this.$$prevSibling = this.$$childHead = this.$$childTail = null);
                    }
                },
                $eval: function(expr, locals) {
                    return $parse(expr)(this, locals);
                },
                $evalAsync: function(expr) {
                    $rootScope.$$phase || $rootScope.$$asyncQueue.length || $browser.defer(function() {
                        $rootScope.$$asyncQueue.length && $rootScope.$digest();
                    }), this.$$asyncQueue.push({
                        scope: this,
                        expression: expr
                    });
                },
                $$postDigest: function(fn) {
                    this.$$postDigestQueue.push(fn);
                },
                $apply: function(expr) {
                    try {
                        return beginPhase("$apply"), this.$eval(expr);
                    } catch (e) {
                        $exceptionHandler(e);
                    } finally {
                        clearPhase();
                        try {
                            $rootScope.$digest();
                        } catch (e) {
                            throw $exceptionHandler(e), e;
                        }
                    }
                },
                $on: function(name, listener) {
                    var namedListeners = this.$$listeners[name];
                    namedListeners || (this.$$listeners[name] = namedListeners = []), namedListeners.push(listener);
                    var current = this;
                    do current.$$listenerCount[name] || (current.$$listenerCount[name] = 0), current.$$listenerCount[name]++; while (current = current.$parent);
                    var self = this;
                    return function() {
                        namedListeners[indexOf(namedListeners, listener)] = null, decrementListenerCount(self, 1, name);
                    };
                },
                $emit: function(name) {
                    var namedListeners, i, length, empty = [], scope = this, stopPropagation = !1, event = {
                        name: name,
                        targetScope: scope,
                        stopPropagation: function() {
                            stopPropagation = !0;
                        },
                        preventDefault: function() {
                            event.defaultPrevented = !0;
                        },
                        defaultPrevented: !1
                    }, listenerArgs = concat([ event ], arguments, 1);
                    do {
                        for (namedListeners = scope.$$listeners[name] || empty, event.currentScope = scope, 
                        i = 0, length = namedListeners.length; length > i; i++) if (namedListeners[i]) try {
                            namedListeners[i].apply(null, listenerArgs);
                        } catch (e) {
                            $exceptionHandler(e);
                        } else namedListeners.splice(i, 1), i--, length--;
                        if (stopPropagation) return event;
                        scope = scope.$parent;
                    } while (scope);
                    return event;
                },
                $broadcast: function(name) {
                    for (var listeners, i, length, target = this, current = target, next = target, event = {
                        name: name,
                        targetScope: target,
                        preventDefault: function() {
                            event.defaultPrevented = !0;
                        },
                        defaultPrevented: !1
                    }, listenerArgs = concat([ event ], arguments, 1); current = next; ) {
                        for (event.currentScope = current, listeners = current.$$listeners[name] || [], 
                        i = 0, length = listeners.length; length > i; i++) if (listeners[i]) try {
                            listeners[i].apply(null, listenerArgs);
                        } catch (e) {
                            $exceptionHandler(e);
                        } else listeners.splice(i, 1), i--, length--;
                        if (!(next = current.$$listenerCount[name] && current.$$childHead || current !== target && current.$$nextSibling)) for (;current !== target && !(next = current.$$nextSibling); ) current = current.$parent;
                    }
                    return event;
                }
            };
            var $rootScope = new Scope();
            return $rootScope;
        } ];
    }
    function $$SanitizeUriProvider() {
        var aHrefSanitizationWhitelist = /^\s*(https?|ftp|mailto|tel|file):/, imgSrcSanitizationWhitelist = /^\s*(https?|ftp|file):|data:image\//;
        this.aHrefSanitizationWhitelist = function(regexp) {
            return isDefined(regexp) ? (aHrefSanitizationWhitelist = regexp, this) : aHrefSanitizationWhitelist;
        }, this.imgSrcSanitizationWhitelist = function(regexp) {
            return isDefined(regexp) ? (imgSrcSanitizationWhitelist = regexp, this) : imgSrcSanitizationWhitelist;
        }, this.$get = function() {
            return function(uri, isImage) {
                var normalizedVal, regex = isImage ? imgSrcSanitizationWhitelist : aHrefSanitizationWhitelist;
                return msie && !(msie >= 8) || (normalizedVal = urlResolve(uri).href, "" === normalizedVal || normalizedVal.match(regex)) ? uri : "unsafe:" + normalizedVal;
            };
        };
    }
    function escapeForRegexp(s) {
        return s.replace(/([-()\[\]{}+?*.$\^|,:#<!\\])/g, "\\$1").replace(/\x08/g, "\\x08");
    }
    function adjustMatcher(matcher) {
        if ("self" === matcher) return matcher;
        if (isString(matcher)) {
            if (matcher.indexOf("***") > -1) throw $sceMinErr("iwcard", "Illegal sequence *** in string matcher.  String: {0}", matcher);
            return matcher = escapeForRegexp(matcher).replace("\\*\\*", ".*").replace("\\*", "[^:/.?&;]*"), 
            new RegExp("^" + matcher + "$");
        }
        if (isRegExp(matcher)) return new RegExp("^" + matcher.source + "$");
        throw $sceMinErr("imatcher", 'Matchers may only be "self", string patterns or RegExp objects');
    }
    function adjustMatchers(matchers) {
        var adjustedMatchers = [];
        return isDefined(matchers) && forEach(matchers, function(matcher) {
            adjustedMatchers.push(adjustMatcher(matcher));
        }), adjustedMatchers;
    }
    function $SceDelegateProvider() {
        this.SCE_CONTEXTS = SCE_CONTEXTS;
        var resourceUrlWhitelist = [ "self" ], resourceUrlBlacklist = [];
        this.resourceUrlWhitelist = function(value) {
            return arguments.length && (resourceUrlWhitelist = adjustMatchers(value)), resourceUrlWhitelist;
        }, this.resourceUrlBlacklist = function(value) {
            return arguments.length && (resourceUrlBlacklist = adjustMatchers(value)), resourceUrlBlacklist;
        }, this.$get = [ "$injector", function($injector) {
            function matchUrl(matcher, parsedUrl) {
                return "self" === matcher ? urlIsSameOrigin(parsedUrl) : !!matcher.exec(parsedUrl.href);
            }
            function isResourceUrlAllowedByPolicy(url) {
                var i, n, parsedUrl = urlResolve(url.toString()), allowed = !1;
                for (i = 0, n = resourceUrlWhitelist.length; n > i; i++) if (matchUrl(resourceUrlWhitelist[i], parsedUrl)) {
                    allowed = !0;
                    break;
                }
                if (allowed) for (i = 0, n = resourceUrlBlacklist.length; n > i; i++) if (matchUrl(resourceUrlBlacklist[i], parsedUrl)) {
                    allowed = !1;
                    break;
                }
                return allowed;
            }
            function generateHolderType(Base) {
                var holderType = function(trustedValue) {
                    this.$$unwrapTrustedValue = function() {
                        return trustedValue;
                    };
                };
                return Base && (holderType.prototype = new Base()), holderType.prototype.valueOf = function() {
                    return this.$$unwrapTrustedValue();
                }, holderType.prototype.toString = function() {
                    return this.$$unwrapTrustedValue().toString();
                }, holderType;
            }
            function trustAs(type, trustedValue) {
                var Constructor = byType.hasOwnProperty(type) ? byType[type] : null;
                if (!Constructor) throw $sceMinErr("icontext", "Attempted to trust a value in invalid context. Context: {0}; Value: {1}", type, trustedValue);
                if (null === trustedValue || trustedValue === undefined || "" === trustedValue) return trustedValue;
                if ("string" != typeof trustedValue) throw $sceMinErr("itype", "Attempted to trust a non-string value in a content requiring a string: Context: {0}", type);
                return new Constructor(trustedValue);
            }
            function valueOf(maybeTrusted) {
                return maybeTrusted instanceof trustedValueHolderBase ? maybeTrusted.$$unwrapTrustedValue() : maybeTrusted;
            }
            function getTrusted(type, maybeTrusted) {
                if (null === maybeTrusted || maybeTrusted === undefined || "" === maybeTrusted) return maybeTrusted;
                var constructor = byType.hasOwnProperty(type) ? byType[type] : null;
                if (constructor && maybeTrusted instanceof constructor) return maybeTrusted.$$unwrapTrustedValue();
                if (type === SCE_CONTEXTS.RESOURCE_URL) {
                    if (isResourceUrlAllowedByPolicy(maybeTrusted)) return maybeTrusted;
                    throw $sceMinErr("insecurl", "Blocked loading resource from url not allowed by $sceDelegate policy.  URL: {0}", maybeTrusted.toString());
                }
                if (type === SCE_CONTEXTS.HTML) return htmlSanitizer(maybeTrusted);
                throw $sceMinErr("unsafe", "Attempting to use an unsafe value in a safe context.");
            }
            var htmlSanitizer = function() {
                throw $sceMinErr("unsafe", "Attempting to use an unsafe value in a safe context.");
            };
            $injector.has("$sanitize") && (htmlSanitizer = $injector.get("$sanitize"));
            var trustedValueHolderBase = generateHolderType(), byType = {};
            return byType[SCE_CONTEXTS.HTML] = generateHolderType(trustedValueHolderBase), byType[SCE_CONTEXTS.CSS] = generateHolderType(trustedValueHolderBase), 
            byType[SCE_CONTEXTS.URL] = generateHolderType(trustedValueHolderBase), byType[SCE_CONTEXTS.JS] = generateHolderType(trustedValueHolderBase), 
            byType[SCE_CONTEXTS.RESOURCE_URL] = generateHolderType(byType[SCE_CONTEXTS.URL]), 
            {
                trustAs: trustAs,
                getTrusted: getTrusted,
                valueOf: valueOf
            };
        } ];
    }
    function $SceProvider() {
        var enabled = !0;
        this.enabled = function(value) {
            return arguments.length && (enabled = !!value), enabled;
        }, this.$get = [ "$parse", "$sniffer", "$sceDelegate", function($parse, $sniffer, $sceDelegate) {
            if (enabled && $sniffer.msie && $sniffer.msieDocumentMode < 8) throw $sceMinErr("iequirks", "Strict Contextual Escaping does not support Internet Explorer version < 9 in quirks mode.  You can fix this by adding the text <!doctype html> to the top of your HTML document.  See http://docs.angularjs.org/api/ng.$sce for more information.");
            var sce = copy(SCE_CONTEXTS);
            sce.isEnabled = function() {
                return enabled;
            }, sce.trustAs = $sceDelegate.trustAs, sce.getTrusted = $sceDelegate.getTrusted, 
            sce.valueOf = $sceDelegate.valueOf, enabled || (sce.trustAs = sce.getTrusted = function(type, value) {
                return value;
            }, sce.valueOf = identity), sce.parseAs = function(type, expr) {
                var parsed = $parse(expr);
                return parsed.literal && parsed.constant ? parsed : function(self, locals) {
                    return sce.getTrusted(type, parsed(self, locals));
                };
            };
            var parse = sce.parseAs, getTrusted = sce.getTrusted, trustAs = sce.trustAs;
            return forEach(SCE_CONTEXTS, function(enumValue, name) {
                var lName = lowercase(name);
                sce[camelCase("parse_as_" + lName)] = function(expr) {
                    return parse(enumValue, expr);
                }, sce[camelCase("get_trusted_" + lName)] = function(value) {
                    return getTrusted(enumValue, value);
                }, sce[camelCase("trust_as_" + lName)] = function(value) {
                    return trustAs(enumValue, value);
                };
            }), sce;
        } ];
    }
    function $SnifferProvider() {
        this.$get = [ "$window", "$document", function($window, $document) {
            var vendorPrefix, match, eventSupport = {}, android = int((/android (\d+)/.exec(lowercase(($window.navigator || {}).userAgent)) || [])[1]), boxee = /Boxee/i.test(($window.navigator || {}).userAgent), document = $document[0] || {}, documentMode = document.documentMode, vendorRegex = /^(Moz|webkit|O|ms)(?=[A-Z])/, bodyStyle = document.body && document.body.style, transitions = !1, animations = !1;
            if (bodyStyle) {
                for (var prop in bodyStyle) if (match = vendorRegex.exec(prop)) {
                    vendorPrefix = match[0], vendorPrefix = vendorPrefix.substr(0, 1).toUpperCase() + vendorPrefix.substr(1);
                    break;
                }
                vendorPrefix || (vendorPrefix = "WebkitOpacity" in bodyStyle && "webkit"), transitions = !!("transition" in bodyStyle || vendorPrefix + "Transition" in bodyStyle), 
                animations = !!("animation" in bodyStyle || vendorPrefix + "Animation" in bodyStyle), 
                !android || transitions && animations || (transitions = isString(document.body.style.webkitTransition), 
                animations = isString(document.body.style.webkitAnimation));
            }
            return {
                history: !(!$window.history || !$window.history.pushState || 4 > android || boxee),
                hashchange: "onhashchange" in $window && (!documentMode || documentMode > 7),
                hasEvent: function(event) {
                    if ("input" == event && 9 == msie) return !1;
                    if (isUndefined(eventSupport[event])) {
                        var divElm = document.createElement("div");
                        eventSupport[event] = "on" + event in divElm;
                    }
                    return eventSupport[event];
                },
                csp: csp(),
                vendorPrefix: vendorPrefix,
                transitions: transitions,
                animations: animations,
                android: android,
                msie: msie,
                msieDocumentMode: documentMode
            };
        } ];
    }
    function $TimeoutProvider() {
        this.$get = [ "$rootScope", "$browser", "$q", "$exceptionHandler", function($rootScope, $browser, $q, $exceptionHandler) {
            function timeout(fn, delay, invokeApply) {
                var timeoutId, deferred = $q.defer(), promise = deferred.promise, skipApply = isDefined(invokeApply) && !invokeApply;
                return timeoutId = $browser.defer(function() {
                    try {
                        deferred.resolve(fn());
                    } catch (e) {
                        deferred.reject(e), $exceptionHandler(e);
                    } finally {
                        delete deferreds[promise.$$timeoutId];
                    }
                    skipApply || $rootScope.$apply();
                }, delay), promise.$$timeoutId = timeoutId, deferreds[timeoutId] = deferred, promise;
            }
            var deferreds = {};
            return timeout.cancel = function(promise) {
                return promise && promise.$$timeoutId in deferreds ? (deferreds[promise.$$timeoutId].reject("canceled"), 
                delete deferreds[promise.$$timeoutId], $browser.defer.cancel(promise.$$timeoutId)) : !1;
            }, timeout;
        } ];
    }
    function urlResolve(url) {
        var href = url;
        return msie && (urlParsingNode.setAttribute("href", href), href = urlParsingNode.href), 
        urlParsingNode.setAttribute("href", href), {
            href: urlParsingNode.href,
            protocol: urlParsingNode.protocol ? urlParsingNode.protocol.replace(/:$/, "") : "",
            host: urlParsingNode.host,
            search: urlParsingNode.search ? urlParsingNode.search.replace(/^\?/, "") : "",
            hash: urlParsingNode.hash ? urlParsingNode.hash.replace(/^#/, "") : "",
            hostname: urlParsingNode.hostname,
            port: urlParsingNode.port,
            pathname: "/" === urlParsingNode.pathname.charAt(0) ? urlParsingNode.pathname : "/" + urlParsingNode.pathname
        };
    }
    function urlIsSameOrigin(requestUrl) {
        var parsed = isString(requestUrl) ? urlResolve(requestUrl) : requestUrl;
        return parsed.protocol === originUrl.protocol && parsed.host === originUrl.host;
    }
    function $WindowProvider() {
        this.$get = valueFn(window);
    }
    function $FilterProvider($provide) {
        function register(name, factory) {
            if (isObject(name)) {
                var filters = {};
                return forEach(name, function(filter, key) {
                    filters[key] = register(key, filter);
                }), filters;
            }
            return $provide.factory(name + suffix, factory);
        }
        var suffix = "Filter";
        this.register = register, this.$get = [ "$injector", function($injector) {
            return function(name) {
                return $injector.get(name + suffix);
            };
        } ], register("currency", currencyFilter), register("date", dateFilter), register("filter", filterFilter), 
        register("json", jsonFilter), register("limitTo", limitToFilter), register("lowercase", lowercaseFilter), 
        register("number", numberFilter), register("orderBy", orderByFilter), register("uppercase", uppercaseFilter);
    }
    function filterFilter() {
        return function(array, expression, comparator) {
            if (!isArray(array)) return array;
            var comparatorType = typeof comparator, predicates = [];
            predicates.check = function(value) {
                for (var j = 0; j < predicates.length; j++) if (!predicates[j](value)) return !1;
                return !0;
            }, "function" !== comparatorType && (comparator = "boolean" === comparatorType && comparator ? function(obj, text) {
                return angular.equals(obj, text);
            } : function(obj, text) {
                return text = ("" + text).toLowerCase(), ("" + obj).toLowerCase().indexOf(text) > -1;
            });
            var search = function(obj, text) {
                if ("string" == typeof text && "!" === text.charAt(0)) return !search(obj, text.substr(1));
                switch (typeof obj) {
                  case "boolean":
                  case "number":
                  case "string":
                    return comparator(obj, text);

                  case "object":
                    switch (typeof text) {
                      case "object":
                        return comparator(obj, text);

                      default:
                        for (var objKey in obj) if ("$" !== objKey.charAt(0) && search(obj[objKey], text)) return !0;
                    }
                    return !1;

                  case "array":
                    for (var i = 0; i < obj.length; i++) if (search(obj[i], text)) return !0;
                    return !1;

                  default:
                    return !1;
                }
            };
            switch (typeof expression) {
              case "boolean":
              case "number":
              case "string":
                expression = {
                    $: expression
                };

              case "object":
                for (var key in expression) !function(path) {
                    "undefined" != typeof expression[path] && predicates.push(function(value) {
                        return search("$" == path ? value : getter(value, path), expression[path]);
                    });
                }(key);
                break;

              case "function":
                predicates.push(expression);
                break;

              default:
                return array;
            }
            for (var filtered = [], j = 0; j < array.length; j++) {
                var value = array[j];
                predicates.check(value) && filtered.push(value);
            }
            return filtered;
        };
    }
    function currencyFilter($locale) {
        var formats = $locale.NUMBER_FORMATS;
        return function(amount, currencySymbol) {
            return isUndefined(currencySymbol) && (currencySymbol = formats.CURRENCY_SYM), formatNumber(amount, formats.PATTERNS[1], formats.GROUP_SEP, formats.DECIMAL_SEP, 2).replace(/\u00A4/g, currencySymbol);
        };
    }
    function numberFilter($locale) {
        var formats = $locale.NUMBER_FORMATS;
        return function(number, fractionSize) {
            return formatNumber(number, formats.PATTERNS[0], formats.GROUP_SEP, formats.DECIMAL_SEP, fractionSize);
        };
    }
    function formatNumber(number, pattern, groupSep, decimalSep, fractionSize) {
        if (isNaN(number) || !isFinite(number)) return "";
        var isNegative = 0 > number;
        number = Math.abs(number);
        var numStr = number + "", formatedText = "", parts = [], hasExponent = !1;
        if (-1 !== numStr.indexOf("e")) {
            var match = numStr.match(/([\d\.]+)e(-?)(\d+)/);
            match && "-" == match[2] && match[3] > fractionSize + 1 ? numStr = "0" : (formatedText = numStr, 
            hasExponent = !0);
        }
        if (hasExponent) fractionSize > 0 && number > -1 && 1 > number && (formatedText = number.toFixed(fractionSize)); else {
            var fractionLen = (numStr.split(DECIMAL_SEP)[1] || "").length;
            isUndefined(fractionSize) && (fractionSize = Math.min(Math.max(pattern.minFrac, fractionLen), pattern.maxFrac));
            var pow = Math.pow(10, fractionSize);
            number = Math.round(number * pow) / pow;
            var fraction = ("" + number).split(DECIMAL_SEP), whole = fraction[0];
            fraction = fraction[1] || "";
            var i, pos = 0, lgroup = pattern.lgSize, group = pattern.gSize;
            if (whole.length >= lgroup + group) for (pos = whole.length - lgroup, i = 0; pos > i; i++) (pos - i) % group === 0 && 0 !== i && (formatedText += groupSep), 
            formatedText += whole.charAt(i);
            for (i = pos; i < whole.length; i++) (whole.length - i) % lgroup === 0 && 0 !== i && (formatedText += groupSep), 
            formatedText += whole.charAt(i);
            for (;fraction.length < fractionSize; ) fraction += "0";
            fractionSize && "0" !== fractionSize && (formatedText += decimalSep + fraction.substr(0, fractionSize));
        }
        return parts.push(isNegative ? pattern.negPre : pattern.posPre), parts.push(formatedText), 
        parts.push(isNegative ? pattern.negSuf : pattern.posSuf), parts.join("");
    }
    function padNumber(num, digits, trim) {
        var neg = "";
        for (0 > num && (neg = "-", num = -num), num = "" + num; num.length < digits; ) num = "0" + num;
        return trim && (num = num.substr(num.length - digits)), neg + num;
    }
    function dateGetter(name, size, offset, trim) {
        return offset = offset || 0, function(date) {
            var value = date["get" + name]();
            return (offset > 0 || value > -offset) && (value += offset), 0 === value && -12 == offset && (value = 12), 
            padNumber(value, size, trim);
        };
    }
    function dateStrGetter(name, shortForm) {
        return function(date, formats) {
            var value = date["get" + name](), get = uppercase(shortForm ? "SHORT" + name : name);
            return formats[get][value];
        };
    }
    function timeZoneGetter(date) {
        var zone = -1 * date.getTimezoneOffset(), paddedZone = zone >= 0 ? "+" : "";
        return paddedZone += padNumber(Math[zone > 0 ? "floor" : "ceil"](zone / 60), 2) + padNumber(Math.abs(zone % 60), 2);
    }
    function ampmGetter(date, formats) {
        return date.getHours() < 12 ? formats.AMPMS[0] : formats.AMPMS[1];
    }
    function dateFilter($locale) {
        function jsonStringToDate(string) {
            var match;
            if (match = string.match(R_ISO8601_STR)) {
                var date = new Date(0), tzHour = 0, tzMin = 0, dateSetter = match[8] ? date.setUTCFullYear : date.setFullYear, timeSetter = match[8] ? date.setUTCHours : date.setHours;
                match[9] && (tzHour = int(match[9] + match[10]), tzMin = int(match[9] + match[11])), 
                dateSetter.call(date, int(match[1]), int(match[2]) - 1, int(match[3]));
                var h = int(match[4] || 0) - tzHour, m = int(match[5] || 0) - tzMin, s = int(match[6] || 0), ms = Math.round(1e3 * parseFloat("0." + (match[7] || 0)));
                return timeSetter.call(date, h, m, s, ms), date;
            }
            return string;
        }
        var R_ISO8601_STR = /^(\d{4})-?(\d\d)-?(\d\d)(?:T(\d\d)(?::?(\d\d)(?::?(\d\d)(?:\.(\d+))?)?)?(Z|([+-])(\d\d):?(\d\d))?)?$/;
        return function(date, format) {
            var fn, match, text = "", parts = [];
            if (format = format || "mediumDate", format = $locale.DATETIME_FORMATS[format] || format, 
            isString(date) && (date = NUMBER_STRING.test(date) ? int(date) : jsonStringToDate(date)), 
            isNumber(date) && (date = new Date(date)), !isDate(date)) return date;
            for (;format; ) match = DATE_FORMATS_SPLIT.exec(format), match ? (parts = concat(parts, match, 1), 
            format = parts.pop()) : (parts.push(format), format = null);
            return forEach(parts, function(value) {
                fn = DATE_FORMATS[value], text += fn ? fn(date, $locale.DATETIME_FORMATS) : value.replace(/(^'|'$)/g, "").replace(/''/g, "'");
            }), text;
        };
    }
    function jsonFilter() {
        return function(object) {
            return toJson(object, !0);
        };
    }
    function limitToFilter() {
        return function(input, limit) {
            if (!isArray(input) && !isString(input)) return input;
            if (limit = int(limit), isString(input)) return limit ? limit >= 0 ? input.slice(0, limit) : input.slice(limit, input.length) : "";
            var i, n, out = [];
            for (limit > input.length ? limit = input.length : limit < -input.length && (limit = -input.length), 
            limit > 0 ? (i = 0, n = limit) : (i = input.length + limit, n = input.length); n > i; i++) out.push(input[i]);
            return out;
        };
    }
    function orderByFilter($parse) {
        return function(array, sortPredicate, reverseOrder) {
            function comparator(o1, o2) {
                for (var i = 0; i < sortPredicate.length; i++) {
                    var comp = sortPredicate[i](o1, o2);
                    if (0 !== comp) return comp;
                }
                return 0;
            }
            function reverseComparator(comp, descending) {
                return toBoolean(descending) ? function(a, b) {
                    return comp(b, a);
                } : comp;
            }
            function compare(v1, v2) {
                var t1 = typeof v1, t2 = typeof v2;
                return t1 == t2 ? ("string" == t1 && (v1 = v1.toLowerCase(), v2 = v2.toLowerCase()), 
                v1 === v2 ? 0 : v2 > v1 ? -1 : 1) : t2 > t1 ? -1 : 1;
            }
            if (!isArray(array)) return array;
            if (!sortPredicate) return array;
            sortPredicate = isArray(sortPredicate) ? sortPredicate : [ sortPredicate ], sortPredicate = map(sortPredicate, function(predicate) {
                var descending = !1, get = predicate || identity;
                return isString(predicate) && (("+" == predicate.charAt(0) || "-" == predicate.charAt(0)) && (descending = "-" == predicate.charAt(0), 
                predicate = predicate.substring(1)), get = $parse(predicate)), reverseComparator(function(a, b) {
                    return compare(get(a), get(b));
                }, descending);
            });
            for (var arrayCopy = [], i = 0; i < array.length; i++) arrayCopy.push(array[i]);
            return arrayCopy.sort(reverseComparator(comparator, reverseOrder));
        };
    }
    function ngDirective(directive) {
        return isFunction(directive) && (directive = {
            link: directive
        }), directive.restrict = directive.restrict || "AC", valueFn(directive);
    }
    function FormController(element, attrs) {
        function toggleValidCss(isValid, validationErrorKey) {
            validationErrorKey = validationErrorKey ? "-" + snake_case(validationErrorKey, "-") : "", 
            element.removeClass((isValid ? INVALID_CLASS : VALID_CLASS) + validationErrorKey).addClass((isValid ? VALID_CLASS : INVALID_CLASS) + validationErrorKey);
        }
        var form = this, parentForm = element.parent().controller("form") || nullFormCtrl, invalidCount = 0, errors = form.$error = {}, controls = [];
        form.$name = attrs.name || attrs.ngForm, form.$dirty = !1, form.$pristine = !0, 
        form.$valid = !0, form.$invalid = !1, parentForm.$addControl(form), element.addClass(PRISTINE_CLASS), 
        toggleValidCss(!0), form.$addControl = function(control) {
            assertNotHasOwnProperty(control.$name, "input"), controls.push(control), control.$name && (form[control.$name] = control);
        }, form.$removeControl = function(control) {
            control.$name && form[control.$name] === control && delete form[control.$name], 
            forEach(errors, function(queue, validationToken) {
                form.$setValidity(validationToken, !0, control);
            }), arrayRemove(controls, control);
        }, form.$setValidity = function(validationToken, isValid, control) {
            var queue = errors[validationToken];
            if (isValid) queue && (arrayRemove(queue, control), queue.length || (invalidCount--, 
            invalidCount || (toggleValidCss(isValid), form.$valid = !0, form.$invalid = !1), 
            errors[validationToken] = !1, toggleValidCss(!0, validationToken), parentForm.$setValidity(validationToken, !0, form))); else {
                if (invalidCount || toggleValidCss(isValid), queue) {
                    if (includes(queue, control)) return;
                } else errors[validationToken] = queue = [], invalidCount++, toggleValidCss(!1, validationToken), 
                parentForm.$setValidity(validationToken, !1, form);
                queue.push(control), form.$valid = !1, form.$invalid = !0;
            }
        }, form.$setDirty = function() {
            element.removeClass(PRISTINE_CLASS).addClass(DIRTY_CLASS), form.$dirty = !0, form.$pristine = !1, 
            parentForm.$setDirty();
        }, form.$setPristine = function() {
            element.removeClass(DIRTY_CLASS).addClass(PRISTINE_CLASS), form.$dirty = !1, form.$pristine = !0, 
            forEach(controls, function(control) {
                control.$setPristine();
            });
        };
    }
    function validate(ctrl, validatorName, validity, value) {
        return ctrl.$setValidity(validatorName, validity), validity ? value : undefined;
    }
    function textInputType(scope, element, attr, ctrl, $sniffer, $browser) {
        if (!$sniffer.android) {
            var composing = !1;
            element.on("compositionstart", function() {
                composing = !0;
            }), element.on("compositionend", function() {
                composing = !1;
            });
        }
        var listener = function() {
            if (!composing) {
                var value = element.val();
                toBoolean(attr.ngTrim || "T") && (value = trim(value)), ctrl.$viewValue !== value && (scope.$$phase ? ctrl.$setViewValue(value) : scope.$apply(function() {
                    ctrl.$setViewValue(value);
                }));
            }
        };
        if ($sniffer.hasEvent("input")) element.on("input", listener); else {
            var timeout, deferListener = function() {
                timeout || (timeout = $browser.defer(function() {
                    listener(), timeout = null;
                }));
            };
            element.on("keydown", function(event) {
                var key = event.keyCode;
                91 === key || key > 15 && 19 > key || key >= 37 && 40 >= key || deferListener();
            }), $sniffer.hasEvent("paste") && element.on("paste cut", deferListener);
        }
        element.on("change", listener), ctrl.$render = function() {
            element.val(ctrl.$isEmpty(ctrl.$viewValue) ? "" : ctrl.$viewValue);
        };
        var patternValidator, match, pattern = attr.ngPattern;
        if (pattern) {
            var validateRegex = function(regexp, value) {
                return validate(ctrl, "pattern", ctrl.$isEmpty(value) || regexp.test(value), value);
            };
            match = pattern.match(/^\/(.*)\/([gim]*)$/), match ? (pattern = new RegExp(match[1], match[2]), 
            patternValidator = function(value) {
                return validateRegex(pattern, value);
            }) : patternValidator = function(value) {
                var patternObj = scope.$eval(pattern);
                if (!patternObj || !patternObj.test) throw minErr("ngPattern")("noregexp", "Expected {0} to be a RegExp but was {1}. Element: {2}", pattern, patternObj, startingTag(element));
                return validateRegex(patternObj, value);
            }, ctrl.$formatters.push(patternValidator), ctrl.$parsers.push(patternValidator);
        }
        if (attr.ngMinlength) {
            var minlength = int(attr.ngMinlength), minLengthValidator = function(value) {
                return validate(ctrl, "minlength", ctrl.$isEmpty(value) || value.length >= minlength, value);
            };
            ctrl.$parsers.push(minLengthValidator), ctrl.$formatters.push(minLengthValidator);
        }
        if (attr.ngMaxlength) {
            var maxlength = int(attr.ngMaxlength), maxLengthValidator = function(value) {
                return validate(ctrl, "maxlength", ctrl.$isEmpty(value) || value.length <= maxlength, value);
            };
            ctrl.$parsers.push(maxLengthValidator), ctrl.$formatters.push(maxLengthValidator);
        }
    }
    function numberInputType(scope, element, attr, ctrl, $sniffer, $browser) {
        if (textInputType(scope, element, attr, ctrl, $sniffer, $browser), ctrl.$parsers.push(function(value) {
            var empty = ctrl.$isEmpty(value);
            return empty || NUMBER_REGEXP.test(value) ? (ctrl.$setValidity("number", !0), "" === value ? null : empty ? value : parseFloat(value)) : (ctrl.$setValidity("number", !1), 
            undefined);
        }), ctrl.$formatters.push(function(value) {
            return ctrl.$isEmpty(value) ? "" : "" + value;
        }), attr.min) {
            var minValidator = function(value) {
                var min = parseFloat(attr.min);
                return validate(ctrl, "min", ctrl.$isEmpty(value) || value >= min, value);
            };
            ctrl.$parsers.push(minValidator), ctrl.$formatters.push(minValidator);
        }
        if (attr.max) {
            var maxValidator = function(value) {
                var max = parseFloat(attr.max);
                return validate(ctrl, "max", ctrl.$isEmpty(value) || max >= value, value);
            };
            ctrl.$parsers.push(maxValidator), ctrl.$formatters.push(maxValidator);
        }
        ctrl.$formatters.push(function(value) {
            return validate(ctrl, "number", ctrl.$isEmpty(value) || isNumber(value), value);
        });
    }
    function urlInputType(scope, element, attr, ctrl, $sniffer, $browser) {
        textInputType(scope, element, attr, ctrl, $sniffer, $browser);
        var urlValidator = function(value) {
            return validate(ctrl, "url", ctrl.$isEmpty(value) || URL_REGEXP.test(value), value);
        };
        ctrl.$formatters.push(urlValidator), ctrl.$parsers.push(urlValidator);
    }
    function emailInputType(scope, element, attr, ctrl, $sniffer, $browser) {
        textInputType(scope, element, attr, ctrl, $sniffer, $browser);
        var emailValidator = function(value) {
            return validate(ctrl, "email", ctrl.$isEmpty(value) || EMAIL_REGEXP.test(value), value);
        };
        ctrl.$formatters.push(emailValidator), ctrl.$parsers.push(emailValidator);
    }
    function radioInputType(scope, element, attr, ctrl) {
        isUndefined(attr.name) && element.attr("name", nextUid()), element.on("click", function() {
            element[0].checked && scope.$apply(function() {
                ctrl.$setViewValue(attr.value);
            });
        }), ctrl.$render = function() {
            var value = attr.value;
            element[0].checked = value == ctrl.$viewValue;
        }, attr.$observe("value", ctrl.$render);
    }
    function checkboxInputType(scope, element, attr, ctrl) {
        var trueValue = attr.ngTrueValue, falseValue = attr.ngFalseValue;
        isString(trueValue) || (trueValue = !0), isString(falseValue) || (falseValue = !1), 
        element.on("click", function() {
            scope.$apply(function() {
                ctrl.$setViewValue(element[0].checked);
            });
        }), ctrl.$render = function() {
            element[0].checked = ctrl.$viewValue;
        }, ctrl.$isEmpty = function(value) {
            return value !== trueValue;
        }, ctrl.$formatters.push(function(value) {
            return value === trueValue;
        }), ctrl.$parsers.push(function(value) {
            return value ? trueValue : falseValue;
        });
    }
    function classDirective(name, selector) {
        return name = "ngClass" + name, function() {
            return {
                restrict: "AC",
                link: function(scope, element, attr) {
                    function ngClassWatchAction(newVal) {
                        if (selector === !0 || scope.$index % 2 === selector) {
                            var newClasses = flattenClasses(newVal || "");
                            oldVal ? equals(newVal, oldVal) || attr.$updateClass(newClasses, flattenClasses(oldVal)) : attr.$addClass(newClasses);
                        }
                        oldVal = copy(newVal);
                    }
                    function flattenClasses(classVal) {
                        if (isArray(classVal)) return classVal.join(" ");
                        if (isObject(classVal)) {
                            var classes = [];
                            return forEach(classVal, function(v, k) {
                                v && classes.push(k);
                            }), classes.join(" ");
                        }
                        return classVal;
                    }
                    var oldVal;
                    scope.$watch(attr[name], ngClassWatchAction, !0), attr.$observe("class", function() {
                        ngClassWatchAction(scope.$eval(attr[name]));
                    }), "ngClass" !== name && scope.$watch("$index", function($index, old$index) {
                        var mod = 1 & $index;
                        if (mod !== old$index & 1) {
                            var classes = flattenClasses(scope.$eval(attr[name]));
                            mod === selector ? attr.$addClass(classes) : attr.$removeClass(classes);
                        }
                    });
                }
            };
        };
    }
    var lowercase = function(string) {
        return isString(string) ? string.toLowerCase() : string;
    }, uppercase = function(string) {
        return isString(string) ? string.toUpperCase() : string;
    }, manualLowercase = function(s) {
        return isString(s) ? s.replace(/[A-Z]/g, function(ch) {
            return String.fromCharCode(32 | ch.charCodeAt(0));
        }) : s;
    }, manualUppercase = function(s) {
        return isString(s) ? s.replace(/[a-z]/g, function(ch) {
            return String.fromCharCode(-33 & ch.charCodeAt(0));
        }) : s;
    };
    "i" !== "I".toLowerCase() && (lowercase = manualLowercase, uppercase = manualUppercase);
    var msie, jqLite, jQuery, angularModule, nodeName_, slice = [].slice, push = [].push, toString = Object.prototype.toString, ngMinErr = minErr("ng"), angular = (window.angular, 
    window.angular || (window.angular = {})), uid = [ "0", "0", "0" ];
    msie = int((/msie (\d+)/.exec(lowercase(navigator.userAgent)) || [])[1]), isNaN(msie) && (msie = int((/trident\/.*; rv:(\d+)/.exec(lowercase(navigator.userAgent)) || [])[1])), 
    noop.$inject = [], identity.$inject = [];
    var trim = function() {
        return String.prototype.trim ? function(value) {
            return isString(value) ? value.trim() : value;
        } : function(value) {
            return isString(value) ? value.replace(/^\s\s*/, "").replace(/\s\s*$/, "") : value;
        };
    }();
    nodeName_ = 9 > msie ? function(element) {
        return element = element.nodeName ? element : element[0], element.scopeName && "HTML" != element.scopeName ? uppercase(element.scopeName + ":" + element.nodeName) : element.nodeName;
    } : function(element) {
        return element.nodeName ? element.nodeName : element[0].nodeName;
    };
    var SNAKE_CASE_REGEXP = /[A-Z]/g, version = {
        full: "1.2.9",
        major: 1,
        minor: 2,
        dot: 9,
        codeName: "enchanted-articulacy"
    }, jqCache = JQLite.cache = {}, jqName = JQLite.expando = "ng-" + new Date().getTime(), jqId = 1, addEventListenerFn = window.document.addEventListener ? function(element, type, fn) {
        element.addEventListener(type, fn, !1);
    } : function(element, type, fn) {
        element.attachEvent("on" + type, fn);
    }, removeEventListenerFn = window.document.removeEventListener ? function(element, type, fn) {
        element.removeEventListener(type, fn, !1);
    } : function(element, type, fn) {
        element.detachEvent("on" + type, fn);
    }, SPECIAL_CHARS_REGEXP = /([\:\-\_]+(.))/g, MOZ_HACK_REGEXP = /^moz([A-Z])/, jqLiteMinErr = minErr("jqLite"), JQLitePrototype = JQLite.prototype = {
        ready: function(fn) {
            function trigger() {
                fired || (fired = !0, fn());
            }
            var fired = !1;
            "complete" === document.readyState ? setTimeout(trigger) : (this.on("DOMContentLoaded", trigger), 
            JQLite(window).on("load", trigger));
        },
        toString: function() {
            var value = [];
            return forEach(this, function(e) {
                value.push("" + e);
            }), "[" + value.join(", ") + "]";
        },
        eq: function(index) {
            return jqLite(index >= 0 ? this[index] : this[this.length + index]);
        },
        length: 0,
        push: push,
        sort: [].sort,
        splice: [].splice
    }, BOOLEAN_ATTR = {};
    forEach("multiple,selected,checked,disabled,readOnly,required,open".split(","), function(value) {
        BOOLEAN_ATTR[lowercase(value)] = value;
    });
    var BOOLEAN_ELEMENTS = {};
    forEach("input,select,option,textarea,button,form,details".split(","), function(value) {
        BOOLEAN_ELEMENTS[uppercase(value)] = !0;
    }), forEach({
        data: jqLiteData,
        inheritedData: jqLiteInheritedData,
        scope: function(element) {
            return jqLite(element).data("$scope") || jqLiteInheritedData(element.parentNode || element, [ "$isolateScope", "$scope" ]);
        },
        isolateScope: function(element) {
            return jqLite(element).data("$isolateScope") || jqLite(element).data("$isolateScopeNoTemplate");
        },
        controller: jqLiteController,
        injector: function(element) {
            return jqLiteInheritedData(element, "$injector");
        },
        removeAttr: function(element, name) {
            element.removeAttribute(name);
        },
        hasClass: jqLiteHasClass,
        css: function(element, name, value) {
            if (name = camelCase(name), !isDefined(value)) {
                var val;
                return 8 >= msie && (val = element.currentStyle && element.currentStyle[name], "" === val && (val = "auto")), 
                val = val || element.style[name], 8 >= msie && (val = "" === val ? undefined : val), 
                val;
            }
            element.style[name] = value;
        },
        attr: function(element, name, value) {
            var lowercasedName = lowercase(name);
            if (BOOLEAN_ATTR[lowercasedName]) {
                if (!isDefined(value)) return element[name] || (element.attributes.getNamedItem(name) || noop).specified ? lowercasedName : undefined;
                value ? (element[name] = !0, element.setAttribute(name, lowercasedName)) : (element[name] = !1, 
                element.removeAttribute(lowercasedName));
            } else if (isDefined(value)) element.setAttribute(name, value); else if (element.getAttribute) {
                var ret = element.getAttribute(name, 2);
                return null === ret ? undefined : ret;
            }
        },
        prop: function(element, name, value) {
            return isDefined(value) ? void (element[name] = value) : element[name];
        },
        text: function() {
            function getText(element, value) {
                var textProp = NODE_TYPE_TEXT_PROPERTY[element.nodeType];
                return isUndefined(value) ? textProp ? element[textProp] : "" : void (element[textProp] = value);
            }
            var NODE_TYPE_TEXT_PROPERTY = [];
            return 9 > msie ? (NODE_TYPE_TEXT_PROPERTY[1] = "innerText", NODE_TYPE_TEXT_PROPERTY[3] = "nodeValue") : NODE_TYPE_TEXT_PROPERTY[1] = NODE_TYPE_TEXT_PROPERTY[3] = "textContent", 
            getText.$dv = "", getText;
        }(),
        val: function(element, value) {
            if (isUndefined(value)) {
                if ("SELECT" === nodeName_(element) && element.multiple) {
                    var result = [];
                    return forEach(element.options, function(option) {
                        option.selected && result.push(option.value || option.text);
                    }), 0 === result.length ? null : result;
                }
                return element.value;
            }
            element.value = value;
        },
        html: function(element, value) {
            if (isUndefined(value)) return element.innerHTML;
            for (var i = 0, childNodes = element.childNodes; i < childNodes.length; i++) jqLiteDealoc(childNodes[i]);
            element.innerHTML = value;
        },
        empty: jqLiteEmpty
    }, function(fn, name) {
        JQLite.prototype[name] = function(arg1, arg2) {
            var i, key;
            if (fn !== jqLiteEmpty && (2 == fn.length && fn !== jqLiteHasClass && fn !== jqLiteController ? arg1 : arg2) === undefined) {
                if (isObject(arg1)) {
                    for (i = 0; i < this.length; i++) if (fn === jqLiteData) fn(this[i], arg1); else for (key in arg1) fn(this[i], key, arg1[key]);
                    return this;
                }
                for (var value = fn.$dv, jj = value === undefined ? Math.min(this.length, 1) : this.length, j = 0; jj > j; j++) {
                    var nodeValue = fn(this[j], arg1, arg2);
                    value = value ? value + nodeValue : nodeValue;
                }
                return value;
            }
            for (i = 0; i < this.length; i++) fn(this[i], arg1, arg2);
            return this;
        };
    }), forEach({
        removeData: jqLiteRemoveData,
        dealoc: jqLiteDealoc,
        on: function onFn(element, type, fn, unsupported) {
            if (isDefined(unsupported)) throw jqLiteMinErr("onargs", "jqLite#on() does not support the `selector` or `eventData` parameters");
            var events = jqLiteExpandoStore(element, "events"), handle = jqLiteExpandoStore(element, "handle");
            events || jqLiteExpandoStore(element, "events", events = {}), handle || jqLiteExpandoStore(element, "handle", handle = createEventHandler(element, events)), 
            forEach(type.split(" "), function(type) {
                var eventFns = events[type];
                if (!eventFns) {
                    if ("mouseenter" == type || "mouseleave" == type) {
                        var contains = document.body.contains || document.body.compareDocumentPosition ? function(a, b) {
                            var adown = 9 === a.nodeType ? a.documentElement : a, bup = b && b.parentNode;
                            return a === bup || !(!bup || 1 !== bup.nodeType || !(adown.contains ? adown.contains(bup) : a.compareDocumentPosition && 16 & a.compareDocumentPosition(bup)));
                        } : function(a, b) {
                            if (b) for (;b = b.parentNode; ) if (b === a) return !0;
                            return !1;
                        };
                        events[type] = [];
                        var eventmap = {
                            mouseleave: "mouseout",
                            mouseenter: "mouseover"
                        };
                        onFn(element, eventmap[type], function(event) {
                            var target = this, related = event.relatedTarget;
                            (!related || related !== target && !contains(target, related)) && handle(event, type);
                        });
                    } else addEventListenerFn(element, type, handle), events[type] = [];
                    eventFns = events[type];
                }
                eventFns.push(fn);
            });
        },
        off: jqLiteOff,
        one: function(element, type, fn) {
            element = jqLite(element), element.on(type, function onFn() {
                element.off(type, fn), element.off(type, onFn);
            }), element.on(type, fn);
        },
        replaceWith: function(element, replaceNode) {
            var index, parent = element.parentNode;
            jqLiteDealoc(element), forEach(new JQLite(replaceNode), function(node) {
                index ? parent.insertBefore(node, index.nextSibling) : parent.replaceChild(node, element), 
                index = node;
            });
        },
        children: function(element) {
            var children = [];
            return forEach(element.childNodes, function(element) {
                1 === element.nodeType && children.push(element);
            }), children;
        },
        contents: function(element) {
            return element.childNodes || [];
        },
        append: function(element, node) {
            forEach(new JQLite(node), function(child) {
                (1 === element.nodeType || 11 === element.nodeType) && element.appendChild(child);
            });
        },
        prepend: function(element, node) {
            if (1 === element.nodeType) {
                var index = element.firstChild;
                forEach(new JQLite(node), function(child) {
                    element.insertBefore(child, index);
                });
            }
        },
        wrap: function(element, wrapNode) {
            wrapNode = jqLite(wrapNode)[0];
            var parent = element.parentNode;
            parent && parent.replaceChild(wrapNode, element), wrapNode.appendChild(element);
        },
        remove: function(element) {
            jqLiteDealoc(element);
            var parent = element.parentNode;
            parent && parent.removeChild(element);
        },
        after: function(element, newElement) {
            var index = element, parent = element.parentNode;
            forEach(new JQLite(newElement), function(node) {
                parent.insertBefore(node, index.nextSibling), index = node;
            });
        },
        addClass: jqLiteAddClass,
        removeClass: jqLiteRemoveClass,
        toggleClass: function(element, selector, condition) {
            isUndefined(condition) && (condition = !jqLiteHasClass(element, selector)), (condition ? jqLiteAddClass : jqLiteRemoveClass)(element, selector);
        },
        parent: function(element) {
            var parent = element.parentNode;
            return parent && 11 !== parent.nodeType ? parent : null;
        },
        next: function(element) {
            if (element.nextElementSibling) return element.nextElementSibling;
            for (var elm = element.nextSibling; null != elm && 1 !== elm.nodeType; ) elm = elm.nextSibling;
            return elm;
        },
        find: function(element, selector) {
            return element.getElementsByTagName ? element.getElementsByTagName(selector) : [];
        },
        clone: jqLiteClone,
        triggerHandler: function(element, eventName, eventData) {
            var eventFns = (jqLiteExpandoStore(element, "events") || {})[eventName];
            eventData = eventData || [];
            var event = [ {
                preventDefault: noop,
                stopPropagation: noop
            } ];
            forEach(eventFns, function(fn) {
                fn.apply(element, event.concat(eventData));
            });
        }
    }, function(fn, name) {
        JQLite.prototype[name] = function(arg1, arg2, arg3) {
            for (var value, i = 0; i < this.length; i++) isUndefined(value) ? (value = fn(this[i], arg1, arg2, arg3), 
            isDefined(value) && (value = jqLite(value))) : jqLiteAddNodes(value, fn(this[i], arg1, arg2, arg3));
            return isDefined(value) ? value : this;
        }, JQLite.prototype.bind = JQLite.prototype.on, JQLite.prototype.unbind = JQLite.prototype.off;
    }), HashMap.prototype = {
        put: function(key, value) {
            this[hashKey(key)] = value;
        },
        get: function(key) {
            return this[hashKey(key)];
        },
        remove: function(key) {
            var value = this[key = hashKey(key)];
            return delete this[key], value;
        }
    };
    var FN_ARGS = /^function\s*[^\(]*\(\s*([^\)]*)\)/m, FN_ARG_SPLIT = /,/, FN_ARG = /^\s*(_?)(\S+?)\1\s*$/, STRIP_COMMENTS = /((\/\/.*$)|(\/\*[\s\S]*?\*\/))/gm, $injectorMinErr = minErr("$injector"), $animateMinErr = minErr("$animate"), $AnimateProvider = [ "$provide", function($provide) {
        this.$$selectors = {}, this.register = function(name, factory) {
            var key = name + "-animation";
            if (name && "." != name.charAt(0)) throw $animateMinErr("notcsel", "Expecting class selector starting with '.' got '{0}'.", name);
            this.$$selectors[name.substr(1)] = key, $provide.factory(key, factory);
        }, this.classNameFilter = function(expression) {
            return 1 === arguments.length && (this.$$classNameFilter = expression instanceof RegExp ? expression : null), 
            this.$$classNameFilter;
        }, this.$get = [ "$timeout", function($timeout) {
            return {
                enter: function(element, parent, after, done) {
                    after ? after.after(element) : (parent && parent[0] || (parent = after.parent()), 
                    parent.append(element)), done && $timeout(done, 0, !1);
                },
                leave: function(element, done) {
                    element.remove(), done && $timeout(done, 0, !1);
                },
                move: function(element, parent, after, done) {
                    this.enter(element, parent, after, done);
                },
                addClass: function(element, className, done) {
                    className = isString(className) ? className : isArray(className) ? className.join(" ") : "", 
                    forEach(element, function(element) {
                        jqLiteAddClass(element, className);
                    }), done && $timeout(done, 0, !1);
                },
                removeClass: function(element, className, done) {
                    className = isString(className) ? className : isArray(className) ? className.join(" ") : "", 
                    forEach(element, function(element) {
                        jqLiteRemoveClass(element, className);
                    }), done && $timeout(done, 0, !1);
                },
                enabled: noop
            };
        } ];
    } ], $compileMinErr = minErr("$compile");
    $CompileProvider.$inject = [ "$provide", "$$sanitizeUriProvider" ];
    var PREFIX_REGEXP = /^(x[\:\-_]|data[\:\-_])/i, $interpolateMinErr = minErr("$interpolate"), PATH_MATCH = /^([^\?#]*)(\?([^#]*))?(#(.*))?$/, DEFAULT_PORTS = {
        http: 80,
        https: 443,
        ftp: 21
    }, $locationMinErr = minErr("$location");
    LocationHashbangInHtml5Url.prototype = LocationHashbangUrl.prototype = LocationHtml5Url.prototype = {
        $$html5: !1,
        $$replace: !1,
        absUrl: locationGetter("$$absUrl"),
        url: function(url, replace) {
            if (isUndefined(url)) return this.$$url;
            var match = PATH_MATCH.exec(url);
            return match[1] && this.path(decodeURIComponent(match[1])), (match[2] || match[1]) && this.search(match[3] || ""), 
            this.hash(match[5] || "", replace), this;
        },
        protocol: locationGetter("$$protocol"),
        host: locationGetter("$$host"),
        port: locationGetter("$$port"),
        path: locationGetterSetter("$$path", function(path) {
            return "/" == path.charAt(0) ? path : "/" + path;
        }),
        search: function(search, paramValue) {
            switch (arguments.length) {
              case 0:
                return this.$$search;

              case 1:
                if (isString(search)) this.$$search = parseKeyValue(search); else {
                    if (!isObject(search)) throw $locationMinErr("isrcharg", "The first argument of the `$location#search()` call must be a string or an object.");
                    this.$$search = search;
                }
                break;

              default:
                isUndefined(paramValue) || null === paramValue ? delete this.$$search[search] : this.$$search[search] = paramValue;
            }
            return this.$$compose(), this;
        },
        hash: locationGetterSetter("$$hash", identity),
        replace: function() {
            return this.$$replace = !0, this;
        }
    };
    var promiseWarning, $parseMinErr = minErr("$parse"), promiseWarningCache = {}, OPERATORS = {
        "null": function() {
            return null;
        },
        "true": function() {
            return !0;
        },
        "false": function() {
            return !1;
        },
        undefined: noop,
        "+": function(self, locals, a, b) {
            return a = a(self, locals), b = b(self, locals), isDefined(a) ? isDefined(b) ? a + b : a : isDefined(b) ? b : undefined;
        },
        "-": function(self, locals, a, b) {
            return a = a(self, locals), b = b(self, locals), (isDefined(a) ? a : 0) - (isDefined(b) ? b : 0);
        },
        "*": function(self, locals, a, b) {
            return a(self, locals) * b(self, locals);
        },
        "/": function(self, locals, a, b) {
            return a(self, locals) / b(self, locals);
        },
        "%": function(self, locals, a, b) {
            return a(self, locals) % b(self, locals);
        },
        "^": function(self, locals, a, b) {
            return a(self, locals) ^ b(self, locals);
        },
        "=": noop,
        "===": function(self, locals, a, b) {
            return a(self, locals) === b(self, locals);
        },
        "!==": function(self, locals, a, b) {
            return a(self, locals) !== b(self, locals);
        },
        "==": function(self, locals, a, b) {
            return a(self, locals) == b(self, locals);
        },
        "!=": function(self, locals, a, b) {
            return a(self, locals) != b(self, locals);
        },
        "<": function(self, locals, a, b) {
            return a(self, locals) < b(self, locals);
        },
        ">": function(self, locals, a, b) {
            return a(self, locals) > b(self, locals);
        },
        "<=": function(self, locals, a, b) {
            return a(self, locals) <= b(self, locals);
        },
        ">=": function(self, locals, a, b) {
            return a(self, locals) >= b(self, locals);
        },
        "&&": function(self, locals, a, b) {
            return a(self, locals) && b(self, locals);
        },
        "||": function(self, locals, a, b) {
            return a(self, locals) || b(self, locals);
        },
        "&": function(self, locals, a, b) {
            return a(self, locals) & b(self, locals);
        },
        "|": function(self, locals, a, b) {
            return b(self, locals)(self, locals, a(self, locals));
        },
        "!": function(self, locals, a) {
            return !a(self, locals);
        }
    }, ESCAPE = {
        n: "\n",
        f: "\f",
        r: "\r",
        t: "	",
        v: "",
        "'": "'",
        '"': '"'
    }, Lexer = function(options) {
        this.options = options;
    };
    Lexer.prototype = {
        constructor: Lexer,
        lex: function(text) {
            this.text = text, this.index = 0, this.ch = undefined, this.lastCh = ":", this.tokens = [];
            for (var token, json = []; this.index < this.text.length; ) {
                if (this.ch = this.text.charAt(this.index), this.is("\"'")) this.readString(this.ch); else if (this.isNumber(this.ch) || this.is(".") && this.isNumber(this.peek())) this.readNumber(); else if (this.isIdent(this.ch)) this.readIdent(), 
                this.was("{,") && "{" === json[0] && (token = this.tokens[this.tokens.length - 1]) && (token.json = -1 === token.text.indexOf(".")); else if (this.is("(){}[].,;:?")) this.tokens.push({
                    index: this.index,
                    text: this.ch,
                    json: this.was(":[,") && this.is("{[") || this.is("}]:,")
                }), this.is("{[") && json.unshift(this.ch), this.is("}]") && json.shift(), this.index++; else {
                    if (this.isWhitespace(this.ch)) {
                        this.index++;
                        continue;
                    }
                    var ch2 = this.ch + this.peek(), ch3 = ch2 + this.peek(2), fn = OPERATORS[this.ch], fn2 = OPERATORS[ch2], fn3 = OPERATORS[ch3];
                    fn3 ? (this.tokens.push({
                        index: this.index,
                        text: ch3,
                        fn: fn3
                    }), this.index += 3) : fn2 ? (this.tokens.push({
                        index: this.index,
                        text: ch2,
                        fn: fn2
                    }), this.index += 2) : fn ? (this.tokens.push({
                        index: this.index,
                        text: this.ch,
                        fn: fn,
                        json: this.was("[,:") && this.is("+-")
                    }), this.index += 1) : this.throwError("Unexpected next character ", this.index, this.index + 1);
                }
                this.lastCh = this.ch;
            }
            return this.tokens;
        },
        is: function(chars) {
            return -1 !== chars.indexOf(this.ch);
        },
        was: function(chars) {
            return -1 !== chars.indexOf(this.lastCh);
        },
        peek: function(i) {
            var num = i || 1;
            return this.index + num < this.text.length ? this.text.charAt(this.index + num) : !1;
        },
        isNumber: function(ch) {
            return ch >= "0" && "9" >= ch;
        },
        isWhitespace: function(ch) {
            return " " === ch || "\r" === ch || "	" === ch || "\n" === ch || "" === ch || " " === ch;
        },
        isIdent: function(ch) {
            return ch >= "a" && "z" >= ch || ch >= "A" && "Z" >= ch || "_" === ch || "$" === ch;
        },
        isExpOperator: function(ch) {
            return "-" === ch || "+" === ch || this.isNumber(ch);
        },
        throwError: function(error, start, end) {
            end = end || this.index;
            var colStr = isDefined(start) ? "s " + start + "-" + this.index + " [" + this.text.substring(start, end) + "]" : " " + end;
            throw $parseMinErr("lexerr", "Lexer Error: {0} at column{1} in expression [{2}].", error, colStr, this.text);
        },
        readNumber: function() {
            for (var number = "", start = this.index; this.index < this.text.length; ) {
                var ch = lowercase(this.text.charAt(this.index));
                if ("." == ch || this.isNumber(ch)) number += ch; else {
                    var peekCh = this.peek();
                    if ("e" == ch && this.isExpOperator(peekCh)) number += ch; else if (this.isExpOperator(ch) && peekCh && this.isNumber(peekCh) && "e" == number.charAt(number.length - 1)) number += ch; else {
                        if (!this.isExpOperator(ch) || peekCh && this.isNumber(peekCh) || "e" != number.charAt(number.length - 1)) break;
                        this.throwError("Invalid exponent");
                    }
                }
                this.index++;
            }
            number = 1 * number, this.tokens.push({
                index: start,
                text: number,
                json: !0,
                fn: function() {
                    return number;
                }
            });
        },
        readIdent: function() {
            for (var lastDot, peekIndex, methodName, ch, parser = this, ident = "", start = this.index; this.index < this.text.length && (ch = this.text.charAt(this.index), 
            "." === ch || this.isIdent(ch) || this.isNumber(ch)); ) "." === ch && (lastDot = this.index), 
            ident += ch, this.index++;
            if (lastDot) for (peekIndex = this.index; peekIndex < this.text.length; ) {
                if (ch = this.text.charAt(peekIndex), "(" === ch) {
                    methodName = ident.substr(lastDot - start + 1), ident = ident.substr(0, lastDot - start), 
                    this.index = peekIndex;
                    break;
                }
                if (!this.isWhitespace(ch)) break;
                peekIndex++;
            }
            var token = {
                index: start,
                text: ident
            };
            if (OPERATORS.hasOwnProperty(ident)) token.fn = OPERATORS[ident], token.json = OPERATORS[ident]; else {
                var getter = getterFn(ident, this.options, this.text);
                token.fn = extend(function(self, locals) {
                    return getter(self, locals);
                }, {
                    assign: function(self, value) {
                        return setter(self, ident, value, parser.text, parser.options);
                    }
                });
            }
            this.tokens.push(token), methodName && (this.tokens.push({
                index: lastDot,
                text: ".",
                json: !1
            }), this.tokens.push({
                index: lastDot + 1,
                text: methodName,
                json: !1
            }));
        },
        readString: function(quote) {
            var start = this.index;
            this.index++;
            for (var string = "", rawString = quote, escape = !1; this.index < this.text.length; ) {
                var ch = this.text.charAt(this.index);
                if (rawString += ch, escape) {
                    if ("u" === ch) {
                        var hex = this.text.substring(this.index + 1, this.index + 5);
                        hex.match(/[\da-f]{4}/i) || this.throwError("Invalid unicode escape [\\u" + hex + "]"), 
                        this.index += 4, string += String.fromCharCode(parseInt(hex, 16));
                    } else {
                        var rep = ESCAPE[ch];
                        string += rep ? rep : ch;
                    }
                    escape = !1;
                } else if ("\\" === ch) escape = !0; else {
                    if (ch === quote) return this.index++, void this.tokens.push({
                        index: start,
                        text: rawString,
                        string: string,
                        json: !0,
                        fn: function() {
                            return string;
                        }
                    });
                    string += ch;
                }
                this.index++;
            }
            this.throwError("Unterminated quote", start);
        }
    };
    var Parser = function(lexer, $filter, options) {
        this.lexer = lexer, this.$filter = $filter, this.options = options;
    };
    Parser.ZERO = function() {
        return 0;
    }, Parser.prototype = {
        constructor: Parser,
        parse: function(text, json) {
            this.text = text, this.json = json, this.tokens = this.lexer.lex(text), json && (this.assignment = this.logicalOR, 
            this.functionCall = this.fieldAccess = this.objectIndex = this.filterChain = function() {
                this.throwError("is not valid json", {
                    text: text,
                    index: 0
                });
            });
            var value = json ? this.primary() : this.statements();
            return 0 !== this.tokens.length && this.throwError("is an unexpected token", this.tokens[0]), 
            value.literal = !!value.literal, value.constant = !!value.constant, value;
        },
        primary: function() {
            var primary;
            if (this.expect("(")) primary = this.filterChain(), this.consume(")"); else if (this.expect("[")) primary = this.arrayDeclaration(); else if (this.expect("{")) primary = this.object(); else {
                var token = this.expect();
                primary = token.fn, primary || this.throwError("not a primary expression", token), 
                token.json && (primary.constant = !0, primary.literal = !0);
            }
            for (var next, context; next = this.expect("(", "[", "."); ) "(" === next.text ? (primary = this.functionCall(primary, context), 
            context = null) : "[" === next.text ? (context = primary, primary = this.objectIndex(primary)) : "." === next.text ? (context = primary, 
            primary = this.fieldAccess(primary)) : this.throwError("IMPOSSIBLE");
            return primary;
        },
        throwError: function(msg, token) {
            throw $parseMinErr("syntax", "Syntax Error: Token '{0}' {1} at column {2} of the expression [{3}] starting at [{4}].", token.text, msg, token.index + 1, this.text, this.text.substring(token.index));
        },
        peekToken: function() {
            if (0 === this.tokens.length) throw $parseMinErr("ueoe", "Unexpected end of expression: {0}", this.text);
            return this.tokens[0];
        },
        peek: function(e1, e2, e3, e4) {
            if (this.tokens.length > 0) {
                var token = this.tokens[0], t = token.text;
                if (t === e1 || t === e2 || t === e3 || t === e4 || !e1 && !e2 && !e3 && !e4) return token;
            }
            return !1;
        },
        expect: function(e1, e2, e3, e4) {
            var token = this.peek(e1, e2, e3, e4);
            return token ? (this.json && !token.json && this.throwError("is not valid json", token), 
            this.tokens.shift(), token) : !1;
        },
        consume: function(e1) {
            this.expect(e1) || this.throwError("is unexpected, expecting [" + e1 + "]", this.peek());
        },
        unaryFn: function(fn, right) {
            return extend(function(self, locals) {
                return fn(self, locals, right);
            }, {
                constant: right.constant
            });
        },
        ternaryFn: function(left, middle, right) {
            return extend(function(self, locals) {
                return left(self, locals) ? middle(self, locals) : right(self, locals);
            }, {
                constant: left.constant && middle.constant && right.constant
            });
        },
        binaryFn: function(left, fn, right) {
            return extend(function(self, locals) {
                return fn(self, locals, left, right);
            }, {
                constant: left.constant && right.constant
            });
        },
        statements: function() {
            for (var statements = []; ;) if (this.tokens.length > 0 && !this.peek("}", ")", ";", "]") && statements.push(this.filterChain()), 
            !this.expect(";")) return 1 === statements.length ? statements[0] : function(self, locals) {
                for (var value, i = 0; i < statements.length; i++) {
                    var statement = statements[i];
                    statement && (value = statement(self, locals));
                }
                return value;
            };
        },
        filterChain: function() {
            for (var token, left = this.expression(); ;) {
                if (!(token = this.expect("|"))) return left;
                left = this.binaryFn(left, token.fn, this.filter());
            }
        },
        filter: function() {
            for (var token = this.expect(), fn = this.$filter(token.text), argsFn = []; ;) {
                if (!(token = this.expect(":"))) {
                    var fnInvoke = function(self, locals, input) {
                        for (var args = [ input ], i = 0; i < argsFn.length; i++) args.push(argsFn[i](self, locals));
                        return fn.apply(self, args);
                    };
                    return function() {
                        return fnInvoke;
                    };
                }
                argsFn.push(this.expression());
            }
        },
        expression: function() {
            return this.assignment();
        },
        assignment: function() {
            var right, token, left = this.ternary();
            return (token = this.expect("=")) ? (left.assign || this.throwError("implies assignment but [" + this.text.substring(0, token.index) + "] can not be assigned to", token), 
            right = this.ternary(), function(scope, locals) {
                return left.assign(scope, right(scope, locals), locals);
            }) : left;
        },
        ternary: function() {
            var middle, token, left = this.logicalOR();
            return (token = this.expect("?")) ? (middle = this.ternary(), (token = this.expect(":")) ? this.ternaryFn(left, middle, this.ternary()) : void this.throwError("expected :", token)) : left;
        },
        logicalOR: function() {
            for (var token, left = this.logicalAND(); ;) {
                if (!(token = this.expect("||"))) return left;
                left = this.binaryFn(left, token.fn, this.logicalAND());
            }
        },
        logicalAND: function() {
            var token, left = this.equality();
            return (token = this.expect("&&")) && (left = this.binaryFn(left, token.fn, this.logicalAND())), 
            left;
        },
        equality: function() {
            var token, left = this.relational();
            return (token = this.expect("==", "!=", "===", "!==")) && (left = this.binaryFn(left, token.fn, this.equality())), 
            left;
        },
        relational: function() {
            var token, left = this.additive();
            return (token = this.expect("<", ">", "<=", ">=")) && (left = this.binaryFn(left, token.fn, this.relational())), 
            left;
        },
        additive: function() {
            for (var token, left = this.multiplicative(); token = this.expect("+", "-"); ) left = this.binaryFn(left, token.fn, this.multiplicative());
            return left;
        },
        multiplicative: function() {
            for (var token, left = this.unary(); token = this.expect("*", "/", "%"); ) left = this.binaryFn(left, token.fn, this.unary());
            return left;
        },
        unary: function() {
            var token;
            return this.expect("+") ? this.primary() : (token = this.expect("-")) ? this.binaryFn(Parser.ZERO, token.fn, this.unary()) : (token = this.expect("!")) ? this.unaryFn(token.fn, this.unary()) : this.primary();
        },
        fieldAccess: function(object) {
            var parser = this, field = this.expect().text, getter = getterFn(field, this.options, this.text);
            return extend(function(scope, locals, self) {
                return getter(self || object(scope, locals), locals);
            }, {
                assign: function(scope, value, locals) {
                    return setter(object(scope, locals), field, value, parser.text, parser.options);
                }
            });
        },
        objectIndex: function(obj) {
            var parser = this, indexFn = this.expression();
            return this.consume("]"), extend(function(self, locals) {
                var v, p, o = obj(self, locals), i = indexFn(self, locals);
                return o ? (v = ensureSafeObject(o[i], parser.text), v && v.then && parser.options.unwrapPromises && (p = v, 
                "$$v" in v || (p.$$v = undefined, p.then(function(val) {
                    p.$$v = val;
                })), v = v.$$v), v) : undefined;
            }, {
                assign: function(self, value, locals) {
                    var key = indexFn(self, locals), safe = ensureSafeObject(obj(self, locals), parser.text);
                    return safe[key] = value;
                }
            });
        },
        functionCall: function(fn, contextGetter) {
            var argsFn = [];
            if (")" !== this.peekToken().text) do argsFn.push(this.expression()); while (this.expect(","));
            this.consume(")");
            var parser = this;
            return function(scope, locals) {
                for (var args = [], context = contextGetter ? contextGetter(scope, locals) : scope, i = 0; i < argsFn.length; i++) args.push(argsFn[i](scope, locals));
                var fnPtr = fn(scope, locals, context) || noop;
                ensureSafeObject(context, parser.text), ensureSafeObject(fnPtr, parser.text);
                var v = fnPtr.apply ? fnPtr.apply(context, args) : fnPtr(args[0], args[1], args[2], args[3], args[4]);
                return ensureSafeObject(v, parser.text);
            };
        },
        arrayDeclaration: function() {
            var elementFns = [], allConstant = !0;
            if ("]" !== this.peekToken().text) do {
                var elementFn = this.expression();
                elementFns.push(elementFn), elementFn.constant || (allConstant = !1);
            } while (this.expect(","));
            return this.consume("]"), extend(function(self, locals) {
                for (var array = [], i = 0; i < elementFns.length; i++) array.push(elementFns[i](self, locals));
                return array;
            }, {
                literal: !0,
                constant: allConstant
            });
        },
        object: function() {
            var keyValues = [], allConstant = !0;
            if ("}" !== this.peekToken().text) do {
                var token = this.expect(), key = token.string || token.text;
                this.consume(":");
                var value = this.expression();
                keyValues.push({
                    key: key,
                    value: value
                }), value.constant || (allConstant = !1);
            } while (this.expect(","));
            return this.consume("}"), extend(function(self, locals) {
                for (var object = {}, i = 0; i < keyValues.length; i++) {
                    var keyValue = keyValues[i];
                    object[keyValue.key] = keyValue.value(self, locals);
                }
                return object;
            }, {
                literal: !0,
                constant: allConstant
            });
        }
    };
    var getterFnCache = {}, $sceMinErr = minErr("$sce"), SCE_CONTEXTS = {
        HTML: "html",
        CSS: "css",
        URL: "url",
        RESOURCE_URL: "resourceUrl",
        JS: "js"
    }, urlParsingNode = document.createElement("a"), originUrl = urlResolve(window.location.href, !0);
    $FilterProvider.$inject = [ "$provide" ], currencyFilter.$inject = [ "$locale" ], 
    numberFilter.$inject = [ "$locale" ];
    var DECIMAL_SEP = ".", DATE_FORMATS = {
        yyyy: dateGetter("FullYear", 4),
        yy: dateGetter("FullYear", 2, 0, !0),
        y: dateGetter("FullYear", 1),
        MMMM: dateStrGetter("Month"),
        MMM: dateStrGetter("Month", !0),
        MM: dateGetter("Month", 2, 1),
        M: dateGetter("Month", 1, 1),
        dd: dateGetter("Date", 2),
        d: dateGetter("Date", 1),
        HH: dateGetter("Hours", 2),
        H: dateGetter("Hours", 1),
        hh: dateGetter("Hours", 2, -12),
        h: dateGetter("Hours", 1, -12),
        mm: dateGetter("Minutes", 2),
        m: dateGetter("Minutes", 1),
        ss: dateGetter("Seconds", 2),
        s: dateGetter("Seconds", 1),
        sss: dateGetter("Milliseconds", 3),
        EEEE: dateStrGetter("Day"),
        EEE: dateStrGetter("Day", !0),
        a: ampmGetter,
        Z: timeZoneGetter
    }, DATE_FORMATS_SPLIT = /((?:[^yMdHhmsaZE']+)|(?:'(?:[^']|'')*')|(?:E+|y+|M+|d+|H+|h+|m+|s+|a|Z))(.*)/, NUMBER_STRING = /^\-?\d+$/;
    dateFilter.$inject = [ "$locale" ];
    var lowercaseFilter = valueFn(lowercase), uppercaseFilter = valueFn(uppercase);
    orderByFilter.$inject = [ "$parse" ];
    var htmlAnchorDirective = valueFn({
        restrict: "E",
        compile: function(element, attr) {
            return 8 >= msie && (attr.href || attr.name || attr.$set("href", ""), element.append(document.createComment("IE fix"))), 
            attr.href || attr.name ? void 0 : function(scope, element) {
                element.on("click", function(event) {
                    element.attr("href") || event.preventDefault();
                });
            };
        }
    }), ngAttributeAliasDirectives = {};
    forEach(BOOLEAN_ATTR, function(propName, attrName) {
        if ("multiple" != propName) {
            var normalized = directiveNormalize("ng-" + attrName);
            ngAttributeAliasDirectives[normalized] = function() {
                return {
                    priority: 100,
                    link: function(scope, element, attr) {
                        scope.$watch(attr[normalized], function(value) {
                            attr.$set(attrName, !!value);
                        });
                    }
                };
            };
        }
    }), forEach([ "src", "srcset", "href" ], function(attrName) {
        var normalized = directiveNormalize("ng-" + attrName);
        ngAttributeAliasDirectives[normalized] = function() {
            return {
                priority: 99,
                link: function(scope, element, attr) {
                    attr.$observe(normalized, function(value) {
                        value && (attr.$set(attrName, value), msie && element.prop(attrName, attr[attrName]));
                    });
                }
            };
        };
    });
    var nullFormCtrl = {
        $addControl: noop,
        $removeControl: noop,
        $setValidity: noop,
        $setDirty: noop,
        $setPristine: noop
    };
    FormController.$inject = [ "$element", "$attrs", "$scope" ];
    var formDirectiveFactory = function(isNgForm) {
        return [ "$timeout", function($timeout) {
            var formDirective = {
                name: "form",
                restrict: isNgForm ? "EAC" : "E",
                controller: FormController,
                compile: function() {
                    return {
                        pre: function(scope, formElement, attr, controller) {
                            if (!attr.action) {
                                var preventDefaultListener = function(event) {
                                    event.preventDefault ? event.preventDefault() : event.returnValue = !1;
                                };
                                addEventListenerFn(formElement[0], "submit", preventDefaultListener), formElement.on("$destroy", function() {
                                    $timeout(function() {
                                        removeEventListenerFn(formElement[0], "submit", preventDefaultListener);
                                    }, 0, !1);
                                });
                            }
                            var parentFormCtrl = formElement.parent().controller("form"), alias = attr.name || attr.ngForm;
                            alias && setter(scope, alias, controller, alias), parentFormCtrl && formElement.on("$destroy", function() {
                                parentFormCtrl.$removeControl(controller), alias && setter(scope, alias, undefined, alias), 
                                extend(controller, nullFormCtrl);
                            });
                        }
                    };
                }
            };
            return formDirective;
        } ];
    }, formDirective = formDirectiveFactory(), ngFormDirective = formDirectiveFactory(!0), URL_REGEXP = /^(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?$/, EMAIL_REGEXP = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$/, NUMBER_REGEXP = /^\s*(\-|\+)?(\d+|(\d*(\.\d*)))\s*$/, inputType = {
        text: textInputType,
        number: numberInputType,
        url: urlInputType,
        email: emailInputType,
        radio: radioInputType,
        checkbox: checkboxInputType,
        hidden: noop,
        button: noop,
        submit: noop,
        reset: noop
    }, inputDirective = [ "$browser", "$sniffer", function($browser, $sniffer) {
        return {
            restrict: "E",
            require: "?ngModel",
            link: function(scope, element, attr, ctrl) {
                ctrl && (inputType[lowercase(attr.type)] || inputType.text)(scope, element, attr, ctrl, $sniffer, $browser);
            }
        };
    } ], VALID_CLASS = "ng-valid", INVALID_CLASS = "ng-invalid", PRISTINE_CLASS = "ng-pristine", DIRTY_CLASS = "ng-dirty", NgModelController = [ "$scope", "$exceptionHandler", "$attrs", "$element", "$parse", function($scope, $exceptionHandler, $attr, $element, $parse) {
        function toggleValidCss(isValid, validationErrorKey) {
            validationErrorKey = validationErrorKey ? "-" + snake_case(validationErrorKey, "-") : "", 
            $element.removeClass((isValid ? INVALID_CLASS : VALID_CLASS) + validationErrorKey).addClass((isValid ? VALID_CLASS : INVALID_CLASS) + validationErrorKey);
        }
        this.$viewValue = Number.NaN, this.$modelValue = Number.NaN, this.$parsers = [], 
        this.$formatters = [], this.$viewChangeListeners = [], this.$pristine = !0, this.$dirty = !1, 
        this.$valid = !0, this.$invalid = !1, this.$name = $attr.name;
        var ngModelGet = $parse($attr.ngModel), ngModelSet = ngModelGet.assign;
        if (!ngModelSet) throw minErr("ngModel")("nonassign", "Expression '{0}' is non-assignable. Element: {1}", $attr.ngModel, startingTag($element));
        this.$render = noop, this.$isEmpty = function(value) {
            return isUndefined(value) || "" === value || null === value || value !== value;
        };
        var parentForm = $element.inheritedData("$formController") || nullFormCtrl, invalidCount = 0, $error = this.$error = {};
        $element.addClass(PRISTINE_CLASS), toggleValidCss(!0), this.$setValidity = function(validationErrorKey, isValid) {
            $error[validationErrorKey] !== !isValid && (isValid ? ($error[validationErrorKey] && invalidCount--, 
            invalidCount || (toggleValidCss(!0), this.$valid = !0, this.$invalid = !1)) : (toggleValidCss(!1), 
            this.$invalid = !0, this.$valid = !1, invalidCount++), $error[validationErrorKey] = !isValid, 
            toggleValidCss(isValid, validationErrorKey), parentForm.$setValidity(validationErrorKey, isValid, this));
        }, this.$setPristine = function() {
            this.$dirty = !1, this.$pristine = !0, $element.removeClass(DIRTY_CLASS).addClass(PRISTINE_CLASS);
        }, this.$setViewValue = function(value) {
            this.$viewValue = value, this.$pristine && (this.$dirty = !0, this.$pristine = !1, 
            $element.removeClass(PRISTINE_CLASS).addClass(DIRTY_CLASS), parentForm.$setDirty()), 
            forEach(this.$parsers, function(fn) {
                value = fn(value);
            }), this.$modelValue !== value && (this.$modelValue = value, ngModelSet($scope, value), 
            forEach(this.$viewChangeListeners, function(listener) {
                try {
                    listener();
                } catch (e) {
                    $exceptionHandler(e);
                }
            }));
        };
        var ctrl = this;
        $scope.$watch(function() {
            var value = ngModelGet($scope);
            if (ctrl.$modelValue !== value) {
                var formatters = ctrl.$formatters, idx = formatters.length;
                for (ctrl.$modelValue = value; idx--; ) value = formatters[idx](value);
                ctrl.$viewValue !== value && (ctrl.$viewValue = value, ctrl.$render());
            }
            return value;
        });
    } ], ngModelDirective = function() {
        return {
            require: [ "ngModel", "^?form" ],
            controller: NgModelController,
            link: function(scope, element, attr, ctrls) {
                var modelCtrl = ctrls[0], formCtrl = ctrls[1] || nullFormCtrl;
                formCtrl.$addControl(modelCtrl), scope.$on("$destroy", function() {
                    formCtrl.$removeControl(modelCtrl);
                });
            }
        };
    }, ngChangeDirective = valueFn({
        require: "ngModel",
        link: function(scope, element, attr, ctrl) {
            ctrl.$viewChangeListeners.push(function() {
                scope.$eval(attr.ngChange);
            });
        }
    }), requiredDirective = function() {
        return {
            require: "?ngModel",
            link: function(scope, elm, attr, ctrl) {
                if (ctrl) {
                    attr.required = !0;
                    var validator = function(value) {
                        return attr.required && ctrl.$isEmpty(value) ? void ctrl.$setValidity("required", !1) : (ctrl.$setValidity("required", !0), 
                        value);
                    };
                    ctrl.$formatters.push(validator), ctrl.$parsers.unshift(validator), attr.$observe("required", function() {
                        validator(ctrl.$viewValue);
                    });
                }
            }
        };
    }, ngListDirective = function() {
        return {
            require: "ngModel",
            link: function(scope, element, attr, ctrl) {
                var match = /\/(.*)\//.exec(attr.ngList), separator = match && new RegExp(match[1]) || attr.ngList || ",", parse = function(viewValue) {
                    if (!isUndefined(viewValue)) {
                        var list = [];
                        return viewValue && forEach(viewValue.split(separator), function(value) {
                            value && list.push(trim(value));
                        }), list;
                    }
                };
                ctrl.$parsers.push(parse), ctrl.$formatters.push(function(value) {
                    return isArray(value) ? value.join(", ") : undefined;
                }), ctrl.$isEmpty = function(value) {
                    return !value || !value.length;
                };
            }
        };
    }, CONSTANT_VALUE_REGEXP = /^(true|false|\d+)$/, ngValueDirective = function() {
        return {
            priority: 100,
            compile: function(tpl, tplAttr) {
                return CONSTANT_VALUE_REGEXP.test(tplAttr.ngValue) ? function(scope, elm, attr) {
                    attr.$set("value", scope.$eval(attr.ngValue));
                } : function(scope, elm, attr) {
                    scope.$watch(attr.ngValue, function(value) {
                        attr.$set("value", value);
                    });
                };
            }
        };
    }, ngBindDirective = ngDirective(function(scope, element, attr) {
        element.addClass("ng-binding").data("$binding", attr.ngBind), scope.$watch(attr.ngBind, function(value) {
            element.text(value == undefined ? "" : value);
        });
    }), ngBindTemplateDirective = [ "$interpolate", function($interpolate) {
        return function(scope, element, attr) {
            var interpolateFn = $interpolate(element.attr(attr.$attr.ngBindTemplate));
            element.addClass("ng-binding").data("$binding", interpolateFn), attr.$observe("ngBindTemplate", function(value) {
                element.text(value);
            });
        };
    } ], ngBindHtmlDirective = [ "$sce", "$parse", function($sce, $parse) {
        return function(scope, element, attr) {
            function getStringValue() {
                return (parsed(scope) || "").toString();
            }
            element.addClass("ng-binding").data("$binding", attr.ngBindHtml);
            var parsed = $parse(attr.ngBindHtml);
            scope.$watch(getStringValue, function() {
                element.html($sce.getTrustedHtml(parsed(scope)) || "");
            });
        };
    } ], ngClassDirective = classDirective("", !0), ngClassOddDirective = classDirective("Odd", 0), ngClassEvenDirective = classDirective("Even", 1), ngCloakDirective = ngDirective({
        compile: function(element, attr) {
            attr.$set("ngCloak", undefined), element.removeClass("ng-cloak");
        }
    }), ngControllerDirective = [ function() {
        return {
            scope: !0,
            controller: "@",
            priority: 500
        };
    } ], ngEventDirectives = {};
    forEach("click dblclick mousedown mouseup mouseover mouseout mousemove mouseenter mouseleave keydown keyup keypress submit focus blur copy cut paste".split(" "), function(name) {
        var directiveName = directiveNormalize("ng-" + name);
        ngEventDirectives[directiveName] = [ "$parse", function($parse) {
            return {
                compile: function($element, attr) {
                    var fn = $parse(attr[directiveName]);
                    return function(scope, element) {
                        element.on(lowercase(name), function(event) {
                            scope.$apply(function() {
                                fn(scope, {
                                    $event: event
                                });
                            });
                        });
                    };
                }
            };
        } ];
    });
    var ngIfDirective = [ "$animate", function($animate) {
        return {
            transclude: "element",
            priority: 600,
            terminal: !0,
            restrict: "A",
            $$tlb: !0,
            link: function($scope, $element, $attr, ctrl, $transclude) {
                var block, childScope;
                $scope.$watch($attr.ngIf, function(value) {
                    toBoolean(value) ? childScope || (childScope = $scope.$new(), $transclude(childScope, function(clone) {
                        clone[clone.length++] = document.createComment(" end ngIf: " + $attr.ngIf + " "), 
                        block = {
                            clone: clone
                        }, $animate.enter(clone, $element.parent(), $element);
                    })) : (childScope && (childScope.$destroy(), childScope = null), block && ($animate.leave(getBlockElements(block.clone)), 
                    block = null));
                });
            }
        };
    } ], ngIncludeDirective = [ "$http", "$templateCache", "$anchorScroll", "$animate", "$sce", function($http, $templateCache, $anchorScroll, $animate, $sce) {
        return {
            restrict: "ECA",
            priority: 400,
            terminal: !0,
            transclude: "element",
            controller: angular.noop,
            compile: function(element, attr) {
                var srcExp = attr.ngInclude || attr.src, onloadExp = attr.onload || "", autoScrollExp = attr.autoscroll;
                return function(scope, $element, $attr, ctrl, $transclude) {
                    var currentScope, currentElement, changeCounter = 0, cleanupLastIncludeContent = function() {
                        currentScope && (currentScope.$destroy(), currentScope = null), currentElement && ($animate.leave(currentElement), 
                        currentElement = null);
                    };
                    scope.$watch($sce.parseAsResourceUrl(srcExp), function(src) {
                        var afterAnimation = function() {
                            !isDefined(autoScrollExp) || autoScrollExp && !scope.$eval(autoScrollExp) || $anchorScroll();
                        }, thisChangeId = ++changeCounter;
                        src ? ($http.get(src, {
                            cache: $templateCache
                        }).success(function(response) {
                            if (thisChangeId === changeCounter) {
                                var newScope = scope.$new();
                                ctrl.template = response;
                                var clone = $transclude(newScope, function(clone) {
                                    cleanupLastIncludeContent(), $animate.enter(clone, null, $element, afterAnimation);
                                });
                                currentScope = newScope, currentElement = clone, currentScope.$emit("$includeContentLoaded"), 
                                scope.$eval(onloadExp);
                            }
                        }).error(function() {
                            thisChangeId === changeCounter && cleanupLastIncludeContent();
                        }), scope.$emit("$includeContentRequested")) : (cleanupLastIncludeContent(), ctrl.template = null);
                    });
                };
            }
        };
    } ], ngIncludeFillContentDirective = [ "$compile", function($compile) {
        return {
            restrict: "ECA",
            priority: -400,
            require: "ngInclude",
            link: function(scope, $element, $attr, ctrl) {
                $element.html(ctrl.template), $compile($element.contents())(scope);
            }
        };
    } ], ngInitDirective = ngDirective({
        priority: 450,
        compile: function() {
            return {
                pre: function(scope, element, attrs) {
                    scope.$eval(attrs.ngInit);
                }
            };
        }
    }), ngNonBindableDirective = ngDirective({
        terminal: !0,
        priority: 1e3
    }), ngPluralizeDirective = [ "$locale", "$interpolate", function($locale, $interpolate) {
        var BRACE = /{}/g;
        return {
            restrict: "EA",
            link: function(scope, element, attr) {
                var numberExp = attr.count, whenExp = attr.$attr.when && element.attr(attr.$attr.when), offset = attr.offset || 0, whens = scope.$eval(whenExp) || {}, whensExpFns = {}, startSymbol = $interpolate.startSymbol(), endSymbol = $interpolate.endSymbol(), isWhen = /^when(Minus)?(.+)$/;
                forEach(attr, function(expression, attributeName) {
                    isWhen.test(attributeName) && (whens[lowercase(attributeName.replace("when", "").replace("Minus", "-"))] = element.attr(attr.$attr[attributeName]));
                }), forEach(whens, function(expression, key) {
                    whensExpFns[key] = $interpolate(expression.replace(BRACE, startSymbol + numberExp + "-" + offset + endSymbol));
                }), scope.$watch(function() {
                    var value = parseFloat(scope.$eval(numberExp));
                    return isNaN(value) ? "" : (value in whens || (value = $locale.pluralCat(value - offset)), 
                    whensExpFns[value](scope, element, !0));
                }, function(newVal) {
                    element.text(newVal);
                });
            }
        };
    } ], ngRepeatDirective = [ "$parse", "$animate", function($parse, $animate) {
        function getBlockStart(block) {
            return block.clone[0];
        }
        function getBlockEnd(block) {
            return block.clone[block.clone.length - 1];
        }
        var NG_REMOVED = "$$NG_REMOVED", ngRepeatMinErr = minErr("ngRepeat");
        return {
            transclude: "element",
            priority: 1e3,
            terminal: !0,
            $$tlb: !0,
            link: function($scope, $element, $attr, ctrl, $transclude) {
                var trackByExp, trackByExpGetter, trackByIdExpFn, trackByIdArrayFn, trackByIdObjFn, lhs, rhs, valueIdentifier, keyIdentifier, expression = $attr.ngRepeat, match = expression.match(/^\s*([\s\S]+?)\s+in\s+([\s\S]+?)(?:\s+track\s+by\s+([\s\S]+?))?\s*$/), hashFnLocals = {
                    $id: hashKey
                };
                if (!match) throw ngRepeatMinErr("iexp", "Expected expression in form of '_item_ in _collection_[ track by _id_]' but got '{0}'.", expression);
                if (lhs = match[1], rhs = match[2], trackByExp = match[3], trackByExp ? (trackByExpGetter = $parse(trackByExp), 
                trackByIdExpFn = function(key, value, index) {
                    return keyIdentifier && (hashFnLocals[keyIdentifier] = key), hashFnLocals[valueIdentifier] = value, 
                    hashFnLocals.$index = index, trackByExpGetter($scope, hashFnLocals);
                }) : (trackByIdArrayFn = function(key, value) {
                    return hashKey(value);
                }, trackByIdObjFn = function(key) {
                    return key;
                }), match = lhs.match(/^(?:([\$\w]+)|\(([\$\w]+)\s*,\s*([\$\w]+)\))$/), !match) throw ngRepeatMinErr("iidexp", "'_item_' in '_item_ in _collection_' should be an identifier or '(_key_, _value_)' expression, but got '{0}'.", lhs);
                valueIdentifier = match[3] || match[1], keyIdentifier = match[2];
                var lastBlockMap = {};
                $scope.$watchCollection(rhs, function(collection) {
                    var index, length, nextNode, arrayLength, childScope, key, value, trackById, trackByIdFn, collectionKeys, block, elementsToRemove, previousNode = $element[0], nextBlockMap = {}, nextBlockOrder = [];
                    if (isArrayLike(collection)) collectionKeys = collection, trackByIdFn = trackByIdExpFn || trackByIdArrayFn; else {
                        trackByIdFn = trackByIdExpFn || trackByIdObjFn, collectionKeys = [];
                        for (key in collection) collection.hasOwnProperty(key) && "$" != key.charAt(0) && collectionKeys.push(key);
                        collectionKeys.sort();
                    }
                    for (arrayLength = collectionKeys.length, length = nextBlockOrder.length = collectionKeys.length, 
                    index = 0; length > index; index++) if (key = collection === collectionKeys ? index : collectionKeys[index], 
                    value = collection[key], trackById = trackByIdFn(key, value, index), assertNotHasOwnProperty(trackById, "`track by` id"), 
                    lastBlockMap.hasOwnProperty(trackById)) block = lastBlockMap[trackById], delete lastBlockMap[trackById], 
                    nextBlockMap[trackById] = block, nextBlockOrder[index] = block; else {
                        if (nextBlockMap.hasOwnProperty(trackById)) throw forEach(nextBlockOrder, function(block) {
                            block && block.scope && (lastBlockMap[block.id] = block);
                        }), ngRepeatMinErr("dupes", "Duplicates in a repeater are not allowed. Use 'track by' expression to specify unique keys. Repeater: {0}, Duplicate key: {1}", expression, trackById);
                        nextBlockOrder[index] = {
                            id: trackById
                        }, nextBlockMap[trackById] = !1;
                    }
                    for (key in lastBlockMap) lastBlockMap.hasOwnProperty(key) && (block = lastBlockMap[key], 
                    elementsToRemove = getBlockElements(block.clone), $animate.leave(elementsToRemove), 
                    forEach(elementsToRemove, function(element) {
                        element[NG_REMOVED] = !0;
                    }), block.scope.$destroy());
                    for (index = 0, length = collectionKeys.length; length > index; index++) {
                        if (key = collection === collectionKeys ? index : collectionKeys[index], value = collection[key], 
                        block = nextBlockOrder[index], nextBlockOrder[index - 1] && (previousNode = getBlockEnd(nextBlockOrder[index - 1])), 
                        block.scope) {
                            childScope = block.scope, nextNode = previousNode;
                            do nextNode = nextNode.nextSibling; while (nextNode && nextNode[NG_REMOVED]);
                            getBlockStart(block) != nextNode && $animate.move(getBlockElements(block.clone), null, jqLite(previousNode)), 
                            previousNode = getBlockEnd(block);
                        } else childScope = $scope.$new();
                        childScope[valueIdentifier] = value, keyIdentifier && (childScope[keyIdentifier] = key), 
                        childScope.$index = index, childScope.$first = 0 === index, childScope.$last = index === arrayLength - 1, 
                        childScope.$middle = !(childScope.$first || childScope.$last), childScope.$odd = !(childScope.$even = 0 === (1 & index)), 
                        block.scope || $transclude(childScope, function(clone) {
                            clone[clone.length++] = document.createComment(" end ngRepeat: " + expression + " "), 
                            $animate.enter(clone, null, jqLite(previousNode)), previousNode = clone, block.scope = childScope, 
                            block.clone = clone, nextBlockMap[block.id] = block;
                        });
                    }
                    lastBlockMap = nextBlockMap;
                });
            }
        };
    } ], ngShowDirective = [ "$animate", function($animate) {
        return function(scope, element, attr) {
            scope.$watch(attr.ngShow, function(value) {
                $animate[toBoolean(value) ? "removeClass" : "addClass"](element, "ng-hide");
            });
        };
    } ], ngHideDirective = [ "$animate", function($animate) {
        return function(scope, element, attr) {
            scope.$watch(attr.ngHide, function(value) {
                $animate[toBoolean(value) ? "addClass" : "removeClass"](element, "ng-hide");
            });
        };
    } ], ngStyleDirective = ngDirective(function(scope, element, attr) {
        scope.$watch(attr.ngStyle, function(newStyles, oldStyles) {
            oldStyles && newStyles !== oldStyles && forEach(oldStyles, function(val, style) {
                element.css(style, "");
            }), newStyles && element.css(newStyles);
        }, !0);
    }), ngSwitchDirective = [ "$animate", function($animate) {
        return {
            restrict: "EA",
            require: "ngSwitch",
            controller: [ "$scope", function() {
                this.cases = {};
            } ],
            link: function(scope, element, attr, ngSwitchController) {
                var selectedTranscludes, selectedElements, watchExpr = attr.ngSwitch || attr.on, selectedScopes = [];
                scope.$watch(watchExpr, function(value) {
                    for (var i = 0, ii = selectedScopes.length; ii > i; i++) selectedScopes[i].$destroy(), 
                    $animate.leave(selectedElements[i]);
                    selectedElements = [], selectedScopes = [], (selectedTranscludes = ngSwitchController.cases["!" + value] || ngSwitchController.cases["?"]) && (scope.$eval(attr.change), 
                    forEach(selectedTranscludes, function(selectedTransclude) {
                        var selectedScope = scope.$new();
                        selectedScopes.push(selectedScope), selectedTransclude.transclude(selectedScope, function(caseElement) {
                            var anchor = selectedTransclude.element;
                            selectedElements.push(caseElement), $animate.enter(caseElement, anchor.parent(), anchor);
                        });
                    }));
                });
            }
        };
    } ], ngSwitchWhenDirective = ngDirective({
        transclude: "element",
        priority: 800,
        require: "^ngSwitch",
        link: function(scope, element, attrs, ctrl, $transclude) {
            ctrl.cases["!" + attrs.ngSwitchWhen] = ctrl.cases["!" + attrs.ngSwitchWhen] || [], 
            ctrl.cases["!" + attrs.ngSwitchWhen].push({
                transclude: $transclude,
                element: element
            });
        }
    }), ngSwitchDefaultDirective = ngDirective({
        transclude: "element",
        priority: 800,
        require: "^ngSwitch",
        link: function(scope, element, attr, ctrl, $transclude) {
            ctrl.cases["?"] = ctrl.cases["?"] || [], ctrl.cases["?"].push({
                transclude: $transclude,
                element: element
            });
        }
    }), ngTranscludeDirective = ngDirective({
        controller: [ "$element", "$transclude", function($element, $transclude) {
            if (!$transclude) throw minErr("ngTransclude")("orphan", "Illegal use of ngTransclude directive in the template! No parent directive that requires a transclusion found. Element: {0}", startingTag($element));
            this.$transclude = $transclude;
        } ],
        link: function($scope, $element, $attrs, controller) {
            controller.$transclude(function(clone) {
                $element.empty(), $element.append(clone);
            });
        }
    }), scriptDirective = [ "$templateCache", function($templateCache) {
        return {
            restrict: "E",
            terminal: !0,
            compile: function(element, attr) {
                if ("text/ng-template" == attr.type) {
                    var templateUrl = attr.id, text = element[0].text;
                    $templateCache.put(templateUrl, text);
                }
            }
        };
    } ], ngOptionsMinErr = minErr("ngOptions"), ngOptionsDirective = valueFn({
        terminal: !0
    }), selectDirective = [ "$compile", "$parse", function($compile, $parse) {
        var NG_OPTIONS_REGEXP = /^\s*([\s\S]+?)(?:\s+as\s+([\s\S]+?))?(?:\s+group\s+by\s+([\s\S]+?))?\s+for\s+(?:([\$\w][\$\w]*)|(?:\(\s*([\$\w][\$\w]*)\s*,\s*([\$\w][\$\w]*)\s*\)))\s+in\s+([\s\S]+?)(?:\s+track\s+by\s+([\s\S]+?))?$/, nullModelCtrl = {
            $setViewValue: noop
        };
        return {
            restrict: "E",
            require: [ "select", "?ngModel" ],
            controller: [ "$element", "$scope", "$attrs", function($element, $scope, $attrs) {
                var nullOption, unknownOption, self = this, optionsMap = {}, ngModelCtrl = nullModelCtrl;
                self.databound = $attrs.ngModel, self.init = function(ngModelCtrl_, nullOption_, unknownOption_) {
                    ngModelCtrl = ngModelCtrl_, nullOption = nullOption_, unknownOption = unknownOption_;
                }, self.addOption = function(value) {
                    assertNotHasOwnProperty(value, '"option value"'), optionsMap[value] = !0, ngModelCtrl.$viewValue == value && ($element.val(value), 
                    unknownOption.parent() && unknownOption.remove());
                }, self.removeOption = function(value) {
                    this.hasOption(value) && (delete optionsMap[value], ngModelCtrl.$viewValue == value && this.renderUnknownOption(value));
                }, self.renderUnknownOption = function(val) {
                    var unknownVal = "? " + hashKey(val) + " ?";
                    unknownOption.val(unknownVal), $element.prepend(unknownOption), $element.val(unknownVal), 
                    unknownOption.prop("selected", !0);
                }, self.hasOption = function(value) {
                    return optionsMap.hasOwnProperty(value);
                }, $scope.$on("$destroy", function() {
                    self.renderUnknownOption = noop;
                });
            } ],
            link: function(scope, element, attr, ctrls) {
                function setupAsSingle(scope, selectElement, ngModelCtrl, selectCtrl) {
                    ngModelCtrl.$render = function() {
                        var viewValue = ngModelCtrl.$viewValue;
                        selectCtrl.hasOption(viewValue) ? (unknownOption.parent() && unknownOption.remove(), 
                        selectElement.val(viewValue), "" === viewValue && emptyOption.prop("selected", !0)) : isUndefined(viewValue) && emptyOption ? selectElement.val("") : selectCtrl.renderUnknownOption(viewValue);
                    }, selectElement.on("change", function() {
                        scope.$apply(function() {
                            unknownOption.parent() && unknownOption.remove(), ngModelCtrl.$setViewValue(selectElement.val());
                        });
                    });
                }
                function setupAsMultiple(scope, selectElement, ctrl) {
                    var lastView;
                    ctrl.$render = function() {
                        var items = new HashMap(ctrl.$viewValue);
                        forEach(selectElement.find("option"), function(option) {
                            option.selected = isDefined(items.get(option.value));
                        });
                    }, scope.$watch(function() {
                        equals(lastView, ctrl.$viewValue) || (lastView = copy(ctrl.$viewValue), ctrl.$render());
                    }), selectElement.on("change", function() {
                        scope.$apply(function() {
                            var array = [];
                            forEach(selectElement.find("option"), function(option) {
                                option.selected && array.push(option.value);
                            }), ctrl.$setViewValue(array);
                        });
                    });
                }
                function setupAsOptions(scope, selectElement, ctrl) {
                    function render() {
                        var optionGroupName, optionGroup, option, existingParent, existingOptions, existingOption, key, groupLength, length, groupIndex, index, selected, lastElement, element, label, optionGroups = {
                            "": []
                        }, optionGroupNames = [ "" ], modelValue = ctrl.$modelValue, values = valuesFn(scope) || [], keys = keyName ? sortedKeys(values) : values, locals = {}, selectedSet = !1;
                        if (multiple) if (trackFn && isArray(modelValue)) {
                            selectedSet = new HashMap([]);
                            for (var trackIndex = 0; trackIndex < modelValue.length; trackIndex++) locals[valueName] = modelValue[trackIndex], 
                            selectedSet.put(trackFn(scope, locals), modelValue[trackIndex]);
                        } else selectedSet = new HashMap(modelValue);
                        for (index = 0; length = keys.length, length > index; index++) {
                            if (key = index, keyName) {
                                if (key = keys[index], "$" === key.charAt(0)) continue;
                                locals[keyName] = key;
                            }
                            if (locals[valueName] = values[key], optionGroupName = groupByFn(scope, locals) || "", 
                            (optionGroup = optionGroups[optionGroupName]) || (optionGroup = optionGroups[optionGroupName] = [], 
                            optionGroupNames.push(optionGroupName)), multiple) selected = isDefined(selectedSet.remove(trackFn ? trackFn(scope, locals) : valueFn(scope, locals))); else {
                                if (trackFn) {
                                    var modelCast = {};
                                    modelCast[valueName] = modelValue, selected = trackFn(scope, modelCast) === trackFn(scope, locals);
                                } else selected = modelValue === valueFn(scope, locals);
                                selectedSet = selectedSet || selected;
                            }
                            label = displayFn(scope, locals), label = isDefined(label) ? label : "", optionGroup.push({
                                id: trackFn ? trackFn(scope, locals) : keyName ? keys[index] : index,
                                label: label,
                                selected: selected
                            });
                        }
                        for (multiple || (nullOption || null === modelValue ? optionGroups[""].unshift({
                            id: "",
                            label: "",
                            selected: !selectedSet
                        }) : selectedSet || optionGroups[""].unshift({
                            id: "?",
                            label: "",
                            selected: !0
                        })), groupIndex = 0, groupLength = optionGroupNames.length; groupLength > groupIndex; groupIndex++) {
                            for (optionGroupName = optionGroupNames[groupIndex], optionGroup = optionGroups[optionGroupName], 
                            optionGroupsCache.length <= groupIndex ? (existingParent = {
                                element: optGroupTemplate.clone().attr("label", optionGroupName),
                                label: optionGroup.label
                            }, existingOptions = [ existingParent ], optionGroupsCache.push(existingOptions), 
                            selectElement.append(existingParent.element)) : (existingOptions = optionGroupsCache[groupIndex], 
                            existingParent = existingOptions[0], existingParent.label != optionGroupName && existingParent.element.attr("label", existingParent.label = optionGroupName)), 
                            lastElement = null, index = 0, length = optionGroup.length; length > index; index++) option = optionGroup[index], 
                            (existingOption = existingOptions[index + 1]) ? (lastElement = existingOption.element, 
                            existingOption.label !== option.label && lastElement.text(existingOption.label = option.label), 
                            existingOption.id !== option.id && lastElement.val(existingOption.id = option.id), 
                            lastElement[0].selected !== option.selected && lastElement.prop("selected", existingOption.selected = option.selected)) : ("" === option.id && nullOption ? element = nullOption : (element = optionTemplate.clone()).val(option.id).attr("selected", option.selected).text(option.label), 
                            existingOptions.push(existingOption = {
                                element: element,
                                label: option.label,
                                id: option.id,
                                selected: option.selected
                            }), lastElement ? lastElement.after(element) : existingParent.element.append(element), 
                            lastElement = element);
                            for (index++; existingOptions.length > index; ) existingOptions.pop().element.remove();
                        }
                        for (;optionGroupsCache.length > groupIndex; ) optionGroupsCache.pop()[0].element.remove();
                    }
                    var match;
                    if (!(match = optionsExp.match(NG_OPTIONS_REGEXP))) throw ngOptionsMinErr("iexp", "Expected expression in form of '_select_ (as _label_)? for (_key_,)?_value_ in _collection_' but got '{0}'. Element: {1}", optionsExp, startingTag(selectElement));
                    var displayFn = $parse(match[2] || match[1]), valueName = match[4] || match[6], keyName = match[5], groupByFn = $parse(match[3] || ""), valueFn = $parse(match[2] ? match[1] : valueName), valuesFn = $parse(match[7]), track = match[8], trackFn = track ? $parse(match[8]) : null, optionGroupsCache = [ [ {
                        element: selectElement,
                        label: ""
                    } ] ];
                    nullOption && ($compile(nullOption)(scope), nullOption.removeClass("ng-scope"), 
                    nullOption.remove()), selectElement.empty(), selectElement.on("change", function() {
                        scope.$apply(function() {
                            var optionGroup, key, value, optionElement, index, groupIndex, length, groupLength, trackIndex, collection = valuesFn(scope) || [], locals = {};
                            if (multiple) {
                                for (value = [], groupIndex = 0, groupLength = optionGroupsCache.length; groupLength > groupIndex; groupIndex++) for (optionGroup = optionGroupsCache[groupIndex], 
                                index = 1, length = optionGroup.length; length > index; index++) if ((optionElement = optionGroup[index].element)[0].selected) {
                                    if (key = optionElement.val(), keyName && (locals[keyName] = key), trackFn) for (trackIndex = 0; trackIndex < collection.length && (locals[valueName] = collection[trackIndex], 
                                    trackFn(scope, locals) != key); trackIndex++) ; else locals[valueName] = collection[key];
                                    value.push(valueFn(scope, locals));
                                }
                            } else if (key = selectElement.val(), "?" == key) value = undefined; else if ("" === key) value = null; else if (trackFn) {
                                for (trackIndex = 0; trackIndex < collection.length; trackIndex++) if (locals[valueName] = collection[trackIndex], 
                                trackFn(scope, locals) == key) {
                                    value = valueFn(scope, locals);
                                    break;
                                }
                            } else locals[valueName] = collection[key], keyName && (locals[keyName] = key), 
                            value = valueFn(scope, locals);
                            ctrl.$setViewValue(value);
                        });
                    }), ctrl.$render = render, scope.$watch(render);
                }
                if (ctrls[1]) {
                    for (var emptyOption, selectCtrl = ctrls[0], ngModelCtrl = ctrls[1], multiple = attr.multiple, optionsExp = attr.ngOptions, nullOption = !1, optionTemplate = jqLite(document.createElement("option")), optGroupTemplate = jqLite(document.createElement("optgroup")), unknownOption = optionTemplate.clone(), i = 0, children = element.children(), ii = children.length; ii > i; i++) if ("" === children[i].value) {
                        emptyOption = nullOption = children.eq(i);
                        break;
                    }
                    selectCtrl.init(ngModelCtrl, nullOption, unknownOption), multiple && (ngModelCtrl.$isEmpty = function(value) {
                        return !value || 0 === value.length;
                    }), optionsExp ? setupAsOptions(scope, element, ngModelCtrl) : multiple ? setupAsMultiple(scope, element, ngModelCtrl) : setupAsSingle(scope, element, ngModelCtrl, selectCtrl);
                }
            }
        };
    } ], optionDirective = [ "$interpolate", function($interpolate) {
        var nullSelectCtrl = {
            addOption: noop,
            removeOption: noop
        };
        return {
            restrict: "E",
            priority: 100,
            compile: function(element, attr) {
                if (isUndefined(attr.value)) {
                    var interpolateFn = $interpolate(element.text(), !0);
                    interpolateFn || attr.$set("value", element.text());
                }
                return function(scope, element, attr) {
                    var selectCtrlName = "$selectController", parent = element.parent(), selectCtrl = parent.data(selectCtrlName) || parent.parent().data(selectCtrlName);
                    selectCtrl && selectCtrl.databound ? element.prop("selected", !1) : selectCtrl = nullSelectCtrl, 
                    interpolateFn ? scope.$watch(interpolateFn, function(newVal, oldVal) {
                        attr.$set("value", newVal), newVal !== oldVal && selectCtrl.removeOption(oldVal), 
                        selectCtrl.addOption(newVal);
                    }) : selectCtrl.addOption(attr.value), element.on("$destroy", function() {
                        selectCtrl.removeOption(attr.value);
                    });
                };
            }
        };
    } ], styleDirective = valueFn({
        restrict: "E",
        terminal: !0
    });
    bindJQuery(), publishExternalAPI(angular), jqLite(document).ready(function() {
        angularInit(document, bootstrap);
    });
}(window, document), !angular.$$csp() && angular.element(document).find("head").prepend('<style type="text/css">@charset "UTF-8";[ng\\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide{display:none !important;}ng\\:form{display:block;}</style>'), 
function(window, angular, undefined) {
    "use strict";
    angular.module("ngAnimate", [ "ng" ]).factory("$$animateReflow", [ "$window", "$timeout", function($window, $timeout) {
        var requestAnimationFrame = $window.requestAnimationFrame || $window.webkitRequestAnimationFrame || function(fn) {
            return $timeout(fn, 10, !1);
        }, cancelAnimationFrame = $window.cancelAnimationFrame || $window.webkitCancelAnimationFrame || function(timer) {
            return $timeout.cancel(timer);
        };
        return function(fn) {
            var id = requestAnimationFrame(fn);
            return function() {
                cancelAnimationFrame(id);
            };
        };
    } ]).config([ "$provide", "$animateProvider", function($provide, $animateProvider) {
        function extractElementNode(element) {
            for (var i = 0; i < element.length; i++) {
                var elm = element[i];
                if (elm.nodeType == ELEMENT_NODE) return elm;
            }
        }
        function isMatchingElement(elm1, elm2) {
            return extractElementNode(elm1) == extractElementNode(elm2);
        }
        var noop = angular.noop, forEach = angular.forEach, selectors = $animateProvider.$$selectors, ELEMENT_NODE = 1, NG_ANIMATE_STATE = "$$ngAnimateState", NG_ANIMATE_CLASS_NAME = "ng-animate", rootAnimateState = {
            running: !0
        };
        $provide.decorator("$animate", [ "$delegate", "$injector", "$sniffer", "$rootElement", "$timeout", "$rootScope", "$document", function($delegate, $injector, $sniffer, $rootElement, $timeout, $rootScope) {
            function async(fn) {
                return $timeout(fn, 0, !1);
            }
            function lookup(name) {
                if (name) {
                    var matches = [], flagMap = {}, classes = name.substr(1).split(".");
                    ($sniffer.transitions || $sniffer.animations) && classes.push("");
                    for (var i = 0; i < classes.length; i++) {
                        var klass = classes[i], selectorFactoryName = selectors[klass];
                        selectorFactoryName && !flagMap[klass] && (matches.push($injector.get(selectorFactoryName)), 
                        flagMap[klass] = !0);
                    }
                    return matches;
                }
            }
            function performAnimation(animationEvent, className, element, parentElement, afterElement, domOperation, doneCallback) {
                function onBeforeAnimationsComplete(cancelled) {
                    if (fireDOMOperation(), cancelled === !0) return void closeAnimation();
                    var data = element.data(NG_ANIMATE_STATE);
                    data && (data.done = closeAnimation, element.data(NG_ANIMATE_STATE, data)), invokeRegisteredAnimationFns(animations, "after", closeAnimation);
                }
                function invokeRegisteredAnimationFns(animations, phase, allAnimationFnsComplete) {
                    function progress(index, phase) {
                        var phaseCompletionFlag = phase + "Complete", currentAnimation = animations[index];
                        currentAnimation[phaseCompletionFlag] = !0, (currentAnimation[endFnName] || noop)();
                        for (var i = 0; i < animations.length; i++) if (!animations[i][phaseCompletionFlag]) return;
                        allAnimationFnsComplete();
                    }
                    "after" == phase ? fireAfterCallbackAsync() : fireBeforeCallbackAsync();
                    var endFnName = phase + "End";
                    forEach(animations, function(animation, index) {
                        var animationPhaseCompleted = function() {
                            progress(index, phase);
                        };
                        return "before" != phase || "enter" != animationEvent && "move" != animationEvent ? void (animation[phase] ? animation[endFnName] = isClassBased ? animation[phase](element, className, animationPhaseCompleted) : animation[phase](element, animationPhaseCompleted) : animationPhaseCompleted()) : void animationPhaseCompleted();
                    });
                }
                function fireDOMCallback(animationPhase) {
                    element.triggerHandler("$animate:" + animationPhase, {
                        event: animationEvent,
                        className: className
                    });
                }
                function fireBeforeCallbackAsync() {
                    async(function() {
                        fireDOMCallback("before");
                    });
                }
                function fireAfterCallbackAsync() {
                    async(function() {
                        fireDOMCallback("after");
                    });
                }
                function fireDoneCallbackAsync() {
                    doneCallback && async(doneCallback);
                }
                function fireDOMOperation() {
                    fireDOMOperation.hasBeenRun || (fireDOMOperation.hasBeenRun = !0, domOperation());
                }
                function closeAnimation() {
                    if (!closeAnimation.hasBeenRun) {
                        closeAnimation.hasBeenRun = !0;
                        var data = element.data(NG_ANIMATE_STATE);
                        data && (isClassBased ? cleanup(element) : (data.closeAnimationTimeout = async(function() {
                            cleanup(element);
                        }), element.data(NG_ANIMATE_STATE, data))), fireDoneCallbackAsync();
                    }
                }
                var currentClassName, classes, node = extractElementNode(element);
                if (node && (currentClassName = node.className, classes = currentClassName + " " + className), 
                !node || !isAnimatableClassName(classes)) return fireDOMOperation(), fireBeforeCallbackAsync(), 
                fireAfterCallbackAsync(), void closeAnimation();
                var animationLookup = (" " + classes).replace(/\s+/g, ".");
                parentElement || (parentElement = afterElement ? afterElement.parent() : element.parent());
                var matches = lookup(animationLookup), isClassBased = "addClass" == animationEvent || "removeClass" == animationEvent, ngAnimateState = element.data(NG_ANIMATE_STATE) || {};
                if (animationsDisabled(element, parentElement) || 0 === matches.length) return fireDOMOperation(), 
                fireBeforeCallbackAsync(), fireAfterCallbackAsync(), void closeAnimation();
                var animations = [], allowAnimations = isClassBased ? !(ngAnimateState.disabled || ngAnimateState.running && ngAnimateState.structural) : !0;
                if (allowAnimations && forEach(matches, function(animation) {
                    if (!animation.allowCancel || animation.allowCancel(element, animationEvent, className)) {
                        var beforeFn, afterFn = animation[animationEvent];
                        "leave" == animationEvent ? (beforeFn = afterFn, afterFn = null) : beforeFn = animation["before" + animationEvent.charAt(0).toUpperCase() + animationEvent.substr(1)], 
                        animations.push({
                            before: beforeFn,
                            after: afterFn
                        });
                    }
                }), 0 === animations.length) return fireDOMOperation(), fireBeforeCallbackAsync(), 
                fireAfterCallbackAsync(), void fireDoneCallbackAsync();
                var ONE_SPACE = " ", futureClassName = ONE_SPACE + currentClassName + ONE_SPACE;
                if (ngAnimateState.running) {
                    $timeout.cancel(ngAnimateState.closeAnimationTimeout), cleanup(element), cancelAnimations(ngAnimateState.animations);
                    var isFullyClassBasedAnimation = isClassBased && !ngAnimateState.structural, isRevertingClassAnimation = isFullyClassBasedAnimation && ngAnimateState.className == className && animationEvent != ngAnimateState.event;
                    ngAnimateState.beforeComplete || isRevertingClassAnimation ? (ngAnimateState.done || noop)(!0) : isFullyClassBasedAnimation && (futureClassName = "removeClass" == ngAnimateState.event ? futureClassName.replace(ONE_SPACE + ngAnimateState.className + ONE_SPACE, ONE_SPACE) : futureClassName + ngAnimateState.className + ONE_SPACE);
                }
                var classNameToken = ONE_SPACE + className + ONE_SPACE;
                return "addClass" == animationEvent && futureClassName.indexOf(classNameToken) >= 0 || "removeClass" == animationEvent && -1 == futureClassName.indexOf(classNameToken) ? (fireDOMOperation(), 
                fireBeforeCallbackAsync(), fireAfterCallbackAsync(), void fireDoneCallbackAsync()) : (element.addClass(NG_ANIMATE_CLASS_NAME), 
                element.data(NG_ANIMATE_STATE, {
                    running: !0,
                    event: animationEvent,
                    className: className,
                    structural: !isClassBased,
                    animations: animations,
                    done: onBeforeAnimationsComplete
                }), void invokeRegisteredAnimationFns(animations, "before", onBeforeAnimationsComplete));
            }
            function cancelChildAnimations(element) {
                var node = extractElementNode(element);
                forEach(node.querySelectorAll("." + NG_ANIMATE_CLASS_NAME), function(element) {
                    element = angular.element(element);
                    var data = element.data(NG_ANIMATE_STATE);
                    data && (cancelAnimations(data.animations), cleanup(element));
                });
            }
            function cancelAnimations(animations) {
                var isCancelledFlag = !0;
                forEach(animations, function(animation) {
                    animation.beforeComplete || (animation.beforeEnd || noop)(isCancelledFlag), animation.afterComplete || (animation.afterEnd || noop)(isCancelledFlag);
                });
            }
            function cleanup(element) {
                isMatchingElement(element, $rootElement) ? rootAnimateState.disabled || (rootAnimateState.running = !1, 
                rootAnimateState.structural = !1) : (element.removeClass(NG_ANIMATE_CLASS_NAME), 
                element.removeData(NG_ANIMATE_STATE));
            }
            function animationsDisabled(element, parentElement) {
                if (rootAnimateState.disabled) return !0;
                if (isMatchingElement(element, $rootElement)) return rootAnimateState.disabled || rootAnimateState.running;
                do {
                    if (0 === parentElement.length) break;
                    var isRoot = isMatchingElement(parentElement, $rootElement), state = isRoot ? rootAnimateState : parentElement.data(NG_ANIMATE_STATE), result = state && (!!state.disabled || !!state.running);
                    if (isRoot || result) return result;
                    if (isRoot) return !0;
                } while (parentElement = parentElement.parent());
                return !0;
            }
            $rootElement.data(NG_ANIMATE_STATE, rootAnimateState), $rootScope.$$postDigest(function() {
                $rootScope.$$postDigest(function() {
                    rootAnimateState.running = !1;
                });
            });
            var classNameFilter = $animateProvider.classNameFilter(), isAnimatableClassName = classNameFilter ? function(className) {
                return classNameFilter.test(className);
            } : function() {
                return !0;
            };
            return {
                enter: function(element, parentElement, afterElement, doneCallback) {
                    this.enabled(!1, element), $delegate.enter(element, parentElement, afterElement), 
                    $rootScope.$$postDigest(function() {
                        performAnimation("enter", "ng-enter", element, parentElement, afterElement, noop, doneCallback);
                    });
                },
                leave: function(element, doneCallback) {
                    cancelChildAnimations(element), this.enabled(!1, element), $rootScope.$$postDigest(function() {
                        performAnimation("leave", "ng-leave", element, null, null, function() {
                            $delegate.leave(element);
                        }, doneCallback);
                    });
                },
                move: function(element, parentElement, afterElement, doneCallback) {
                    cancelChildAnimations(element), this.enabled(!1, element), $delegate.move(element, parentElement, afterElement), 
                    $rootScope.$$postDigest(function() {
                        performAnimation("move", "ng-move", element, parentElement, afterElement, noop, doneCallback);
                    });
                },
                addClass: function(element, className, doneCallback) {
                    performAnimation("addClass", className, element, null, null, function() {
                        $delegate.addClass(element, className);
                    }, doneCallback);
                },
                removeClass: function(element, className, doneCallback) {
                    performAnimation("removeClass", className, element, null, null, function() {
                        $delegate.removeClass(element, className);
                    }, doneCallback);
                },
                enabled: function(value, element) {
                    switch (arguments.length) {
                      case 2:
                        if (value) cleanup(element); else {
                            var data = element.data(NG_ANIMATE_STATE) || {};
                            data.disabled = !0, element.data(NG_ANIMATE_STATE, data);
                        }
                        break;

                      case 1:
                        rootAnimateState.disabled = !value;
                        break;

                      default:
                        value = !rootAnimateState.disabled;
                    }
                    return !!value;
                }
            };
        } ]), $animateProvider.register("", [ "$window", "$sniffer", "$timeout", "$$animateReflow", function($window, $sniffer, $timeout, $$animateReflow) {
            function afterReflow(element, callback) {
                cancelAnimationReflow && cancelAnimationReflow(), animationReflowQueue.push(callback);
                var node = extractElementNode(element);
                element = angular.element(node), animationElementQueue.push(element);
                var elementData = element.data(NG_ANIMATE_CSS_DATA_KEY), stagger = elementData.stagger, staggerTime = elementData.itemIndex * (Math.max(stagger.animationDelay, stagger.transitionDelay) || 0), animationTime = (elementData.maxDelay + elementData.maxDuration) * CLOSING_TIME_BUFFER;
                closingAnimationTime = Math.max(closingAnimationTime, (staggerTime + animationTime) * ONE_SECOND), 
                elementData.animationCount = animationCounter, cancelAnimationReflow = $$animateReflow(function() {
                    forEach(animationReflowQueue, function(fn) {
                        fn();
                    });
                    var elementQueueSnapshot = [], animationCounterSnapshot = animationCounter;
                    forEach(animationElementQueue, function(elm) {
                        elementQueueSnapshot.push(elm);
                    }), $timeout(function() {
                        closeAllAnimations(elementQueueSnapshot, animationCounterSnapshot), elementQueueSnapshot = null;
                    }, closingAnimationTime, !1), animationReflowQueue = [], animationElementQueue = [], 
                    cancelAnimationReflow = null, lookupCache = {}, closingAnimationTime = 0, animationCounter++;
                });
            }
            function closeAllAnimations(elements, count) {
                forEach(elements, function(element) {
                    var elementData = element.data(NG_ANIMATE_CSS_DATA_KEY);
                    elementData && elementData.animationCount == count && (elementData.closeAnimationFn || noop)();
                });
            }
            function getElementAnimationDetails(element, cacheKey) {
                var data = cacheKey ? lookupCache[cacheKey] : null;
                if (!data) {
                    var transitionDelayStyle, animationDelayStyle, transitionDurationStyle, transitionPropertyStyle, transitionDuration = 0, transitionDelay = 0, animationDuration = 0, animationDelay = 0;
                    forEach(element, function(element) {
                        if (element.nodeType == ELEMENT_NODE) {
                            var elementStyles = $window.getComputedStyle(element) || {};
                            transitionDurationStyle = elementStyles[TRANSITION_PROP + DURATION_KEY], transitionDuration = Math.max(parseMaxTime(transitionDurationStyle), transitionDuration), 
                            transitionPropertyStyle = elementStyles[TRANSITION_PROP + PROPERTY_KEY], transitionDelayStyle = elementStyles[TRANSITION_PROP + DELAY_KEY], 
                            transitionDelay = Math.max(parseMaxTime(transitionDelayStyle), transitionDelay), 
                            animationDelayStyle = elementStyles[ANIMATION_PROP + DELAY_KEY], animationDelay = Math.max(parseMaxTime(animationDelayStyle), animationDelay);
                            var aDuration = parseMaxTime(elementStyles[ANIMATION_PROP + DURATION_KEY]);
                            aDuration > 0 && (aDuration *= parseInt(elementStyles[ANIMATION_PROP + ANIMATION_ITERATION_COUNT_KEY], 10) || 1), 
                            animationDuration = Math.max(aDuration, animationDuration);
                        }
                    }), data = {
                        total: 0,
                        transitionPropertyStyle: transitionPropertyStyle,
                        transitionDurationStyle: transitionDurationStyle,
                        transitionDelayStyle: transitionDelayStyle,
                        transitionDelay: transitionDelay,
                        transitionDuration: transitionDuration,
                        animationDelayStyle: animationDelayStyle,
                        animationDelay: animationDelay,
                        animationDuration: animationDuration
                    }, cacheKey && (lookupCache[cacheKey] = data);
                }
                return data;
            }
            function parseMaxTime(str) {
                var maxValue = 0, values = angular.isString(str) ? str.split(/\s*,\s*/) : [];
                return forEach(values, function(value) {
                    maxValue = Math.max(parseFloat(value) || 0, maxValue);
                }), maxValue;
            }
            function getCacheKey(element) {
                var parentElement = element.parent(), parentID = parentElement.data(NG_ANIMATE_PARENT_KEY);
                return parentID || (parentElement.data(NG_ANIMATE_PARENT_KEY, ++parentCounter), 
                parentID = parentCounter), parentID + "-" + extractElementNode(element).className;
            }
            function animateSetup(element, className, calculationDecorator) {
                var cacheKey = getCacheKey(element), eventCacheKey = cacheKey + " " + className, stagger = {}, itemIndex = lookupCache[eventCacheKey] ? ++lookupCache[eventCacheKey].total : 0;
                if (itemIndex > 0) {
                    var staggerClassName = className + "-stagger", staggerCacheKey = cacheKey + " " + staggerClassName, applyClasses = !lookupCache[staggerCacheKey];
                    applyClasses && element.addClass(staggerClassName), stagger = getElementAnimationDetails(element, staggerCacheKey), 
                    applyClasses && element.removeClass(staggerClassName);
                }
                calculationDecorator = calculationDecorator || function(fn) {
                    return fn();
                }, element.addClass(className);
                var timings = calculationDecorator(function() {
                    return getElementAnimationDetails(element, eventCacheKey);
                }), maxDelay = Math.max(timings.transitionDelay, timings.animationDelay), maxDuration = Math.max(timings.transitionDuration, timings.animationDuration);
                if (0 === maxDuration) return element.removeClass(className), !1;
                var activeClassName = "";
                return timings.transitionDuration > 0 ? blockTransitions(element) : blockKeyframeAnimations(element), 
                forEach(className.split(" "), function(klass, i) {
                    activeClassName += (i > 0 ? " " : "") + klass + "-active";
                }), element.data(NG_ANIMATE_CSS_DATA_KEY, {
                    className: className,
                    activeClassName: activeClassName,
                    maxDuration: maxDuration,
                    maxDelay: maxDelay,
                    classes: className + " " + activeClassName,
                    timings: timings,
                    stagger: stagger,
                    itemIndex: itemIndex
                }), !0;
            }
            function blockTransitions(element) {
                extractElementNode(element).style[TRANSITION_PROP + PROPERTY_KEY] = "none";
            }
            function blockKeyframeAnimations(element) {
                extractElementNode(element).style[ANIMATION_PROP] = "none 0s";
            }
            function unblockTransitions(element) {
                var prop = TRANSITION_PROP + PROPERTY_KEY, node = extractElementNode(element);
                node.style[prop] && node.style[prop].length > 0 && (node.style[prop] = "");
            }
            function unblockKeyframeAnimations(element) {
                var prop = ANIMATION_PROP, node = extractElementNode(element);
                node.style[prop] && node.style[prop].length > 0 && (node.style[prop] = "");
            }
            function animateRun(element, className, activeAnimationComplete) {
                function onEnd() {
                    element.off(css3AnimationEvents, onAnimationProgress), element.removeClass(activeClassName), 
                    animateClose(element, className);
                    var node = extractElementNode(element);
                    for (var i in appliedStyles) node.style.removeProperty(appliedStyles[i]);
                }
                function onAnimationProgress(event) {
                    event.stopPropagation();
                    var ev = event.originalEvent || event, timeStamp = ev.$manualTimeStamp || ev.timeStamp || Date.now(), elapsedTime = parseFloat(ev.elapsedTime.toFixed(ELAPSED_TIME_MAX_DECIMAL_PLACES));
                    Math.max(timeStamp - startTime, 0) >= maxDelayTime && elapsedTime >= maxDuration && activeAnimationComplete();
                }
                var elementData = element.data(NG_ANIMATE_CSS_DATA_KEY), node = extractElementNode(element);
                if (-1 == node.className.indexOf(className) || !elementData) return void activeAnimationComplete();
                var timings = elementData.timings, stagger = elementData.stagger, maxDuration = elementData.maxDuration, activeClassName = elementData.activeClassName, maxDelayTime = Math.max(timings.transitionDelay, timings.animationDelay) * ONE_SECOND, startTime = Date.now(), css3AnimationEvents = ANIMATIONEND_EVENT + " " + TRANSITIONEND_EVENT, itemIndex = elementData.itemIndex, style = "", appliedStyles = [];
                if (timings.transitionDuration > 0) {
                    var propertyStyle = timings.transitionPropertyStyle;
                    -1 == propertyStyle.indexOf("all") && (style += CSS_PREFIX + "transition-property: " + propertyStyle + ";", 
                    style += CSS_PREFIX + "transition-duration: " + timings.transitionDurationStyle + ";", 
                    appliedStyles.push(CSS_PREFIX + "transition-property"), appliedStyles.push(CSS_PREFIX + "transition-duration"));
                }
                if (itemIndex > 0) {
                    if (stagger.transitionDelay > 0 && 0 === stagger.transitionDuration) {
                        var delayStyle = timings.transitionDelayStyle;
                        style += CSS_PREFIX + "transition-delay: " + prepareStaggerDelay(delayStyle, stagger.transitionDelay, itemIndex) + "; ", 
                        appliedStyles.push(CSS_PREFIX + "transition-delay");
                    }
                    stagger.animationDelay > 0 && 0 === stagger.animationDuration && (style += CSS_PREFIX + "animation-delay: " + prepareStaggerDelay(timings.animationDelayStyle, stagger.animationDelay, itemIndex) + "; ", 
                    appliedStyles.push(CSS_PREFIX + "animation-delay"));
                }
                if (appliedStyles.length > 0) {
                    var oldStyle = node.getAttribute("style") || "";
                    node.setAttribute("style", oldStyle + " " + style);
                }
                return element.on(css3AnimationEvents, onAnimationProgress), element.addClass(activeClassName), 
                elementData.closeAnimationFn = function() {
                    onEnd(), activeAnimationComplete();
                }, onEnd;
            }
            function prepareStaggerDelay(delayStyle, staggerDelay, index) {
                var style = "";
                return forEach(delayStyle.split(","), function(val, i) {
                    style += (i > 0 ? "," : "") + (index * staggerDelay + parseInt(val, 10)) + "s";
                }), style;
            }
            function animateBefore(element, className, calculationDecorator) {
                return animateSetup(element, className, calculationDecorator) ? function(cancelled) {
                    cancelled && animateClose(element, className);
                } : void 0;
            }
            function animateAfter(element, className, afterAnimationComplete) {
                return element.data(NG_ANIMATE_CSS_DATA_KEY) ? animateRun(element, className, afterAnimationComplete) : (animateClose(element, className), 
                void afterAnimationComplete());
            }
            function animate(element, className, animationComplete) {
                var preReflowCancellation = animateBefore(element, className);
                if (!preReflowCancellation) return void animationComplete();
                var cancel = preReflowCancellation;
                return afterReflow(element, function() {
                    unblockTransitions(element), unblockKeyframeAnimations(element), cancel = animateAfter(element, className, animationComplete);
                }), function(cancelled) {
                    (cancel || noop)(cancelled);
                };
            }
            function animateClose(element, className) {
                element.removeClass(className), element.removeData(NG_ANIMATE_CSS_DATA_KEY);
            }
            function suffixClasses(classes, suffix) {
                var className = "";
                return classes = angular.isArray(classes) ? classes : classes.split(/\s+/), forEach(classes, function(klass, i) {
                    klass && klass.length > 0 && (className += (i > 0 ? " " : "") + klass + suffix);
                }), className;
            }
            var TRANSITION_PROP, TRANSITIONEND_EVENT, ANIMATION_PROP, ANIMATIONEND_EVENT, CSS_PREFIX = "";
            window.ontransitionend === undefined && window.onwebkittransitionend !== undefined ? (CSS_PREFIX = "-webkit-", 
            TRANSITION_PROP = "WebkitTransition", TRANSITIONEND_EVENT = "webkitTransitionEnd transitionend") : (TRANSITION_PROP = "transition", 
            TRANSITIONEND_EVENT = "transitionend"), window.onanimationend === undefined && window.onwebkitanimationend !== undefined ? (CSS_PREFIX = "-webkit-", 
            ANIMATION_PROP = "WebkitAnimation", ANIMATIONEND_EVENT = "webkitAnimationEnd animationend") : (ANIMATION_PROP = "animation", 
            ANIMATIONEND_EVENT = "animationend");
            var cancelAnimationReflow, DURATION_KEY = "Duration", PROPERTY_KEY = "Property", DELAY_KEY = "Delay", ANIMATION_ITERATION_COUNT_KEY = "IterationCount", NG_ANIMATE_PARENT_KEY = "$$ngAnimateKey", NG_ANIMATE_CSS_DATA_KEY = "$$ngAnimateCSS3Data", ELAPSED_TIME_MAX_DECIMAL_PLACES = 3, CLOSING_TIME_BUFFER = 1.5, ONE_SECOND = 1e3, animationCounter = 0, lookupCache = {}, parentCounter = 0, animationReflowQueue = [], animationElementQueue = [], closingAnimationTime = 0;
            return {
                allowCancel: function(element, animationEvent, className) {
                    var oldClasses = (element.data(NG_ANIMATE_CSS_DATA_KEY) || {}).classes;
                    if (!oldClasses || [ "enter", "leave", "move" ].indexOf(animationEvent) >= 0) return !0;
                    var parentElement = element.parent(), clone = angular.element(extractElementNode(element).cloneNode());
                    clone.attr("style", "position:absolute; top:-9999px; left:-9999px"), clone.removeAttr("id"), 
                    clone.empty(), forEach(oldClasses.split(" "), function(klass) {
                        clone.removeClass(klass);
                    });
                    var suffix = "addClass" == animationEvent ? "-add" : "-remove";
                    clone.addClass(suffixClasses(className, suffix)), parentElement.append(clone);
                    var timings = getElementAnimationDetails(clone);
                    return clone.remove(), Math.max(timings.transitionDuration, timings.animationDuration) > 0;
                },
                enter: function(element, animationCompleted) {
                    return animate(element, "ng-enter", animationCompleted);
                },
                leave: function(element, animationCompleted) {
                    return animate(element, "ng-leave", animationCompleted);
                },
                move: function(element, animationCompleted) {
                    return animate(element, "ng-move", animationCompleted);
                },
                beforeAddClass: function(element, className, animationCompleted) {
                    var cancellationMethod = animateBefore(element, suffixClasses(className, "-add"), function(fn) {
                        element.addClass(className);
                        var timings = fn();
                        return element.removeClass(className), timings;
                    });
                    return cancellationMethod ? (afterReflow(element, function() {
                        unblockTransitions(element), unblockKeyframeAnimations(element), animationCompleted();
                    }), cancellationMethod) : void animationCompleted();
                },
                addClass: function(element, className, animationCompleted) {
                    return animateAfter(element, suffixClasses(className, "-add"), animationCompleted);
                },
                beforeRemoveClass: function(element, className, animationCompleted) {
                    var cancellationMethod = animateBefore(element, suffixClasses(className, "-remove"), function(fn) {
                        var klass = element.attr("class");
                        element.removeClass(className);
                        var timings = fn();
                        return element.attr("class", klass), timings;
                    });
                    return cancellationMethod ? (afterReflow(element, function() {
                        unblockTransitions(element), unblockKeyframeAnimations(element), animationCompleted();
                    }), cancellationMethod) : void animationCompleted();
                },
                removeClass: function(element, className, animationCompleted) {
                    return animateAfter(element, suffixClasses(className, "-remove"), animationCompleted);
                }
            };
        } ]);
    } ]);
}(window, window.angular), function(window, angular) {
    "use strict";
    function $RouteProvider() {
        function inherit(parent, extra) {
            return angular.extend(new (angular.extend(function() {}, {
                prototype: parent
            }))(), extra);
        }
        function pathRegExp(path, opts) {
            var insensitive = opts.caseInsensitiveMatch, ret = {
                originalPath: path,
                regexp: path
            }, keys = ret.keys = [];
            return path = path.replace(/([().])/g, "\\$1").replace(/(\/)?:(\w+)([\?|\*])?/g, function(_, slash, key, option) {
                var optional = "?" === option ? option : null, star = "*" === option ? option : null;
                return keys.push({
                    name: key,
                    optional: !!optional
                }), slash = slash || "", "" + (optional ? "" : slash) + "(?:" + (optional ? slash : "") + (star && "(.+?)" || "([^/]+)") + (optional || "") + ")" + (optional || "");
            }).replace(/([\/$\*])/g, "\\$1"), ret.regexp = new RegExp("^" + path + "$", insensitive ? "i" : ""), 
            ret;
        }
        var routes = {};
        this.when = function(path, route) {
            if (routes[path] = angular.extend({
                reloadOnSearch: !0
            }, route, path && pathRegExp(path, route)), path) {
                var redirectPath = "/" == path[path.length - 1] ? path.substr(0, path.length - 1) : path + "/";
                routes[redirectPath] = angular.extend({
                    redirectTo: path
                }, pathRegExp(redirectPath, route));
            }
            return this;
        }, this.otherwise = function(params) {
            return this.when(null, params), this;
        }, this.$get = [ "$rootScope", "$location", "$routeParams", "$q", "$injector", "$http", "$templateCache", "$sce", function($rootScope, $location, $routeParams, $q, $injector, $http, $templateCache, $sce) {
            function switchRouteMatcher(on, route) {
                var keys = route.keys, params = {};
                if (!route.regexp) return null;
                var m = route.regexp.exec(on);
                if (!m) return null;
                for (var i = 1, len = m.length; len > i; ++i) {
                    var key = keys[i - 1], val = "string" == typeof m[i] ? decodeURIComponent(m[i]) : m[i];
                    key && val && (params[key.name] = val);
                }
                return params;
            }
            function updateRoute() {
                var next = parseRoute(), last = $route.current;
                next && last && next.$$route === last.$$route && angular.equals(next.pathParams, last.pathParams) && !next.reloadOnSearch && !forceReload ? (last.params = next.params, 
                angular.copy(last.params, $routeParams), $rootScope.$broadcast("$routeUpdate", last)) : (next || last) && (forceReload = !1, 
                $rootScope.$broadcast("$routeChangeStart", next, last), $route.current = next, next && next.redirectTo && (angular.isString(next.redirectTo) ? $location.path(interpolate(next.redirectTo, next.params)).search(next.params).replace() : $location.url(next.redirectTo(next.pathParams, $location.path(), $location.search())).replace()), 
                $q.when(next).then(function() {
                    if (next) {
                        var template, templateUrl, locals = angular.extend({}, next.resolve);
                        return angular.forEach(locals, function(value, key) {
                            locals[key] = angular.isString(value) ? $injector.get(value) : $injector.invoke(value);
                        }), angular.isDefined(template = next.template) ? angular.isFunction(template) && (template = template(next.params)) : angular.isDefined(templateUrl = next.templateUrl) && (angular.isFunction(templateUrl) && (templateUrl = templateUrl(next.params)), 
                        templateUrl = $sce.getTrustedResourceUrl(templateUrl), angular.isDefined(templateUrl) && (next.loadedTemplateUrl = templateUrl, 
                        template = $http.get(templateUrl, {
                            cache: $templateCache
                        }).then(function(response) {
                            return response.data;
                        }))), angular.isDefined(template) && (locals.$template = template), $q.all(locals);
                    }
                }).then(function(locals) {
                    next == $route.current && (next && (next.locals = locals, angular.copy(next.params, $routeParams)), 
                    $rootScope.$broadcast("$routeChangeSuccess", next, last));
                }, function(error) {
                    next == $route.current && $rootScope.$broadcast("$routeChangeError", next, last, error);
                }));
            }
            function parseRoute() {
                var params, match;
                return angular.forEach(routes, function(route) {
                    !match && (params = switchRouteMatcher($location.path(), route)) && (match = inherit(route, {
                        params: angular.extend({}, $location.search(), params),
                        pathParams: params
                    }), match.$$route = route);
                }), match || routes[null] && inherit(routes[null], {
                    params: {},
                    pathParams: {}
                });
            }
            function interpolate(string, params) {
                var result = [];
                return angular.forEach((string || "").split(":"), function(segment, i) {
                    if (0 === i) result.push(segment); else {
                        var segmentMatch = segment.match(/(\w+)(.*)/), key = segmentMatch[1];
                        result.push(params[key]), result.push(segmentMatch[2] || ""), delete params[key];
                    }
                }), result.join("");
            }
            var forceReload = !1, $route = {
                routes: routes,
                reload: function() {
                    forceReload = !0, $rootScope.$evalAsync(updateRoute);
                }
            };
            return $rootScope.$on("$locationChangeSuccess", updateRoute), $route;
        } ];
    }
    function $RouteParamsProvider() {
        this.$get = function() {
            return {};
        };
    }
    function ngViewFactory($route, $anchorScroll, $animate) {
        return {
            restrict: "ECA",
            terminal: !0,
            priority: 400,
            transclude: "element",
            link: function(scope, $element, attr, ctrl, $transclude) {
                function cleanupLastView() {
                    currentScope && (currentScope.$destroy(), currentScope = null), currentElement && ($animate.leave(currentElement), 
                    currentElement = null);
                }
                function update() {
                    var locals = $route.current && $route.current.locals, template = locals && locals.$template;
                    if (angular.isDefined(template)) {
                        var newScope = scope.$new(), current = $route.current, clone = $transclude(newScope, function(clone) {
                            $animate.enter(clone, null, currentElement || $element, function() {
                                !angular.isDefined(autoScrollExp) || autoScrollExp && !scope.$eval(autoScrollExp) || $anchorScroll();
                            }), cleanupLastView();
                        });
                        currentElement = clone, currentScope = current.scope = newScope, currentScope.$emit("$viewContentLoaded"), 
                        currentScope.$eval(onloadExp);
                    } else cleanupLastView();
                }
                var currentScope, currentElement, autoScrollExp = attr.autoscroll, onloadExp = attr.onload || "";
                scope.$on("$routeChangeSuccess", update), update();
            }
        };
    }
    function ngViewFillContentFactory($compile, $controller, $route) {
        return {
            restrict: "ECA",
            priority: -400,
            link: function(scope, $element) {
                var current = $route.current, locals = current.locals;
                $element.html(locals.$template);
                var link = $compile($element.contents());
                if (current.controller) {
                    locals.$scope = scope;
                    var controller = $controller(current.controller, locals);
                    current.controllerAs && (scope[current.controllerAs] = controller), $element.data("$ngControllerController", controller), 
                    $element.children().data("$ngControllerController", controller);
                }
                link(scope);
            }
        };
    }
    var ngRouteModule = angular.module("ngRoute", [ "ng" ]).provider("$route", $RouteProvider);
    ngRouteModule.provider("$routeParams", $RouteParamsProvider), ngRouteModule.directive("ngView", ngViewFactory), 
    ngRouteModule.directive("ngView", ngViewFillContentFactory), ngViewFactory.$inject = [ "$route", "$anchorScroll", "$animate" ], 
    ngViewFillContentFactory.$inject = [ "$compile", "$controller", "$route" ];
}(window, window.angular), function(window, angular, undefined) {
    "use strict";
    function isValidDottedPath(path) {
        return null != path && "" !== path && "hasOwnProperty" !== path && MEMBER_NAME_REGEX.test("." + path);
    }
    function lookupDottedPath(obj, path) {
        if (!isValidDottedPath(path)) throw $resourceMinErr("badmember", 'Dotted member path "@{0}" is invalid.', path);
        for (var keys = path.split("."), i = 0, ii = keys.length; ii > i && obj !== undefined; i++) {
            var key = keys[i];
            obj = null !== obj ? obj[key] : undefined;
        }
        return obj;
    }
    function shallowClearAndCopy(src, dst) {
        dst = dst || {}, angular.forEach(dst, function(value, key) {
            delete dst[key];
        });
        for (var key in src) src.hasOwnProperty(key) && "$" !== key.charAt(0) && "$" !== key.charAt(1) && (dst[key] = src[key]);
        return dst;
    }
    var $resourceMinErr = angular.$$minErr("$resource"), MEMBER_NAME_REGEX = /^(\.[a-zA-Z_$][0-9a-zA-Z_$]*)+$/;
    angular.module("ngResource", [ "ng" ]).factory("$resource", [ "$http", "$q", function($http, $q) {
        function encodeUriSegment(val) {
            return encodeUriQuery(val, !0).replace(/%26/gi, "&").replace(/%3D/gi, "=").replace(/%2B/gi, "+");
        }
        function encodeUriQuery(val, pctEncodeSpaces) {
            return encodeURIComponent(val).replace(/%40/gi, "@").replace(/%3A/gi, ":").replace(/%24/g, "$").replace(/%2C/gi, ",").replace(/%20/g, pctEncodeSpaces ? "%20" : "+");
        }
        function Route(template, defaults) {
            this.template = template, this.defaults = defaults || {}, this.urlParams = {};
        }
        function resourceFactory(url, paramDefaults, actions) {
            function extractParams(data, actionParams) {
                var ids = {};
                return actionParams = extend({}, paramDefaults, actionParams), forEach(actionParams, function(value, key) {
                    isFunction(value) && (value = value()), ids[key] = value && value.charAt && "@" == value.charAt(0) ? lookupDottedPath(data, value.substr(1)) : value;
                }), ids;
            }
            function defaultResponseInterceptor(response) {
                return response.resource;
            }
            function Resource(value) {
                shallowClearAndCopy(value || {}, this);
            }
            var route = new Route(url);
            return actions = extend({}, DEFAULT_ACTIONS, actions), forEach(actions, function(action, name) {
                var hasBody = /^(POST|PUT|PATCH)$/i.test(action.method);
                Resource[name] = function(a1, a2, a3, a4) {
                    var data, success, error, params = {};
                    switch (arguments.length) {
                      case 4:
                        error = a4, success = a3;

                      case 3:
                      case 2:
                        if (!isFunction(a2)) {
                            params = a1, data = a2, success = a3;
                            break;
                        }
                        if (isFunction(a1)) {
                            success = a1, error = a2;
                            break;
                        }
                        success = a2, error = a3;

                      case 1:
                        isFunction(a1) ? success = a1 : hasBody ? data = a1 : params = a1;
                        break;

                      case 0:
                        break;

                      default:
                        throw $resourceMinErr("badargs", "Expected up to 4 arguments [params, data, success, error], got {0} arguments", arguments.length);
                    }
                    var isInstanceCall = this instanceof Resource, value = isInstanceCall ? data : action.isArray ? [] : new Resource(data), httpConfig = {}, responseInterceptor = action.interceptor && action.interceptor.response || defaultResponseInterceptor, responseErrorInterceptor = action.interceptor && action.interceptor.responseError || undefined;
                    forEach(action, function(value, key) {
                        "params" != key && "isArray" != key && "interceptor" != key && (httpConfig[key] = copy(value));
                    }), hasBody && (httpConfig.data = data), route.setUrlParams(httpConfig, extend({}, extractParams(data, action.params || {}), params), action.url);
                    var promise = $http(httpConfig).then(function(response) {
                        var data = response.data, promise = value.$promise;
                        if (data) {
                            if (angular.isArray(data) !== !!action.isArray) throw $resourceMinErr("badcfg", "Error in resource configuration. Expected response to contain an {0} but got an {1}", action.isArray ? "array" : "object", angular.isArray(data) ? "array" : "object");
                            action.isArray ? (value.length = 0, forEach(data, function(item) {
                                value.push(new Resource(item));
                            })) : (shallowClearAndCopy(data, value), value.$promise = promise);
                        }
                        return value.$resolved = !0, response.resource = value, response;
                    }, function(response) {
                        return value.$resolved = !0, (error || noop)(response), $q.reject(response);
                    });
                    return promise = promise.then(function(response) {
                        var value = responseInterceptor(response);
                        return (success || noop)(value, response.headers), value;
                    }, responseErrorInterceptor), isInstanceCall ? promise : (value.$promise = promise, 
                    value.$resolved = !1, value);
                }, Resource.prototype["$" + name] = function(params, success, error) {
                    isFunction(params) && (error = success, success = params, params = {});
                    var result = Resource[name].call(this, params, this, success, error);
                    return result.$promise || result;
                };
            }), Resource.bind = function(additionalParamDefaults) {
                return resourceFactory(url, extend({}, paramDefaults, additionalParamDefaults), actions);
            }, Resource;
        }
        var DEFAULT_ACTIONS = {
            get: {
                method: "GET"
            },
            save: {
                method: "POST"
            },
            query: {
                method: "GET",
                isArray: !0
            },
            remove: {
                method: "DELETE"
            },
            "delete": {
                method: "DELETE"
            }
        }, noop = angular.noop, forEach = angular.forEach, extend = angular.extend, copy = angular.copy, isFunction = angular.isFunction;
        return Route.prototype = {
            setUrlParams: function(config, params, actionUrl) {
                var val, encodedVal, self = this, url = actionUrl || self.template, urlParams = self.urlParams = {};
                forEach(url.split(/\W/), function(param) {
                    if ("hasOwnProperty" === param) throw $resourceMinErr("badname", "hasOwnProperty is not a valid parameter name.");
                    !new RegExp("^\\d+$").test(param) && param && new RegExp("(^|[^\\\\]):" + param + "(\\W|$)").test(url) && (urlParams[param] = !0);
                }), url = url.replace(/\\:/g, ":"), params = params || {}, forEach(self.urlParams, function(_, urlParam) {
                    val = params.hasOwnProperty(urlParam) ? params[urlParam] : self.defaults[urlParam], 
                    angular.isDefined(val) && null !== val ? (encodedVal = encodeUriSegment(val), url = url.replace(new RegExp(":" + urlParam + "(\\W|$)", "g"), encodedVal + "$1")) : url = url.replace(new RegExp("(/?):" + urlParam + "(\\W|$)", "g"), function(match, leadingSlashes, tail) {
                        return "/" == tail.charAt(0) ? tail : leadingSlashes + tail;
                    });
                }), url = url.replace(/\/+$/, "") || "/", url = url.replace(/\/\.(?=\w+($|\?))/, "."), 
                config.url = url.replace(/\/\\\./, "/."), forEach(params, function(value, key) {
                    self.urlParams[key] || (config.params = config.params || {}, config.params[key] = value);
                });
            }
        }, resourceFactory;
    } ]);
}(window, window.angular), (window.jQuery || window.Zepto) && !function($) {
    $.fn.Swipe = function(params) {
        return this.each(function() {
            $(this).data("Swipe", new Swipe($(this)[0], params));
        });
    };
}(window.jQuery || window.Zepto), !function(a, b, c) {
    a.fn.jScrollPane = function(d) {
        function e(d, e) {
            function f(b) {
                var e, h, j, l, m, n, q = !1, r = !1;
                if (P = b, Q === c) m = d.scrollTop(), n = d.scrollLeft(), d.css({
                    overflow: "hidden",
                    padding: 0
                }), R = d.innerWidth() + tb, S = d.innerHeight(), d.width(R), Q = a('<div class="jspPane" />').css("padding", sb).append(d.children()), 
                T = a('<div class="jspContainer" />').css({
                    width: R + "px",
                    height: S + "px"
                }).append(Q).appendTo(d); else {
                    if (d.css("width", ""), q = P.stickToBottom && C(), r = P.stickToRight && D(), l = d.innerWidth() + tb != R || d.outerHeight() != S, 
                    l && (R = d.innerWidth() + tb, S = d.innerHeight(), T.css({
                        width: R + "px",
                        height: S + "px"
                    })), !l && ub == U && Q.outerHeight() == V) return void d.width(R);
                    ub = U, Q.css("width", ""), d.width(R), T.find(">.jspVerticalBar,>.jspHorizontalBar").remove().end();
                }
                Q.css("overflow", "auto"), U = b.contentWidth ? b.contentWidth : Q[0].scrollWidth, 
                V = Q[0].scrollHeight, Q.css("overflow", ""), W = U / R, X = V / S, Y = X > 1, Z = W > 1, 
                Z || Y ? (d.addClass("jspScrollable"), e = P.maintainPosition && (ab || db), e && (h = A(), 
                j = B()), g(), i(), k(), e && (y(r ? U - R : h, !1), x(q ? V - S : j, !1)), H(), 
                E(), N(), P.enableKeyboardNavigation && J(), P.clickOnTrack && o(), L(), P.hijackInternalLinks && M()) : (d.removeClass("jspScrollable"), 
                Q.css({
                    top: 0,
                    left: 0,
                    width: T.width() - tb
                }), F(), I(), K(), p()), P.autoReinitialise && !rb ? rb = setInterval(function() {
                    f(P);
                }, P.autoReinitialiseDelay) : !P.autoReinitialise && rb && clearInterval(rb), m && d.scrollTop(0) && x(m, !1), 
                n && d.scrollLeft(0) && y(n, !1), d.trigger("jsp-initialised", [ Z || Y ]);
            }
            function g() {
                Y && (T.append(a('<div class="jspVerticalBar" />').append(a('<div class="jspCap jspCapTop" />'), a('<div class="jspTrack" />').append(a('<div class="jspDrag" />').append(a('<div class="jspDragTop" />'), a('<div class="jspDragBottom" />'))), a('<div class="jspCap jspCapBottom" />'))), 
                eb = T.find(">.jspVerticalBar"), fb = eb.find(">.jspTrack"), $ = fb.find(">.jspDrag"), 
                P.showArrows && (jb = a('<a class="jspArrow jspArrowUp" />').bind("mousedown.jsp", m(0, -1)).bind("click.jsp", G), 
                kb = a('<a class="jspArrow jspArrowDown" />').bind("mousedown.jsp", m(0, 1)).bind("click.jsp", G), 
                P.arrowScrollOnHover && (jb.bind("mouseover.jsp", m(0, -1, jb)), kb.bind("mouseover.jsp", m(0, 1, kb))), 
                l(fb, P.verticalArrowPositions, jb, kb)), hb = S, T.find(">.jspVerticalBar>.jspCap:visible,>.jspVerticalBar>.jspArrow").each(function() {
                    hb -= a(this).outerHeight();
                }), $.hover(function() {
                    $.addClass("jspHover");
                }, function() {
                    $.removeClass("jspHover");
                }).bind("mousedown.jsp", function(b) {
                    a("html").bind("dragstart.jsp selectstart.jsp", G), $.addClass("jspActive");
                    var c = b.pageY - $.position().top;
                    return a("html").bind("mousemove.jsp", function(a) {
                        r(a.pageY - c, !1);
                    }).bind("mouseup.jsp mouseleave.jsp", q), !1;
                }), h());
            }
            function h() {
                fb.height(hb + "px"), ab = 0, gb = P.verticalGutter + fb.outerWidth(), Q.width(R - gb - tb);
                try {
                    0 === eb.position().left && Q.css("margin-left", gb + "px");
                } catch (a) {}
            }
            function i() {
                Z && (T.append(a('<div class="jspHorizontalBar" />').append(a('<div class="jspCap jspCapLeft" />'), a('<div class="jspTrack" />').append(a('<div class="jspDrag" />').append(a('<div class="jspDragLeft" />'), a('<div class="jspDragRight" />'))), a('<div class="jspCap jspCapRight" />'))), 
                lb = T.find(">.jspHorizontalBar"), mb = lb.find(">.jspTrack"), bb = mb.find(">.jspDrag"), 
                P.showArrows && (pb = a('<a class="jspArrow jspArrowLeft" />').bind("mousedown.jsp", m(-1, 0)).bind("click.jsp", G), 
                qb = a('<a class="jspArrow jspArrowRight" />').bind("mousedown.jsp", m(1, 0)).bind("click.jsp", G), 
                P.arrowScrollOnHover && (pb.bind("mouseover.jsp", m(-1, 0, pb)), qb.bind("mouseover.jsp", m(1, 0, qb))), 
                l(mb, P.horizontalArrowPositions, pb, qb)), bb.hover(function() {
                    bb.addClass("jspHover");
                }, function() {
                    bb.removeClass("jspHover");
                }).bind("mousedown.jsp", function(b) {
                    a("html").bind("dragstart.jsp selectstart.jsp", G), bb.addClass("jspActive");
                    var c = b.pageX - bb.position().left;
                    return a("html").bind("mousemove.jsp", function(a) {
                        t(a.pageX - c, !1);
                    }).bind("mouseup.jsp mouseleave.jsp", q), !1;
                }), nb = T.innerWidth(), j());
            }
            function j() {
                T.find(">.jspHorizontalBar>.jspCap:visible,>.jspHorizontalBar>.jspArrow").each(function() {
                    nb -= a(this).outerWidth();
                }), mb.width(nb + "px"), db = 0;
            }
            function k() {
                if (Z && Y) {
                    var b = mb.outerHeight(), c = fb.outerWidth();
                    hb -= b, a(lb).find(">.jspCap:visible,>.jspArrow").each(function() {
                        nb += a(this).outerWidth();
                    }), nb -= c, S -= c, R -= b, mb.parent().append(a('<div class="jspCorner" />').css("width", b + "px")), 
                    h(), j();
                }
                Z && Q.width(T.outerWidth() - tb + "px"), V = Q.outerHeight(), X = V / S, Z && (ob = Math.ceil(1 / W * nb), 
                ob > P.horizontalDragMaxWidth ? ob = P.horizontalDragMaxWidth : ob < P.horizontalDragMinWidth && (ob = P.horizontalDragMinWidth), 
                bb.width(ob + "px"), cb = nb - ob, u(db)), Y && (ib = Math.ceil(1 / X * hb), ib > P.verticalDragMaxHeight ? ib = P.verticalDragMaxHeight : ib < P.verticalDragMinHeight && (ib = P.verticalDragMinHeight), 
                $.height(ib + "px"), _ = hb - ib, s(ab));
            }
            function l(a, b, c, d) {
                var e, f = "before", g = "after";
                "os" == b && (b = /Mac/.test(navigator.platform) ? "after" : "split"), b == f ? g = b : b == g && (f = b, 
                e = c, c = d, d = e), a[f](c)[g](d);
            }
            function m(a, b, c) {
                return function() {
                    return n(a, b, this, c), this.blur(), !1;
                };
            }
            function n(b, c, d, e) {
                d = a(d).addClass("jspActive");
                var f, g, h = !0, i = function() {
                    0 !== b && vb.scrollByX(b * P.arrowButtonSpeed), 0 !== c && vb.scrollByY(c * P.arrowButtonSpeed), 
                    g = setTimeout(i, h ? P.initialDelay : P.arrowRepeatFreq), h = !1;
                };
                i(), f = e ? "mouseout.jsp" : "mouseup.jsp", e = e || a("html"), e.bind(f, function() {
                    d.removeClass("jspActive"), g && clearTimeout(g), g = null, e.unbind(f);
                });
            }
            function o() {
                p(), Y && fb.bind("mousedown.jsp", function(b) {
                    if (b.originalTarget === c || b.originalTarget == b.currentTarget) {
                        var d, e = a(this), f = e.offset(), g = b.pageY - f.top - ab, h = !0, i = function() {
                            var a = e.offset(), c = b.pageY - a.top - ib / 2, f = S * P.scrollPagePercent, k = _ * f / (V - S);
                            if (0 > g) ab - k > c ? vb.scrollByY(-f) : r(c); else {
                                if (!(g > 0)) return void j();
                                c > ab + k ? vb.scrollByY(f) : r(c);
                            }
                            d = setTimeout(i, h ? P.initialDelay : P.trackClickRepeatFreq), h = !1;
                        }, j = function() {
                            d && clearTimeout(d), d = null, a(document).unbind("mouseup.jsp", j);
                        };
                        return i(), a(document).bind("mouseup.jsp", j), !1;
                    }
                }), Z && mb.bind("mousedown.jsp", function(b) {
                    if (b.originalTarget === c || b.originalTarget == b.currentTarget) {
                        var d, e = a(this), f = e.offset(), g = b.pageX - f.left - db, h = !0, i = function() {
                            var a = e.offset(), c = b.pageX - a.left - ob / 2, f = R * P.scrollPagePercent, k = cb * f / (U - R);
                            if (0 > g) db - k > c ? vb.scrollByX(-f) : t(c); else {
                                if (!(g > 0)) return void j();
                                c > db + k ? vb.scrollByX(f) : t(c);
                            }
                            d = setTimeout(i, h ? P.initialDelay : P.trackClickRepeatFreq), h = !1;
                        }, j = function() {
                            d && clearTimeout(d), d = null, a(document).unbind("mouseup.jsp", j);
                        };
                        return i(), a(document).bind("mouseup.jsp", j), !1;
                    }
                });
            }
            function p() {
                mb && mb.unbind("mousedown.jsp"), fb && fb.unbind("mousedown.jsp");
            }
            function q() {
                a("html").unbind("dragstart.jsp selectstart.jsp mousemove.jsp mouseup.jsp mouseleave.jsp"), 
                $ && $.removeClass("jspActive"), bb && bb.removeClass("jspActive");
            }
            function r(a, b) {
                Y && (0 > a ? a = 0 : a > _ && (a = _), b === c && (b = P.animateScroll), b ? vb.animate($, "top", a, s) : ($.css("top", a), 
                s(a)));
            }
            function s(a) {
                a === c && (a = $.position().top), T.scrollTop(0), ab = a;
                var b = 0 === ab, e = ab == _, f = a / _, g = -f * (V - S);
                (wb != b || yb != e) && (wb = b, yb = e, d.trigger("jsp-arrow-change", [ wb, yb, xb, zb ])), 
                v(b, e), Q.css("top", g), d.trigger("jsp-scroll-y", [ -g, b, e ]).trigger("scroll");
            }
            function t(a, b) {
                Z && (0 > a ? a = 0 : a > cb && (a = cb), b === c && (b = P.animateScroll), b ? vb.animate(bb, "left", a, u) : (bb.css("left", a), 
                u(a)));
            }
            function u(a) {
                a === c && (a = bb.position().left), T.scrollTop(0), db = a;
                var b = 0 === db, e = db == cb, f = a / cb, g = -f * (U - R);
                (xb != b || zb != e) && (xb = b, zb = e, d.trigger("jsp-arrow-change", [ wb, yb, xb, zb ])), 
                w(b, e), Q.css("left", g), d.trigger("jsp-scroll-x", [ -g, b, e ]).trigger("scroll");
            }
            function v(a, b) {
                P.showArrows && (jb[a ? "addClass" : "removeClass"]("jspDisabled"), kb[b ? "addClass" : "removeClass"]("jspDisabled"));
            }
            function w(a, b) {
                P.showArrows && (pb[a ? "addClass" : "removeClass"]("jspDisabled"), qb[b ? "addClass" : "removeClass"]("jspDisabled"));
            }
            function x(a, b) {
                var c = a / (V - S);
                r(c * _, b);
            }
            function y(a, b) {
                var c = a / (U - R);
                t(c * cb, b);
            }
            function z(b, c, d) {
                var e, f, g, h, i, j, k, l, m, n = 0, o = 0;
                try {
                    e = a(b);
                } catch (p) {
                    return;
                }
                for (f = e.outerHeight(), g = e.outerWidth(), T.scrollTop(0), T.scrollLeft(0); !e.is(".jspPane"); ) if (n += e.position().top, 
                o += e.position().left, e = e.offsetParent(), /^body|html$/i.test(e[0].nodeName)) return;
                h = B(), j = h + S, h > n || c ? l = n - P.horizontalGutter : n + f > j && (l = n - S + f + P.horizontalGutter), 
                isNaN(l) || x(l, d), i = A(), k = i + R, i > o || c ? m = o - P.horizontalGutter : o + g > k && (m = o - R + g + P.horizontalGutter), 
                isNaN(m) || y(m, d);
            }
            function A() {
                return -Q.position().left;
            }
            function B() {
                return -Q.position().top;
            }
            function C() {
                var a = V - S;
                return a > 20 && a - B() < 10;
            }
            function D() {
                var a = U - R;
                return a > 20 && a - A() < 10;
            }
            function E() {
                T.unbind(Bb).bind(Bb, function(a, b, c, d) {
                    var e = db, f = ab, g = a.deltaFactor || P.mouseWheelSpeed;
                    return vb.scrollBy(c * g, -d * g, !1), e == db && f == ab;
                });
            }
            function F() {
                T.unbind(Bb);
            }
            function G() {
                return !1;
            }
            function H() {
                Q.find(":input,a").unbind("focus.jsp").bind("focus.jsp", function(a) {
                    z(a.target, !1);
                });
            }
            function I() {
                Q.find(":input,a").unbind("focus.jsp");
            }
            function J() {
                function b() {
                    var a = db, b = ab;
                    switch (c) {
                      case 40:
                        vb.scrollByY(P.keyboardSpeed, !1);
                        break;

                      case 38:
                        vb.scrollByY(-P.keyboardSpeed, !1);
                        break;

                      case 34:
                      case 32:
                        vb.scrollByY(S * P.scrollPagePercent, !1);
                        break;

                      case 33:
                        vb.scrollByY(-S * P.scrollPagePercent, !1);
                        break;

                      case 39:
                        vb.scrollByX(P.keyboardSpeed, !1);
                        break;

                      case 37:
                        vb.scrollByX(-P.keyboardSpeed, !1);
                    }
                    return e = a != db || b != ab;
                }
                var c, e, f = [];
                Z && f.push(lb[0]), Y && f.push(eb[0]), Q.focus(function() {
                    d.focus();
                }), d.attr("tabindex", 0).unbind("keydown.jsp keypress.jsp").bind("keydown.jsp", function(d) {
                    if (d.target === this || f.length && a(d.target).closest(f).length) {
                        var g = db, h = ab;
                        switch (d.keyCode) {
                          case 40:
                          case 38:
                          case 34:
                          case 32:
                          case 33:
                          case 39:
                          case 37:
                            c = d.keyCode, b();
                            break;

                          case 35:
                            x(V - S), c = null;
                            break;

                          case 36:
                            x(0), c = null;
                        }
                        return e = d.keyCode == c && g != db || h != ab, !e;
                    }
                }).bind("keypress.jsp", function(a) {
                    return a.keyCode == c && b(), !e;
                }), P.hideFocus ? (d.css("outline", "none"), "hideFocus" in T[0] && d.attr("hideFocus", !0)) : (d.css("outline", ""), 
                "hideFocus" in T[0] && d.attr("hideFocus", !1));
            }
            function K() {
                d.attr("tabindex", "-1").removeAttr("tabindex").unbind("keydown.jsp keypress.jsp");
            }
            function L() {
                if (location.hash && location.hash.length > 1) {
                    var b, c, d = escape(location.hash.substr(1));
                    try {
                        b = a("#" + d + ', a[name="' + d + '"]');
                    } catch (e) {
                        return;
                    }
                    b.length && Q.find(d) && (0 === T.scrollTop() ? c = setInterval(function() {
                        T.scrollTop() > 0 && (z(b, !0), a(document).scrollTop(T.position().top), clearInterval(c));
                    }, 50) : (z(b, !0), a(document).scrollTop(T.position().top)));
                }
            }
            function M() {
                a(document.body).data("jspHijack") || (a(document.body).data("jspHijack", !0), a(document.body).delegate("a[href*=#]", "click", function(c) {
                    var d, e, f, g, h, i, j = this.href.substr(0, this.href.indexOf("#")), k = location.href;
                    if (-1 !== location.href.indexOf("#") && (k = location.href.substr(0, location.href.indexOf("#"))), 
                    j === k) {
                        d = escape(this.href.substr(this.href.indexOf("#") + 1));
                        try {
                            e = a("#" + d + ', a[name="' + d + '"]');
                        } catch (l) {
                            return;
                        }
                        e.length && (f = e.closest(".jspScrollable"), g = f.data("jsp"), g.scrollToElement(e, !0), 
                        f[0].scrollIntoView && (h = a(b).scrollTop(), i = e.offset().top, (h > i || i > h + a(b).height()) && f[0].scrollIntoView()), 
                        c.preventDefault());
                    }
                }));
            }
            function N() {
                var a, b, c, d, e, f = !1;
                T.unbind("touchstart.jsp touchmove.jsp touchend.jsp click.jsp-touchclick").bind("touchstart.jsp", function(g) {
                    var h = g.originalEvent.touches[0];
                    a = A(), b = B(), c = h.pageX, d = h.pageY, e = !1, f = !0;
                }).bind("touchmove.jsp", function(g) {
                    if (f) {
                        var h = g.originalEvent.touches[0], i = db, j = ab;
                        return vb.scrollTo(a + c - h.pageX, b + d - h.pageY), e = e || Math.abs(c - h.pageX) > 5 || Math.abs(d - h.pageY) > 5, 
                        i == db && j == ab;
                    }
                }).bind("touchend.jsp", function() {
                    f = !1;
                }).bind("click.jsp-touchclick", function() {
                    return e ? (e = !1, !1) : void 0;
                });
            }
            function O() {
                var a = B(), b = A();
                d.removeClass("jspScrollable").unbind(".jsp"), d.replaceWith(Ab.append(Q.children())), 
                Ab.scrollTop(a), Ab.scrollLeft(b), rb && clearInterval(rb);
            }
            var P, Q, R, S, T, U, V, W, X, Y, Z, $, _, ab, bb, cb, db, eb, fb, gb, hb, ib, jb, kb, lb, mb, nb, ob, pb, qb, rb, sb, tb, ub, vb = this, wb = !0, xb = !0, yb = !1, zb = !1, Ab = d.clone(!1, !1).empty(), Bb = a.fn.mwheelIntent ? "mwheelIntent.jsp" : "mousewheel.jsp";
            "border-box" === d.css("box-sizing") ? (sb = 0, tb = 0) : (sb = d.css("paddingTop") + " " + d.css("paddingRight") + " " + d.css("paddingBottom") + " " + d.css("paddingLeft"), 
            tb = (parseInt(d.css("paddingLeft"), 10) || 0) + (parseInt(d.css("paddingRight"), 10) || 0)), 
            a.extend(vb, {
                reinitialise: function(b) {
                    b = a.extend({}, P, b), f(b);
                },
                scrollToElement: function(a, b, c) {
                    z(a, b, c);
                },
                scrollTo: function(a, b, c) {
                    y(a, c), x(b, c);
                },
                scrollToX: function(a, b) {
                    y(a, b);
                },
                scrollToY: function(a, b) {
                    x(a, b);
                },
                scrollToPercentX: function(a, b) {
                    y(a * (U - R), b);
                },
                scrollToPercentY: function(a, b) {
                    x(a * (V - S), b);
                },
                scrollBy: function(a, b, c) {
                    vb.scrollByX(a, c), vb.scrollByY(b, c);
                },
                scrollByX: function(a, b) {
                    var c = A() + Math[0 > a ? "floor" : "ceil"](a), d = c / (U - R);
                    t(d * cb, b);
                },
                scrollByY: function(a, b) {
                    var c = B() + Math[0 > a ? "floor" : "ceil"](a), d = c / (V - S);
                    r(d * _, b);
                },
                positionDragX: function(a, b) {
                    t(a, b);
                },
                positionDragY: function(a, b) {
                    r(a, b);
                },
                animate: function(a, b, c, d) {
                    var e = {};
                    e[b] = c, a.animate(e, {
                        duration: P.animateDuration,
                        easing: P.animateEase,
                        queue: !1,
                        step: d
                    });
                },
                getContentPositionX: function() {
                    return A();
                },
                getContentPositionY: function() {
                    return B();
                },
                getContentWidth: function() {
                    return U;
                },
                getContentHeight: function() {
                    return V;
                },
                getPercentScrolledX: function() {
                    return A() / (U - R);
                },
                getPercentScrolledY: function() {
                    return B() / (V - S);
                },
                getIsScrollableH: function() {
                    return Z;
                },
                getIsScrollableV: function() {
                    return Y;
                },
                getContentPane: function() {
                    return Q;
                },
                scrollToBottom: function(a) {
                    r(_, a);
                },
                hijackInternalLinks: a.noop,
                destroy: function() {
                    O();
                }
            }), f(e);
        }
        return d = a.extend({}, a.fn.jScrollPane.defaults, d), a.each([ "arrowButtonSpeed", "trackClickSpeed", "keyboardSpeed" ], function() {
            d[this] = d[this] || d.speed;
        }), this.each(function() {
            var b = a(this), c = b.data("jsp");
            c ? c.reinitialise(d) : (a("script", b).filter('[type="text/javascript"],:not([type])').remove(), 
            c = new e(b, d), b.data("jsp", c));
        });
    }, a.fn.jScrollPane.defaults = {
        showArrows: !1,
        maintainPosition: !0,
        stickToBottom: !1,
        stickToRight: !1,
        clickOnTrack: !0,
        autoReinitialise: !1,
        autoReinitialiseDelay: 500,
        verticalDragMinHeight: 0,
        verticalDragMaxHeight: 99999,
        horizontalDragMinWidth: 0,
        horizontalDragMaxWidth: 99999,
        contentWidth: c,
        animateScroll: !1,
        animateDuration: 300,
        animateEase: "linear",
        hijackInternalLinks: !1,
        verticalGutter: 4,
        horizontalGutter: 4,
        mouseWheelSpeed: 3,
        arrowButtonSpeed: 0,
        arrowRepeatFreq: 50,
        arrowScrollOnHover: !1,
        trackClickSpeed: 0,
        trackClickRepeatFreq: 70,
        verticalArrowPositions: "split",
        horizontalArrowPositions: "split",
        enableKeyboardNavigation: !0,
        hideFocus: !1,
        keyboardSpeed: 0,
        initialDelay: 300,
        speed: 30,
        scrollPagePercent: .8
    };
}(jQuery, this), function(e) {
    var t = {
        set: {
            colors: 1,
            values: 1,
            backgroundColor: 1,
            scaleColors: 1,
            normalizeFunction: 1,
            focus: 1
        },
        get: {
            selectedRegions: 1,
            selectedMarkers: 1,
            mapObject: 1,
            regionName: 1
        }
    };
    e.fn.vectorMap = function(e) {
        var n, r, n = this.children(".jvectormap-container").data("mapObject");
        if ("addMap" === e) jvm.WorldMap.maps[arguments[1]] = arguments[2]; else {
            if (("set" === e || "get" === e) && t[e][arguments[1]]) return r = arguments[1].charAt(0).toUpperCase() + arguments[1].substr(1), 
            n[e + r].apply(n, Array.prototype.slice.call(arguments, 2));
            e = e || {}, e.container = this, n = new jvm.WorldMap(e);
        }
        return this;
    };
}(jQuery), function(e) {
    function r(t) {
        var n = t || window.event, r = [].slice.call(arguments, 1), i = 0, o = 0, u = 0;
        return t = e.event.fix(n), t.type = "mousewheel", n.wheelDelta && (i = n.wheelDelta / 120), 
        n.detail && (i = -n.detail / 3), u = i, void 0 !== n.axis && n.axis === n.HORIZONTAL_AXIS && (u = 0, 
        o = -1 * i), void 0 !== n.wheelDeltaY && (u = n.wheelDeltaY / 120), void 0 !== n.wheelDeltaX && (o = -1 * n.wheelDeltaX / 120), 
        r.unshift(t, i, o, u), (e.event.dispatch || e.event.handle).apply(this, r);
    }
    var t = [ "DOMMouseScroll", "mousewheel" ];
    if (e.event.fixHooks) for (var n = t.length; n; ) e.event.fixHooks[t[--n]] = e.event.mouseHooks;
    e.event.special.mousewheel = {
        setup: function() {
            if (this.addEventListener) for (var e = t.length; e; ) this.addEventListener(t[--e], r, !1); else this.onmousewheel = r;
        },
        teardown: function() {
            if (this.removeEventListener) for (var e = t.length; e; ) this.removeEventListener(t[--e], r, !1); else this.onmousewheel = null;
        }
    }, e.fn.extend({
        mousewheel: function(e) {
            return e ? this.bind("mousewheel", e) : this.trigger("mousewheel");
        },
        unmousewheel: function(e) {
            return this.unbind("mousewheel", e);
        }
    });
}(jQuery);

var jvm = {
    inherits: function(e, t) {
        function n() {}
        n.prototype = t.prototype, e.prototype = new n(), e.prototype.constructor = e, e.parentClass = t;
    },
    mixin: function(e, t) {
        var n;
        for (n in t.prototype) t.prototype.hasOwnProperty(n) && (e.prototype[n] = t.prototype[n]);
    },
    min: function(e) {
        var n, t = Number.MAX_VALUE;
        if (e instanceof Array) for (n = 0; n < e.length; n++) e[n] < t && (t = e[n]); else for (n in e) e[n] < t && (t = e[n]);
        return t;
    },
    max: function(e) {
        var n, t = Number.MIN_VALUE;
        if (e instanceof Array) for (n = 0; n < e.length; n++) e[n] > t && (t = e[n]); else for (n in e) e[n] > t && (t = e[n]);
        return t;
    },
    keys: function(e) {
        var n, t = [];
        for (n in e) t.push(n);
        return t;
    },
    values: function(e) {
        var n, r, t = [];
        for (r = 0; r < arguments.length; r++) {
            e = arguments[r];
            for (n in e) t.push(e[n]);
        }
        return t;
    }
};

jvm.$ = jQuery, jvm.AbstractElement = function(e, t) {
    this.node = this.createElement(e), this.name = e, this.properties = {}, t && this.set(t);
}, jvm.AbstractElement.prototype.set = function(e, t) {
    var n;
    if ("object" == typeof e) for (n in e) this.properties[n] = e[n], this.applyAttr(n, e[n]); else this.properties[e] = t, 
    this.applyAttr(e, t);
}, jvm.AbstractElement.prototype.get = function(e) {
    return this.properties[e];
}, jvm.AbstractElement.prototype.applyAttr = function(e, t) {
    this.node.setAttribute(e, t);
}, jvm.AbstractElement.prototype.remove = function() {
    jvm.$(this.node).remove();
}, jvm.AbstractCanvasElement = function(e, t, n) {
    this.container = e, this.setSize(t, n), this.rootElement = new jvm[this.classPrefix + "GroupElement"](), 
    this.node.appendChild(this.rootElement.node), this.container.appendChild(this.node);
}, jvm.AbstractCanvasElement.prototype.add = function(e, t) {
    t = t || this.rootElement, t.add(e), e.canvas = this;
}, jvm.AbstractCanvasElement.prototype.addPath = function(e, t, n) {
    var r = new jvm[this.classPrefix + "PathElement"](e, t);
    return this.add(r, n), r;
}, jvm.AbstractCanvasElement.prototype.addCircle = function(e, t, n) {
    var r = new jvm[this.classPrefix + "CircleElement"](e, t);
    return this.add(r, n), r;
}, jvm.AbstractCanvasElement.prototype.addGroup = function(e) {
    var t = new jvm[this.classPrefix + "GroupElement"]();
    return e ? e.node.appendChild(t.node) : this.node.appendChild(t.node), t.canvas = this, 
    t;
}, jvm.AbstractShapeElement = function(e, t, n) {
    this.style = n || {}, this.style.current = {}, this.isHovered = !1, this.isSelected = !1, 
    this.updateStyle();
}, jvm.AbstractShapeElement.prototype.setHovered = function(e) {
    this.isHovered !== e && (this.isHovered = e, this.updateStyle());
}, jvm.AbstractShapeElement.prototype.setSelected = function(e) {
    this.isSelected !== e && (this.isSelected = e, this.updateStyle(), jvm.$(this.node).trigger("selected", [ e ]));
}, jvm.AbstractShapeElement.prototype.setStyle = function(e, t) {
    var n = {};
    "object" == typeof e ? n = e : n[e] = t, jvm.$.extend(this.style.current, n), this.updateStyle();
}, jvm.AbstractShapeElement.prototype.updateStyle = function() {
    var e = {};
    jvm.AbstractShapeElement.mergeStyles(e, this.style.initial), jvm.AbstractShapeElement.mergeStyles(e, this.style.current), 
    this.isHovered && jvm.AbstractShapeElement.mergeStyles(e, this.style.hover), this.isSelected && (jvm.AbstractShapeElement.mergeStyles(e, this.style.selected), 
    this.isHovered && jvm.AbstractShapeElement.mergeStyles(e, this.style.selectedHover)), 
    this.set(e);
}, jvm.AbstractShapeElement.mergeStyles = function(e, t) {
    var n;
    t = t || {};
    for (n in t) null === t[n] ? delete e[n] : e[n] = t[n];
}, jvm.SVGElement = function() {
    jvm.SVGElement.parentClass.apply(this, arguments);
}, jvm.inherits(jvm.SVGElement, jvm.AbstractElement), jvm.SVGElement.svgns = "http://www.w3.org/2000/svg", 
jvm.SVGElement.prototype.createElement = function(e) {
    return document.createElementNS(jvm.SVGElement.svgns, e);
}, jvm.SVGElement.prototype.addClass = function(e) {
    this.node.setAttribute("class", e);
}, jvm.SVGElement.prototype.getElementCtr = function(e) {
    return jvm["SVG" + e];
}, jvm.SVGElement.prototype.getBBox = function() {
    return this.node.getBBox();
}, jvm.SVGGroupElement = function() {
    jvm.SVGGroupElement.parentClass.call(this, "g");
}, jvm.inherits(jvm.SVGGroupElement, jvm.SVGElement), jvm.SVGGroupElement.prototype.add = function(e) {
    this.node.appendChild(e.node);
}, jvm.SVGCanvasElement = function() {
    this.classPrefix = "SVG", jvm.SVGCanvasElement.parentClass.call(this, "svg"), jvm.AbstractCanvasElement.apply(this, arguments);
}, jvm.inherits(jvm.SVGCanvasElement, jvm.SVGElement), jvm.mixin(jvm.SVGCanvasElement, jvm.AbstractCanvasElement), 
jvm.SVGCanvasElement.prototype.setSize = function(e, t) {
    this.width = e, this.height = t, this.node.setAttribute("width", e), this.node.setAttribute("height", t);
}, jvm.SVGCanvasElement.prototype.applyTransformParams = function(e, t, n) {
    this.scale = e, this.transX = t, this.transY = n, this.rootElement.node.setAttribute("transform", "scale(" + e + ") translate(" + t + ", " + n + ")");
}, jvm.SVGShapeElement = function(e, t) {
    jvm.SVGShapeElement.parentClass.call(this, e, t), jvm.AbstractShapeElement.apply(this, arguments);
}, jvm.inherits(jvm.SVGShapeElement, jvm.SVGElement), jvm.mixin(jvm.SVGShapeElement, jvm.AbstractShapeElement), 
jvm.SVGPathElement = function(e, t) {
    jvm.SVGPathElement.parentClass.call(this, "path", e, t), this.node.setAttribute("fill-rule", "evenodd");
}, jvm.inherits(jvm.SVGPathElement, jvm.SVGShapeElement), jvm.SVGCircleElement = function(e, t) {
    jvm.SVGCircleElement.parentClass.call(this, "circle", e, t);
}, jvm.inherits(jvm.SVGCircleElement, jvm.SVGShapeElement), jvm.VMLElement = function() {
    jvm.VMLElement.VMLInitialized || jvm.VMLElement.initializeVML(), jvm.VMLElement.parentClass.apply(this, arguments);
}, jvm.inherits(jvm.VMLElement, jvm.AbstractElement), jvm.VMLElement.VMLInitialized = !1, 
jvm.VMLElement.initializeVML = function() {
    try {
        document.namespaces.rvml || document.namespaces.add("rvml", "urn:schemas-microsoft-com:vml"), 
        jvm.VMLElement.prototype.createElement = function(e) {
            return document.createElement("<rvml:" + e + ' class="rvml">');
        };
    } catch (e) {
        jvm.VMLElement.prototype.createElement = function(e) {
            return document.createElement("<" + e + ' xmlns="urn:schemas-microsoft.com:vml" class="rvml">');
        };
    }
    document.createStyleSheet().addRule(".rvml", "behavior:url(#default#VML)"), jvm.VMLElement.VMLInitialized = !0;
}, jvm.VMLElement.prototype.getElementCtr = function(e) {
    return jvm["VML" + e];
}, jvm.VMLElement.prototype.addClass = function(e) {
    jvm.$(this.node).addClass(e);
}, jvm.VMLElement.prototype.applyAttr = function(e, t) {
    this.node[e] = t;
}, jvm.VMLElement.prototype.getBBox = function() {
    var e = jvm.$(this.node);
    return {
        x: e.position().left / this.canvas.scale,
        y: e.position().top / this.canvas.scale,
        width: e.width() / this.canvas.scale,
        height: e.height() / this.canvas.scale
    };
}, jvm.VMLGroupElement = function() {
    jvm.VMLGroupElement.parentClass.call(this, "group"), this.node.style.left = "0px", 
    this.node.style.top = "0px", this.node.coordorigin = "0 0";
}, jvm.inherits(jvm.VMLGroupElement, jvm.VMLElement), jvm.VMLGroupElement.prototype.add = function(e) {
    this.node.appendChild(e.node);
}, jvm.VMLCanvasElement = function() {
    this.classPrefix = "VML", jvm.VMLCanvasElement.parentClass.call(this, "group"), 
    jvm.AbstractCanvasElement.apply(this, arguments), this.node.style.position = "absolute";
}, jvm.inherits(jvm.VMLCanvasElement, jvm.VMLElement), jvm.mixin(jvm.VMLCanvasElement, jvm.AbstractCanvasElement), 
jvm.VMLCanvasElement.prototype.setSize = function(e, t) {
    var n, r, i, s;
    if (this.width = e, this.height = t, this.node.style.width = e + "px", this.node.style.height = t + "px", 
    this.node.coordsize = e + " " + t, this.node.coordorigin = "0 0", this.rootElement) {
        for (n = this.rootElement.node.getElementsByTagName("shape"), i = 0, s = n.length; s > i; i++) n[i].coordsize = e + " " + t, 
        n[i].style.width = e + "px", n[i].style.height = t + "px";
        for (r = this.node.getElementsByTagName("group"), i = 0, s = r.length; s > i; i++) r[i].coordsize = e + " " + t, 
        r[i].style.width = e + "px", r[i].style.height = t + "px";
    }
}, jvm.VMLCanvasElement.prototype.applyTransformParams = function(e, t, n) {
    this.scale = e, this.transX = t, this.transY = n, this.rootElement.node.coordorigin = this.width - t - this.width / 100 + "," + (this.height - n - this.height / 100), 
    this.rootElement.node.coordsize = this.width / e + "," + this.height / e;
}, jvm.VMLShapeElement = function(e, t) {
    jvm.VMLShapeElement.parentClass.call(this, e, t), this.fillElement = new jvm.VMLElement("fill"), 
    this.strokeElement = new jvm.VMLElement("stroke"), this.node.appendChild(this.fillElement.node), 
    this.node.appendChild(this.strokeElement.node), this.node.stroked = !1, jvm.AbstractShapeElement.apply(this, arguments);
}, jvm.inherits(jvm.VMLShapeElement, jvm.VMLElement), jvm.mixin(jvm.VMLShapeElement, jvm.AbstractShapeElement), 
jvm.VMLShapeElement.prototype.applyAttr = function(e, t) {
    switch (e) {
      case "fill":
        this.node.fillcolor = t;
        break;

      case "fill-opacity":
        this.fillElement.node.opacity = Math.round(100 * t) + "%";
        break;

      case "stroke":
        this.node.stroked = "none" === t ? !1 : !0, this.node.strokecolor = t;
        break;

      case "stroke-opacity":
        this.strokeElement.node.opacity = Math.round(100 * t) + "%";
        break;

      case "stroke-width":
        this.node.stroked = 0 === parseInt(t, 10) ? !1 : !0, this.node.strokeweight = t;
        break;

      case "d":
        this.node.path = jvm.VMLPathElement.pathSvgToVml(t);
        break;

      default:
        jvm.VMLShapeElement.parentClass.prototype.applyAttr.apply(this, arguments);
    }
}, jvm.VMLPathElement = function(e, t) {
    var n = new jvm.VMLElement("skew");
    jvm.VMLPathElement.parentClass.call(this, "shape", e, t), this.node.coordorigin = "0 0", 
    n.node.on = !0, n.node.matrix = "0.01,0,0,0.01,0,0", n.node.offset = "0,0", this.node.appendChild(n.node);
}, jvm.inherits(jvm.VMLPathElement, jvm.VMLShapeElement), jvm.VMLPathElement.prototype.applyAttr = function(e, t) {
    "d" === e ? this.node.path = jvm.VMLPathElement.pathSvgToVml(t) : jvm.VMLShapeElement.prototype.applyAttr.call(this, e, t);
}, jvm.VMLPathElement.pathSvgToVml = function(e) {
    var i, s, n = 0, r = 0;
    return e = e.replace(/(-?\d+)e(-?\d+)/g, "0"), e.replace(/([MmLlHhVvCcSs])\s*((?:-?\d*(?:\.\d+)?\s*,?\s*)+)/g, function(e, t, o) {
        o = o.replace(/(\d)-/g, "$1,-").replace(/^\s+/g, "").replace(/\s+$/g, "").replace(/\s+/g, ",").split(","), 
        o[0] || o.shift();
        for (var a = 0, f = o.length; f > a; a++) o[a] = Math.round(100 * o[a]);
        switch (t) {
          case "m":
            return n += o[0], r += o[1], "t" + o.join(",");

          case "M":
            return n = o[0], r = o[1], "m" + o.join(",");

          case "l":
            return n += o[0], r += o[1], "r" + o.join(",");

          case "L":
            return n = o[0], r = o[1], "l" + o.join(",");

          case "h":
            return n += o[0], "r" + o[0] + ",0";

          case "H":
            return n = o[0], "l" + n + "," + r;

          case "v":
            return r += o[0], "r0," + o[0];

          case "V":
            return r = o[0], "l" + n + "," + r;

          case "c":
            return i = n + o[o.length - 4], s = r + o[o.length - 3], n += o[o.length - 2], r += o[o.length - 1], 
            "v" + o.join(",");

          case "C":
            return i = o[o.length - 4], s = o[o.length - 3], n = o[o.length - 2], r = o[o.length - 1], 
            "c" + o.join(",");

          case "s":
            return o.unshift(r - s), o.unshift(n - i), i = n + o[o.length - 4], s = r + o[o.length - 3], 
            n += o[o.length - 2], r += o[o.length - 1], "v" + o.join(",");

          case "S":
            return o.unshift(r + r - s), o.unshift(n + n - i), i = o[o.length - 4], s = o[o.length - 3], 
            n = o[o.length - 2], r = o[o.length - 1], "c" + o.join(",");
        }
        return "";
    }).replace(/z/g, "e");
}, jvm.VMLCircleElement = function(e, t) {
    jvm.VMLCircleElement.parentClass.call(this, "oval", e, t);
}, jvm.inherits(jvm.VMLCircleElement, jvm.VMLShapeElement), jvm.VMLCircleElement.prototype.applyAttr = function(e, t) {
    switch (e) {
      case "r":
        this.node.style.width = 2 * t + "px", this.node.style.height = 2 * t + "px", this.applyAttr("cx", this.get("cx") || 0), 
        this.applyAttr("cy", this.get("cy") || 0);
        break;

      case "cx":
        if (!t) return;
        this.node.style.left = t - (this.get("r") || 0) + "px";
        break;

      case "cy":
        if (!t) return;
        this.node.style.top = t - (this.get("r") || 0) + "px";
        break;

      default:
        jvm.VMLCircleElement.parentClass.prototype.applyAttr.call(this, e, t);
    }
}, jvm.VectorCanvas = function(e, t, n) {
    return this.mode = window.SVGAngle ? "svg" : "vml", this.impl = "svg" == this.mode ? new jvm.SVGCanvasElement(e, t, n) : new jvm.VMLCanvasElement(e, t, n), 
    this.impl;
}, jvm.SimpleScale = function(e) {
    this.scale = e;
}, jvm.SimpleScale.prototype.getValue = function(e) {
    return e;
}, jvm.OrdinalScale = function(e) {
    this.scale = e;
}, jvm.OrdinalScale.prototype.getValue = function(e) {
    return this.scale[e];
}, jvm.NumericScale = function(e, t, n, r) {
    this.scale = [], t = t || "linear", e && this.setScale(e), t && this.setNormalizeFunction(t), 
    n && this.setMin(n), r && this.setMax(r);
}, jvm.NumericScale.prototype = {
    setMin: function(e) {
        this.clearMinValue = e, this.minValue = "function" == typeof this.normalize ? this.normalize(e) : e;
    },
    setMax: function(e) {
        this.clearMaxValue = e, this.maxValue = "function" == typeof this.normalize ? this.normalize(e) : e;
    },
    setScale: function(e) {
        var t;
        for (t = 0; t < e.length; t++) this.scale[t] = [ e[t] ];
    },
    setNormalizeFunction: function(e) {
        "polynomial" === e ? this.normalize = function(e) {
            return Math.pow(e, .2);
        } : "linear" === e ? delete this.normalize : this.normalize = e, this.setMin(this.clearMinValue), 
        this.setMax(this.clearMaxValue);
    },
    getValue: function(e) {
        var r, s, t = [], n = 0, i = 0;
        for ("function" == typeof this.normalize && (e = this.normalize(e)), i = 0; i < this.scale.length - 1; i++) r = this.vectorLength(this.vectorSubtract(this.scale[i + 1], this.scale[i])), 
        t.push(r), n += r;
        for (s = (this.maxValue - this.minValue) / n, i = 0; i < t.length; i++) t[i] *= s;
        for (i = 0, e -= this.minValue; e - t[i] >= 0; ) e -= t[i], i++;
        return e = this.vectorToNum(i == this.scale.length - 1 ? this.scale[i] : this.vectorAdd(this.scale[i], this.vectorMult(this.vectorSubtract(this.scale[i + 1], this.scale[i]), e / t[i])));
    },
    vectorToNum: function(e) {
        var n, t = 0;
        for (n = 0; n < e.length; n++) t += Math.round(e[n]) * Math.pow(256, e.length - n - 1);
        return t;
    },
    vectorSubtract: function(e, t) {
        var r, n = [];
        for (r = 0; r < e.length; r++) n[r] = e[r] - t[r];
        return n;
    },
    vectorAdd: function(e, t) {
        var r, n = [];
        for (r = 0; r < e.length; r++) n[r] = e[r] + t[r];
        return n;
    },
    vectorMult: function(e, t) {
        var r, n = [];
        for (r = 0; r < e.length; r++) n[r] = e[r] * t;
        return n;
    },
    vectorLength: function(e) {
        var n, t = 0;
        for (n = 0; n < e.length; n++) t += e[n] * e[n];
        return Math.sqrt(t);
    }
}, jvm.ColorScale = function() {
    jvm.ColorScale.parentClass.apply(this, arguments);
}, jvm.inherits(jvm.ColorScale, jvm.NumericScale), jvm.ColorScale.prototype.setScale = function(e) {
    var t;
    for (t = 0; t < e.length; t++) this.scale[t] = jvm.ColorScale.rgbToArray(e[t]);
}, jvm.ColorScale.prototype.getValue = function(e) {
    return jvm.ColorScale.numToRgb(jvm.ColorScale.parentClass.prototype.getValue.call(this, e));
}, jvm.ColorScale.arrayToRgb = function(e) {
    var n, r, t = "#";
    for (r = 0; r < e.length; r++) n = e[r].toString(16), t += 1 == n.length ? "0" + n : n;
    return t;
}, jvm.ColorScale.numToRgb = function(e) {
    for (e = e.toString(16); e.length < 6; ) e = "0" + e;
    return "#" + e;
}, jvm.ColorScale.rgbToArray = function(e) {
    return e = e.substr(1), [ parseInt(e.substr(0, 2), 16), parseInt(e.substr(2, 2), 16), parseInt(e.substr(4, 2), 16) ];
}, jvm.DataSeries = function(e, t) {
    var n;
    e = e || {}, e.attribute = e.attribute || "fill", this.elements = t, this.params = e, 
    e.attributes && this.setAttributes(e.attributes), jvm.$.isArray(e.scale) ? (n = "fill" === e.attribute || "stroke" === e.attribute ? jvm.ColorScale : jvm.NumericScale, 
    this.scale = new n(e.scale, e.normalizeFunction, e.min, e.max)) : this.scale = e.scale ? new jvm.OrdinalScale(e.scale) : new jvm.SimpleScale(e.scale), 
    this.values = e.values || {}, this.setValues(this.values);
}, jvm.DataSeries.prototype = {
    setAttributes: function(e, t) {
        var r, n = e;
        if ("string" == typeof e) this.elements[e] && this.elements[e].setStyle(this.params.attribute, t); else for (r in n) this.elements[r] && this.elements[r].element.setStyle(this.params.attribute, n[r]);
    },
    setValues: function(e) {
        var r, i, t = Number.MIN_VALUE, n = Number.MAX_VALUE, s = {};
        if (this.scale instanceof jvm.OrdinalScale || this.scale instanceof jvm.SimpleScale) for (i in e) s[i] = e[i] ? this.scale.getValue(e[i]) : this.elements[i].element.style.initial[this.params.attribute]; else {
            if (!this.params.min || !this.params.max) {
                for (i in e) r = parseFloat(e[i]), r > t && (t = e[i]), n > r && (n = r);
                this.params.min || this.scale.setMin(n), this.params.max || this.scale.setMax(t), 
                this.params.min = n, this.params.max = t;
            }
            for (i in e) r = parseFloat(e[i]), s[i] = isNaN(r) ? this.elements[i].element.style.initial[this.params.attribute] : this.scale.getValue(r);
        }
        this.setAttributes(s), jvm.$.extend(this.values, e);
    },
    clear: function() {
        var e, t = {};
        for (e in this.values) this.elements[e] && (t[e] = this.elements[e].element.style.initial[this.params.attribute]);
        this.setAttributes(t), this.values = {};
    },
    setScale: function(e) {
        this.scale.setScale(e), this.values && this.setValues(this.values);
    },
    setNormalizeFunction: function(e) {
        this.scale.setNormalizeFunction(e), this.values && this.setValues(this.values);
    }
}, jvm.Proj = {
    degRad: 180 / Math.PI,
    radDeg: Math.PI / 180,
    radius: 6381372,
    sgn: function(e) {
        return e > 0 ? 1 : 0 > e ? -1 : e;
    },
    mill: function(e, t, n) {
        return {
            x: this.radius * (t - n) * this.radDeg,
            y: -this.radius * Math.log(Math.tan((45 + .4 * e) * this.radDeg)) / .8
        };
    },
    mill_inv: function(e, t, n) {
        return {
            lat: (2.5 * Math.atan(Math.exp(.8 * t / this.radius)) - 5 * Math.PI / 8) * this.degRad,
            lng: (n * this.radDeg + e / this.radius) * this.degRad
        };
    },
    merc: function(e, t, n) {
        return {
            x: this.radius * (t - n) * this.radDeg,
            y: -this.radius * Math.log(Math.tan(Math.PI / 4 + e * Math.PI / 360))
        };
    },
    merc_inv: function(e, t, n) {
        return {
            lat: (2 * Math.atan(Math.exp(t / this.radius)) - Math.PI / 2) * this.degRad,
            lng: (n * this.radDeg + e / this.radius) * this.degRad
        };
    },
    aea: function(e, t, n) {
        var r = 0, i = n * this.radDeg, s = 29.5 * this.radDeg, o = 45.5 * this.radDeg, u = e * this.radDeg, a = t * this.radDeg, f = (Math.sin(s) + Math.sin(o)) / 2, l = Math.cos(s) * Math.cos(s) + 2 * f * Math.sin(s), c = f * (a - i), h = Math.sqrt(l - 2 * f * Math.sin(u)) / f, p = Math.sqrt(l - 2 * f * Math.sin(r)) / f;
        return {
            x: h * Math.sin(c) * this.radius,
            y: -(p - h * Math.cos(c)) * this.radius
        };
    },
    aea_inv: function(e, t, n) {
        var r = e / this.radius, i = t / this.radius, s = 0, o = n * this.radDeg, u = 29.5 * this.radDeg, a = 45.5 * this.radDeg, f = (Math.sin(u) + Math.sin(a)) / 2, l = Math.cos(u) * Math.cos(u) + 2 * f * Math.sin(u), c = Math.sqrt(l - 2 * f * Math.sin(s)) / f, h = Math.sqrt(r * r + (c - i) * (c - i)), p = Math.atan(r / (c - i));
        return {
            lat: Math.asin((l - h * h * f * f) / (2 * f)) * this.degRad,
            lng: (o + p / f) * this.degRad
        };
    },
    lcc: function(e, t, n) {
        var r = 0, i = n * this.radDeg, s = t * this.radDeg, o = 33 * this.radDeg, u = 45 * this.radDeg, a = e * this.radDeg, f = Math.log(Math.cos(o) * (1 / Math.cos(u))) / Math.log(Math.tan(Math.PI / 4 + u / 2) * (1 / Math.tan(Math.PI / 4 + o / 2))), l = Math.cos(o) * Math.pow(Math.tan(Math.PI / 4 + o / 2), f) / f, c = l * Math.pow(1 / Math.tan(Math.PI / 4 + a / 2), f), h = l * Math.pow(1 / Math.tan(Math.PI / 4 + r / 2), f);
        return {
            x: c * Math.sin(f * (s - i)) * this.radius,
            y: -(h - c * Math.cos(f * (s - i))) * this.radius
        };
    },
    lcc_inv: function(e, t, n) {
        var r = e / this.radius, i = t / this.radius, s = 0, o = n * this.radDeg, u = 33 * this.radDeg, a = 45 * this.radDeg, f = Math.log(Math.cos(u) * (1 / Math.cos(a))) / Math.log(Math.tan(Math.PI / 4 + a / 2) * (1 / Math.tan(Math.PI / 4 + u / 2))), l = Math.cos(u) * Math.pow(Math.tan(Math.PI / 4 + u / 2), f) / f, c = l * Math.pow(1 / Math.tan(Math.PI / 4 + s / 2), f), h = this.sgn(f) * Math.sqrt(r * r + (c - i) * (c - i)), p = Math.atan(r / (c - i));
        return {
            lat: (2 * Math.atan(Math.pow(l / h, 1 / f)) - Math.PI / 2) * this.degRad,
            lng: (o + p / f) * this.degRad
        };
    }
}, jvm.WorldMap = function(e) {
    var n, t = this;
    if (this.params = jvm.$.extend(!0, {}, jvm.WorldMap.defaultParams, e), !jvm.WorldMap.maps[this.params.map]) throw new Error("Attempt to use map which was not loaded: " + this.params.map);
    this.mapData = jvm.WorldMap.maps[this.params.map], this.markers = {}, this.regions = {}, 
    this.regionsColors = {}, this.regionsData = {}, this.container = jvm.$("<div>").css({
        width: "100%",
        height: "100%"
    }).addClass("jvectormap-container"), this.params.container.append(this.container), 
    this.container.data("mapObject", this), this.container.css({
        position: "relative",
        overflow: "hidden"
    }), this.defaultWidth = this.mapData.width, this.defaultHeight = this.mapData.height, 
    this.setBackgroundColor(this.params.backgroundColor), this.onResize = function() {
        t.setSize();
    }, jvm.$(window).resize(this.onResize);
    for (n in jvm.WorldMap.apiEvents) this.params[n] && this.container.bind(jvm.WorldMap.apiEvents[n] + ".jvectormap", this.params[n]);
    this.canvas = new jvm.VectorCanvas(this.container[0], this.width, this.height), 
    "ontouchstart" in window || window.DocumentTouch && document instanceof DocumentTouch ? this.params.bindTouchEvents && this.bindContainerTouchEvents() : this.bindContainerEvents(), 
    this.bindElementEvents(), this.createLabel(), this.params.zoomButtons && this.bindZoomButtons(), 
    this.createRegions(), this.createMarkers(this.params.markers || {}), this.setSize(), 
    this.params.focusOn && ("object" == typeof this.params.focusOn ? this.setFocus.call(this, this.params.focusOn.scale, this.params.focusOn.x, this.params.focusOn.y) : this.setFocus.call(this, this.params.focusOn)), 
    this.params.selectedRegions && this.setSelectedRegions(this.params.selectedRegions), 
    this.params.selectedMarkers && this.setSelectedMarkers(this.params.selectedMarkers), 
    this.params.series && this.createSeries();
}, jvm.WorldMap.prototype = {
    transX: 0,
    transY: 0,
    scale: 1,
    baseTransX: 0,
    baseTransY: 0,
    baseScale: 1,
    width: 0,
    height: 0,
    setBackgroundColor: function(e) {
        this.container.css("background-color", e);
    },
    resize: function() {
        var e = this.baseScale;
        this.width / this.height > this.defaultWidth / this.defaultHeight ? (this.baseScale = this.height / this.defaultHeight, 
        this.baseTransX = Math.abs(this.width - this.defaultWidth * this.baseScale) / (2 * this.baseScale)) : (this.baseScale = this.width / this.defaultWidth, 
        this.baseTransY = Math.abs(this.height - this.defaultHeight * this.baseScale) / (2 * this.baseScale)), 
        this.scale *= this.baseScale / e, this.transX *= this.baseScale / e, this.transY *= this.baseScale / e;
    },
    setSize: function() {
        this.width = this.container.width(), this.height = this.container.height(), this.resize(), 
        this.canvas.setSize(this.width, this.height), this.applyTransform();
    },
    reset: function() {
        var e, t;
        for (e in this.series) for (t = 0; t < this.series[e].length; t++) this.series[e][t].clear();
        this.scale = this.baseScale, this.transX = this.baseTransX, this.transY = this.baseTransY, 
        this.applyTransform();
    },
    applyTransform: function() {
        var e, t, n, r;
        this.defaultWidth * this.scale <= this.width ? (e = (this.width - this.defaultWidth * this.scale) / (2 * this.scale), 
        n = (this.width - this.defaultWidth * this.scale) / (2 * this.scale)) : (e = 0, 
        n = (this.width - this.defaultWidth * this.scale) / this.scale), this.defaultHeight * this.scale <= this.height ? (t = (this.height - this.defaultHeight * this.scale) / (2 * this.scale), 
        r = (this.height - this.defaultHeight * this.scale) / (2 * this.scale)) : (t = 0, 
        r = (this.height - this.defaultHeight * this.scale) / this.scale), this.transY > t ? this.transY = t : this.transY < r && (this.transY = r), 
        this.transX > e ? this.transX = e : this.transX < n && (this.transX = n), this.canvas.applyTransformParams(this.scale, this.transX, this.transY), 
        this.markers && this.repositionMarkers(), this.container.trigger("viewportChange", [ this.scale / this.baseScale, this.transX, this.transY ]);
    },
    bindContainerEvents: function() {
        var t, n, e = !1, r = this;
        this.container.mousemove(function(i) {
            return e && (r.transX -= (t - i.pageX) / r.scale, r.transY -= (n - i.pageY) / r.scale, 
            r.applyTransform(), t = i.pageX, n = i.pageY), !1;
        }).mousedown(function(r) {
            return e = !0, t = r.pageX, n = r.pageY, !1;
        }), jvm.$("body").mouseup(function() {
            e = !1;
        }), this.params.zoomOnScroll && this.container.mousewheel(function(e, t, n, i) {
            var s = jvm.$(r.container).offset(), o = e.pageX - s.left, u = e.pageY - s.top, a = Math.pow(1.3, i);
            r.label.hide(), r.setScale(r.scale * a, o, u), e.preventDefault();
        });
    },
    bindContainerTouchEvents: function() {
        var e, t, r, i, s, o, u, n = this, a = function(a) {
            var l, c, h, p, f = a.originalEvent.touches;
            "touchstart" == a.type && (u = 0), 1 == f.length ? (1 == u && (h = n.transX, p = n.transY, 
            n.transX -= (r - f[0].pageX) / n.scale, n.transY -= (i - f[0].pageY) / n.scale, 
            n.applyTransform(), n.label.hide(), (h != n.transX || p != n.transY) && a.preventDefault()), 
            r = f[0].pageX, i = f[0].pageY) : 2 == f.length && (2 == u ? (c = Math.sqrt(Math.pow(f[0].pageX - f[1].pageX, 2) + Math.pow(f[0].pageY - f[1].pageY, 2)) / t, 
            n.setScale(e * c, s, o), n.label.hide(), a.preventDefault()) : (l = jvm.$(n.container).offset(), 
            s = f[0].pageX > f[1].pageX ? f[1].pageX + (f[0].pageX - f[1].pageX) / 2 : f[0].pageX + (f[1].pageX - f[0].pageX) / 2, 
            o = f[0].pageY > f[1].pageY ? f[1].pageY + (f[0].pageY - f[1].pageY) / 2 : f[0].pageY + (f[1].pageY - f[0].pageY) / 2, 
            s -= l.left, o -= l.top, e = n.scale, t = Math.sqrt(Math.pow(f[0].pageX - f[1].pageX, 2) + Math.pow(f[0].pageY - f[1].pageY, 2)))), 
            u = f.length;
        };
        jvm.$(this.container).bind("touchstart", a), jvm.$(this.container).bind("touchmove", a);
    },
    bindElementEvents: function() {
        var t, e = this;
        this.container.mousemove(function() {
            t = !0;
        }), this.container.delegate("[class~='jvectormap-element']", "mouseover mouseout", function(t) {
            var r = jvm.$(this).attr("class").baseVal ? jvm.$(this).attr("class").baseVal : jvm.$(this).attr("class"), i = -1 === r.indexOf("jvectormap-region") ? "marker" : "region", s = jvm.$(this).attr("region" == i ? "data-code" : "data-index"), o = "region" == i ? e.regions[s].element : e.markers[s].element, u = "region" == i ? e.mapData.paths[s].name : e.markers[s].config.name || "", a = jvm.$.Event(i + "LabelShow.jvectormap"), f = jvm.$.Event(i + "Over.jvectormap");
            "mouseover" == t.type ? (e.container.trigger(f, [ s ]), f.isDefaultPrevented() || o.setHovered(!0), 
            e.label.text(u), e.container.trigger(a, [ e.label, s ]), a.isDefaultPrevented() || (e.label.show(), 
            e.labelWidth = e.label.width(), e.labelHeight = e.label.height())) : (o.setHovered(!1), 
            e.label.hide(), e.container.trigger(i + "Out.jvectormap", [ s ]));
        }), this.container.delegate("[class~='jvectormap-element']", "mousedown", function() {
            t = !1;
        }), this.container.delegate("[class~='jvectormap-element']", "mouseup", function() {
            var i = jvm.$(this).attr("class").baseVal ? jvm.$(this).attr("class").baseVal : jvm.$(this).attr("class"), s = -1 === i.indexOf("jvectormap-region") ? "marker" : "region", o = jvm.$(this).attr("region" == s ? "data-code" : "data-index"), u = jvm.$.Event(s + "Click.jvectormap"), a = "region" == s ? e.regions[o].element : e.markers[o].element;
            t || (e.container.trigger(u, [ o ]), ("region" === s && e.params.regionsSelectable || "marker" === s && e.params.markersSelectable) && (u.isDefaultPrevented() || (e.params[s + "sSelectableOne"] && e.clearSelected(s + "s"), 
            a.setSelected(!a.isSelected))));
        });
    },
    bindZoomButtons: function() {
        var e = this;
        jvm.$("<div/>").addClass("jvectormap-zoomin").text("+").appendTo(this.container), 
        jvm.$("<div/>").addClass("jvectormap-zoomout").html("&#x2212;").appendTo(this.container), 
        this.container.find(".jvectormap-zoomin").click(function() {
            e.setScale(e.scale * e.params.zoomStep, e.width / 2, e.height / 2);
        }), this.container.find(".jvectormap-zoomout").click(function() {
            e.setScale(e.scale / e.params.zoomStep, e.width / 2, e.height / 2);
        });
    },
    createLabel: function() {
        var e = this;
        this.label = jvm.$("<div/>").addClass("jvectormap-label").appendTo(jvm.$("body")), 
        this.container.mousemove(function(t) {
            var n = t.pageX - 15 - e.labelWidth, r = t.pageY - 15 - e.labelHeight;
            5 > n && (n = t.pageX + 15), 5 > r && (r = t.pageY + 15), e.label.is(":visible") && e.label.css({
                left: n,
                top: r
            });
        });
    },
    setScale: function(e, t, n, r) {
        var i, s = jvm.$.Event("zoom.jvectormap");
        e > this.params.zoomMax * this.baseScale ? e = this.params.zoomMax * this.baseScale : e < this.params.zoomMin * this.baseScale && (e = this.params.zoomMin * this.baseScale), 
        "undefined" != typeof t && "undefined" != typeof n && (i = e / this.scale, r ? (this.transX = t + this.defaultWidth * (this.width / (this.defaultWidth * e)) / 2, 
        this.transY = n + this.defaultHeight * (this.height / (this.defaultHeight * e)) / 2) : (this.transX -= (i - 1) / e * t, 
        this.transY -= (i - 1) / e * n)), this.scale = e, this.applyTransform(), this.container.trigger(s, [ e / this.baseScale ]);
    },
    setFocus: function(e, t, n) {
        var r, i, s, o, u;
        if (jvm.$.isArray(e) || this.regions[e]) {
            for (o = jvm.$.isArray(e) ? e : [ e ], u = 0; u < o.length; u++) this.regions[o[u]] && (i = this.regions[o[u]].element.getBBox(), 
            i && ("undefined" == typeof r ? r = i : (s = {
                x: Math.min(r.x, i.x),
                y: Math.min(r.y, i.y),
                width: Math.max(r.x + r.width, i.x + i.width) - Math.min(r.x, i.x),
                height: Math.max(r.y + r.height, i.y + i.height) - Math.min(r.y, i.y)
            }, r = s)));
            this.setScale(Math.min(this.width / r.width, this.height / r.height), -(r.x + r.width / 2), -(r.y + r.height / 2), !0);
        } else e *= this.baseScale, this.setScale(e, -t * this.defaultWidth, -n * this.defaultHeight, !0);
    },
    getSelected: function(e) {
        var t, n = [];
        for (t in this[e]) this[e][t].element.isSelected && n.push(t);
        return n;
    },
    getSelectedRegions: function() {
        return this.getSelected("regions");
    },
    getSelectedMarkers: function() {
        return this.getSelected("markers");
    },
    setSelected: function(e, t) {
        var n;
        if ("object" != typeof t && (t = [ t ]), jvm.$.isArray(t)) for (n = 0; n < t.length; n++) this[e][t[n]].element.setSelected(!0); else for (n in t) this[e][n].element.setSelected(!!t[n]);
    },
    setSelectedRegions: function(e) {
        this.setSelected("regions", e);
    },
    setSelectedMarkers: function(e) {
        this.setSelected("markers", e);
    },
    clearSelected: function(e) {
        var r, t = {}, n = this.getSelected(e);
        for (r = 0; r < n.length; r++) t[n[r]] = !1;
        this.setSelected(e, t);
    },
    clearSelectedRegions: function() {
        this.clearSelected("regions");
    },
    clearSelectedMarkers: function() {
        this.clearSelected("markers");
    },
    getMapObject: function() {
        return this;
    },
    getRegionName: function(e) {
        return this.mapData.paths[e].name;
    },
    createRegions: function() {
        var e, t, n = this;
        for (e in this.mapData.paths) t = this.canvas.addPath({
            d: this.mapData.paths[e].path,
            "data-code": e
        }, jvm.$.extend(!0, {}, this.params.regionStyle)), jvm.$(t.node).bind("selected", function(e, t) {
            n.container.trigger("regionSelected.jvectormap", [ jvm.$(this).attr("data-code"), t, n.getSelectedRegions() ]);
        }), t.addClass("jvectormap-region jvectormap-element"), this.regions[e] = {
            element: t,
            config: this.mapData.paths[e]
        };
    },
    createMarkers: function(e) {
        var t, n, r, i, s, o = this;
        if (this.markersGroup = this.markersGroup || this.canvas.addGroup(), jvm.$.isArray(e)) for (s = e.slice(), 
        e = {}, t = 0; t < s.length; t++) e[t] = s[t];
        for (t in e) i = e[t] instanceof Array ? {
            latLng: e[t]
        } : e[t], r = this.getMarkerPosition(i), r !== !1 && (n = this.canvas.addCircle({
            "data-index": t,
            cx: r.x,
            cy: r.y
        }, jvm.$.extend(!0, {}, this.params.markerStyle, {
            initial: i.style || {}
        }), this.markersGroup), n.addClass("jvectormap-marker jvectormap-element"), jvm.$(n.node).bind("selected", function(e, t) {
            o.container.trigger("markerSelected.jvectormap", [ jvm.$(this).attr("data-index"), t, o.getSelectedMarkers() ]);
        }), this.markers[t] && this.removeMarkers([ t ]), this.markers[t] = {
            element: n,
            config: i
        });
    },
    repositionMarkers: function() {
        var e, t;
        for (e in this.markers) t = this.getMarkerPosition(this.markers[e].config), t !== !1 && this.markers[e].element.setStyle({
            cx: t.x,
            cy: t.y
        });
    },
    getMarkerPosition: function(e) {
        return jvm.WorldMap.maps[this.params.map].projection ? this.latLngToPoint.apply(this, e.latLng || [ 0, 0 ]) : {
            x: e.coords[0] * this.scale + this.transX * this.scale,
            y: e.coords[1] * this.scale + this.transY * this.scale
        };
    },
    addMarker: function(e, t, n) {
        var s, o, r = {}, i = [], n = n || [];
        for (r[e] = t, o = 0; o < n.length; o++) s = {}, s[e] = n[o], i.push(s);
        this.addMarkers(r, i);
    },
    addMarkers: function(e, t) {
        var n;
        for (t = t || [], this.createMarkers(e), n = 0; n < t.length; n++) this.series.markers[n].setValues(t[n] || {});
    },
    removeMarkers: function(e) {
        var t;
        for (t = 0; t < e.length; t++) this.markers[e[t]].element.remove(), delete this.markers[e[t]];
    },
    removeAllMarkers: function() {
        var e, t = [];
        for (e in this.markers) t.push(e);
        this.removeMarkers(t);
    },
    latLngToPoint: function(e, t) {
        {
            var n, u, a, r = jvm.WorldMap.maps[this.params.map].projection, i = r.centralMeridian;
            this.width - 2 * this.baseTransX * this.baseScale, this.height - 2 * this.baseTransY * this.baseScale, 
            this.scale / this.baseScale;
        }
        return -180 + i > t && (t += 360), n = jvm.Proj[r.type](e, t, i), u = this.getInsetForPoint(n.x, n.y), 
        u ? (a = u.bbox, n.x = (n.x - a[0].x) / (a[1].x - a[0].x) * u.width * this.scale, 
        n.y = (n.y - a[0].y) / (a[1].y - a[0].y) * u.height * this.scale, {
            x: n.x + this.transX * this.scale + u.left * this.scale,
            y: n.y + this.transY * this.scale + u.top * this.scale
        }) : !1;
    },
    pointToLatLng: function(e, t) {
        var s, o, u, a, f, n = jvm.WorldMap.maps[this.params.map].projection, r = n.centralMeridian, i = jvm.WorldMap.maps[this.params.map].insets;
        for (s = 0; s < i.length; s++) if (o = i[s], u = o.bbox, a = e - (this.transX * this.scale + o.left * this.scale), 
        f = t - (this.transY * this.scale + o.top * this.scale), a = a / (o.width * this.scale) * (u[1].x - u[0].x) + u[0].x, 
        f = f / (o.height * this.scale) * (u[1].y - u[0].y) + u[0].y, a > u[0].x && a < u[1].x && f > u[0].y && f < u[1].y) return jvm.Proj[n.type + "_inv"](a, -f, r);
        return !1;
    },
    getInsetForPoint: function(e, t) {
        var r, i, n = jvm.WorldMap.maps[this.params.map].insets;
        for (r = 0; r < n.length; r++) if (i = n[r].bbox, e > i[0].x && e < i[1].x && t > i[0].y && t < i[1].y) return n[r];
    },
    createSeries: function() {
        var e, t;
        this.series = {
            markers: [],
            regions: []
        };
        for (t in this.params.series) for (e = 0; e < this.params.series[t].length; e++) this.series[t][e] = new jvm.DataSeries(this.params.series[t][e], this[t]);
    },
    remove: function() {
        this.label.remove(), this.container.remove(), jvm.$(window).unbind("resize", this.onResize);
    }
}, jvm.WorldMap.maps = {}, jvm.WorldMap.defaultParams = {
    map: "world_mill_en",
    backgroundColor: "#505050",
    zoomButtons: !0,
    zoomOnScroll: !0,
    zoomMax: 8,
    zoomMin: 1,
    zoomStep: 1.6,
    regionsSelectable: !1,
    markersSelectable: !1,
    bindTouchEvents: !0,
    regionStyle: {
        initial: {
            fill: "white",
            "fill-opacity": 1,
            stroke: "none",
            "stroke-width": 0,
            "stroke-opacity": 1
        },
        hover: {
            "fill-opacity": .8
        },
        selected: {
            fill: "yellow"
        },
        selectedHover: {}
    },
    markerStyle: {
        initial: {
            fill: "grey",
            stroke: "#505050",
            "fill-opacity": 1,
            "stroke-width": 1,
            "stroke-opacity": 1,
            r: 5
        },
        hover: {
            stroke: "black",
            "stroke-width": 2
        },
        selected: {
            fill: "blue"
        },
        selectedHover: {}
    }
}, jvm.WorldMap.apiEvents = {
    onRegionLabelShow: "regionLabelShow",
    onRegionOver: "regionOver",
    onRegionOut: "regionOut",
    onRegionClick: "regionClick",
    onRegionSelected: "regionSelected",
    onMarkerLabelShow: "markerLabelShow",
    onMarkerOver: "markerOver",
    onMarkerOut: "markerOut",
    onMarkerClick: "markerClick",
    onMarkerSelected: "markerSelected",
    onViewportChange: "viewportChange"
}, $.fn.vectorMap("addMap", "world_mill_en", {
    insets: [ {
        width: 900,
        top: 0,
        height: 440.7063107441331,
        bbox: [ {
            y: -12671671.123330014,
            x: -20004297.151525836
        }, {
            y: 6930392.025135122,
            x: 20026572.394749384
        } ],
        left: 0
    } ],
    paths: {
        BD: {
            path: "M652.71,228.85l-0.04,1.38l-0.46,-0.21l-0.42,0.3l0.05,0.65l-0.17,-1.37l-0.48,-1.26l-1.08,-1.6l-0.23,-0.13l-2.31,-0.11l-0.31,0.36l0.21,0.98l-0.6,1.11l-0.8,-0.4l-0.37,0.09l-0.23,0.3l-0.54,-0.21l-0.78,-0.19l-0.38,-2.04l-0.83,-1.89l0.4,-1.5l-0.16,-0.35l-1.24,-0.57l0.36,-0.62l1.5,-0.95l0.02,-0.49l-1.62,-1.26l0.64,-1.31l1.7,1.0l0.12,0.04l0.96,0.11l0.19,1.62l0.25,0.26l2.38,0.37l2.32,-0.04l1.06,0.33l-0.92,1.79l-0.97,0.13l-0.23,0.16l-0.77,1.51l0.05,0.35l1.37,1.37l0.5,-0.14l0.35,-1.46l0.24,-0.0l1.24,3.92Z",
            name: "Bangladesh"
        },
        BE: {
            path: "M429.28,143.95l1.76,0.25l0.13,-0.01l2.16,-0.64l1.46,1.34l1.26,0.71l-0.23,1.8l-0.44,0.08l-0.24,0.25l-0.2,1.36l-1.8,-1.22l-0.23,-0.05l-1.14,0.23l-1.62,-1.43l-1.15,-1.31l-0.21,-0.1l-0.95,-0.04l-0.21,-0.68l1.66,-0.54Z",
            name: "Belgium"
        },
        BF: {
            path: "M413.48,260.21l-1.22,-0.46l-0.13,-0.02l-1.17,0.1l-0.15,0.06l-0.73,0.53l-0.87,-0.41l-0.39,-0.75l-0.13,-0.13l-0.98,-0.48l-0.14,-1.2l0.63,-0.99l0.05,-0.18l-0.05,-0.73l1.9,-2.01l0.08,-0.14l0.35,-1.65l0.49,-0.44l1.05,0.3l0.21,-0.02l1.05,-0.52l0.13,-0.13l0.3,-0.58l1.87,-1.1l0.11,-0.1l0.43,-0.72l2.23,-1.01l1.21,-0.32l0.51,0.4l0.19,0.06l1.25,-0.01l-0.14,0.89l0.01,0.13l0.34,1.16l0.06,0.11l1.35,1.59l0.07,1.13l0.24,0.28l2.64,0.53l-0.05,1.39l-0.42,0.59l-1.11,0.21l-0.22,0.17l-0.46,0.99l-0.69,0.23l-2.12,-0.05l-1.14,-0.2l-0.19,0.03l-0.72,0.36l-1.07,-0.17l-4.35,0.12l-0.29,0.29l-0.06,1.44l0.25,1.45Z",
            name: "Burkina Faso"
        },
        BG: {
            path: "M477.63,166.84l0.51,0.9l0.33,0.14l0.9,-0.21l1.91,0.47l3.68,0.16l0.17,-0.05l1.2,-0.75l2.78,-0.67l1.72,1.05l1.02,0.24l-0.97,0.97l-0.91,2.17l0.0,0.24l0.56,1.19l-1.58,-0.3l-0.16,0.01l-2.55,0.95l-0.2,0.28l-0.02,1.23l-1.92,0.24l-1.68,-0.99l-0.27,-0.02l-1.94,0.8l-1.52,-0.07l-0.15,-1.72l-0.12,-0.21l-0.99,-0.76l0.18,-0.18l0.02,-0.39l-0.17,-0.22l0.33,-0.75l0.91,-0.91l0.01,-0.42l-1.16,-1.25l-0.18,-0.89l0.24,-0.27Z",
            name: "Bulgaria"
        },
        BA: {
            path: "M468.39,164.66l0.16,0.04l0.43,-0.0l-0.43,0.93l0.06,0.34l1.08,1.06l-0.28,1.09l-0.5,0.13l-0.47,0.28l-0.86,0.74l-0.1,0.16l-0.28,1.29l-1.81,-0.94l-0.9,-1.22l-1.0,-0.73l-1.1,-1.1l-0.55,-0.96l-1.11,-1.3l0.3,-0.75l0.59,0.46l0.42,-0.04l0.46,-0.54l1.0,-0.06l2.11,0.5l1.72,-0.03l1.06,0.64Z",
            name: "Bosnia and Herzegovina"
        },
        BN: {
            path: "M707.34,273.57l0.76,-0.72l1.59,-1.03l-0.18,1.93l-0.9,-0.06l-0.28,0.14l-0.31,0.51l-0.68,-0.78Z",
            name: "Brunei"
        },
        BO: {
            path: "M263.83,340.79l-0.23,-0.12l-2.86,-0.11l-0.28,0.17l-0.77,1.67l-1.17,-1.51l-0.18,-0.11l-3.28,-0.64l-0.28,0.1l-2.02,2.3l-1.43,0.29l-0.91,-3.35l-1.31,-2.88l0.75,-2.41l-0.09,-0.32l-1.23,-1.03l-0.31,-1.76l-0.05,-0.12l-1.12,-1.6l1.49,-2.62l0.01,-0.28l-1.0,-2.0l0.48,-0.72l0.02,-0.29l-0.37,-0.78l0.87,-1.13l0.06,-0.18l0.05,-2.17l0.12,-1.71l0.5,-0.8l0.01,-0.3l-1.9,-3.58l1.3,0.15l1.34,-0.05l0.23,-0.12l0.51,-0.7l2.12,-0.99l1.31,-0.93l2.81,-0.37l-0.21,1.51l0.01,0.13l0.29,0.91l-0.19,1.64l0.11,0.27l2.72,2.27l0.15,0.07l2.71,0.41l0.92,0.88l0.12,0.07l1.64,0.49l1.0,0.71l0.18,0.06l1.5,-0.02l1.24,0.64l0.1,1.31l0.05,0.14l0.44,0.68l0.02,0.73l-0.44,0.03l-0.27,0.39l0.96,2.99l0.28,0.21l4.43,0.1l-0.28,1.12l0.0,0.15l0.27,1.02l0.15,0.19l1.27,0.67l0.52,1.42l-0.42,1.91l-0.66,1.1l-0.04,0.2l0.21,1.3l-0.19,0.13l-0.01,-0.27l-0.15,-0.24l-2.33,-1.33l-0.14,-0.04l-2.38,-0.03l-4.36,0.76l-0.21,0.16l-1.2,2.29l-0.03,0.13l-0.06,1.37l-0.79,2.53l-0.05,-0.08Z",
            name: "Bolivia"
        },
        JP: {
            path: "M781.17,166.78l1.8,0.67l0.28,-0.04l1.38,-1.01l0.43,2.67l-3.44,0.77l-0.18,0.12l-2.04,2.79l-3.71,-1.94l-0.42,0.15l-1.29,3.11l-2.32,0.04l-0.3,-2.63l1.12,-2.1l2.51,-0.16l0.28,-0.25l0.73,-4.22l0.58,-1.9l2.59,2.84l2.0,1.1ZM773.66,187.36l-0.92,2.24l-0.01,0.2l0.4,1.3l-1.18,1.81l-3.06,1.28l-4.35,0.17l-0.19,0.08l-3.4,3.06l-1.36,-0.87l-0.1,-1.95l-0.34,-0.28l-4.35,0.62l-2.99,1.33l-2.87,0.05l-0.28,0.2l0.09,0.33l2.37,1.93l-1.57,4.44l-1.35,0.97l-0.9,-0.79l0.57,-2.32l-0.15,-0.34l-1.5,-0.77l-0.81,-1.53l2.04,-0.75l0.14,-0.1l1.28,-1.72l2.47,-1.43l1.84,-1.92l4.83,-0.82l2.62,0.57l0.33,-0.16l2.45,-4.77l1.38,1.14l0.38,0.0l5.1,-4.02l0.09,-0.11l1.57,-3.57l0.02,-0.16l-0.42,-3.22l0.94,-1.67l2.27,-0.47l1.26,3.82l-0.07,2.23l-2.26,2.86l-0.06,0.19l0.04,2.93ZM757.85,196.18l0.22,0.66l-1.11,1.33l-0.8,-0.7l-0.33,-0.04l-1.28,0.65l-0.14,0.15l-0.54,1.34l-1.17,-0.57l0.02,-1.03l1.2,-1.45l1.24,0.28l0.29,-0.1l0.9,-1.03l1.51,0.5Z",
            name: "Japan"
        },
        BI: {
            path: "M494.7,295.83l-0.14,-2.71l-0.04,-0.13l-0.34,-0.62l0.93,0.12l0.3,-0.16l0.67,-1.25l0.9,0.11l0.11,0.76l0.08,0.16l0.46,0.48l0.02,0.56l-0.55,0.48l-0.96,1.29l-0.82,0.82l-0.61,0.07Z",
            name: "Burundi"
        },
        BJ: {
            path: "M427.4,268.94l-1.58,0.22l-0.52,-1.45l0.11,-5.73l-0.08,-0.21l-0.43,-0.44l-0.09,-1.13l-0.09,-0.19l-1.52,-1.52l0.24,-1.01l0.7,-0.23l0.18,-0.16l0.45,-0.97l1.07,-0.21l0.19,-0.12l0.53,-0.73l0.73,-0.65l0.68,-0.0l1.69,1.3l-0.08,0.67l0.02,0.14l0.52,1.38l-0.44,0.9l-0.01,0.24l0.2,0.52l-1.1,1.42l-0.76,0.76l-0.08,0.13l-0.47,1.59l0.05,1.69l-0.13,3.79Z",
            name: "Benin"
        },
        BT: {
            path: "M650.38,213.78l0.88,0.75l-0.13,1.24l-1.77,0.07l-2.1,-0.18l-1.57,0.4l-2.02,-0.91l-0.02,-0.24l1.54,-1.87l1.18,-0.6l1.67,0.59l1.32,0.08l1.01,0.67Z",
            name: "Bhutan"
        },
        JM: {
            path: "M226.67,238.37l1.64,0.23l1.2,0.56l0.11,0.19l-1.25,0.03l-0.14,0.04l-0.65,0.37l-1.24,-0.37l-1.17,-0.77l0.11,-0.22l0.86,-0.15l0.52,0.08Z",
            name: "Jamaica"
        },
        BW: {
            path: "M484.91,331.96l0.53,0.52l0.82,1.53l2.83,2.86l0.14,0.08l0.85,0.22l0.03,0.81l0.74,1.66l0.21,0.17l1.87,0.39l1.17,0.87l-3.13,1.71l-2.3,2.01l-0.07,0.1l-0.82,1.74l-0.66,0.88l-1.24,0.19l-0.24,0.2l-0.65,1.98l-1.4,0.55l-1.9,-0.12l-1.2,-0.74l-1.06,-0.32l-0.22,0.02l-1.22,0.62l-0.14,0.14l-0.58,1.21l-1.16,0.79l-1.18,1.13l-1.5,0.23l-0.4,-0.68l0.22,-1.53l-0.04,-0.19l-1.48,-2.54l-0.11,-0.11l-0.53,-0.31l-0.0,-7.25l2.18,-0.08l0.29,-0.3l0.07,-9.0l1.63,-0.08l3.69,-0.86l0.84,0.93l0.38,0.05l1.53,-0.97l0.79,-0.03l1.3,-0.53l0.23,0.1l0.92,1.96Z",
            name: "Botswana"
        },
        BR: {
            path: "M259.49,274.87l1.42,0.25l1.97,0.62l0.28,-0.05l0.67,-0.55l1.76,-0.38l2.8,-0.94l0.12,-0.08l0.92,-0.96l0.05,-0.33l-0.15,-0.32l0.73,-0.06l0.36,0.35l-0.27,0.93l0.17,0.36l0.76,0.34l0.44,0.9l-0.58,0.73l-0.06,0.13l-0.4,2.13l0.03,0.19l0.62,1.22l0.17,1.11l0.11,0.19l1.54,1.18l0.15,0.06l1.23,0.12l0.29,-0.15l0.2,-0.36l0.71,-0.11l1.13,-0.44l0.79,-0.63l1.25,0.19l0.65,-0.08l1.32,0.2l0.32,-0.18l0.23,-0.51l-0.05,-0.31l-0.31,-0.37l0.11,-0.31l0.75,0.17l0.13,0.0l1.1,-0.24l1.34,0.5l1.08,0.51l0.33,-0.05l0.67,-0.58l0.27,0.05l0.28,0.57l0.31,0.17l1.2,-0.18l0.17,-0.08l1.03,-1.05l0.76,-1.82l1.39,-2.16l0.49,-0.07l0.52,1.17l1.4,4.37l0.2,0.2l1.14,0.35l0.05,1.39l-1.8,1.97l0.01,0.42l0.78,0.75l0.18,0.08l4.16,0.37l0.08,2.25l0.5,0.22l1.78,-1.54l2.98,0.85l4.07,1.5l1.07,1.28l-0.37,1.23l0.36,0.38l2.83,-0.75l4.8,1.3l3.75,-0.09l3.6,2.02l3.27,2.84l1.93,0.72l2.13,0.11l0.76,0.66l1.22,4.56l-0.96,4.03l-1.22,1.58l-3.52,3.51l-1.63,2.91l-1.75,2.09l-0.5,0.04l-0.26,0.19l-0.72,1.99l0.18,4.76l-0.95,5.56l-0.74,0.96l-0.06,0.15l-0.43,3.39l-2.49,3.34l-0.06,0.13l-0.4,2.56l-1.9,1.07l-0.13,0.16l-0.51,1.38l-2.59,0.0l-3.94,1.01l-1.82,1.19l-2.85,0.81l-3.01,2.17l-2.12,2.65l-0.06,0.13l-0.36,2.0l0.01,0.13l0.4,1.42l-0.45,2.63l-0.53,1.23l-1.76,1.53l-2.76,4.79l-2.16,2.15l-1.69,1.29l-0.09,0.12l-1.12,2.6l-1.3,1.26l-0.45,-1.02l0.99,-1.18l0.01,-0.37l-1.5,-1.95l-1.98,-1.54l-2.58,-1.77l-0.2,-0.05l-0.81,0.07l-2.42,-2.05l-0.25,-0.07l-0.77,0.14l2.75,-3.07l2.8,-2.61l1.67,-1.09l2.11,-1.49l0.13,-0.24l0.05,-2.15l-0.07,-0.2l-1.26,-1.54l-0.35,-0.09l-0.64,0.27l0.3,-0.95l0.34,-1.57l0.01,-1.52l-0.16,-0.26l-0.9,-0.48l-0.27,-0.01l-0.86,0.39l-0.65,-0.08l-0.23,-0.8l-0.23,-2.39l-0.04,-0.12l-0.47,-0.79l-0.14,-0.12l-1.69,-0.71l-0.25,0.01l-0.93,0.47l-2.29,-0.44l0.15,-3.3l-0.03,-0.15l-0.62,-1.22l0.57,-0.39l0.13,-0.3l-0.22,-1.37l0.67,-1.13l0.44,-2.04l-0.01,-0.17l-0.59,-1.61l-0.14,-0.16l-1.25,-0.66l-0.22,-0.82l0.35,-1.41l-0.28,-0.37l-4.59,-0.1l-0.78,-2.41l0.34,-0.02l0.28,-0.31l-0.03,-1.1l-0.05,-0.16l-0.45,-0.68l-0.1,-1.4l-0.16,-0.24l-1.45,-0.76l-0.14,-0.03l-1.48,0.02l-1.04,-0.73l-1.62,-0.48l-0.93,-0.9l-0.16,-0.08l-2.72,-0.41l-2.53,-2.12l0.18,-1.54l-0.01,-0.13l-0.29,-0.91l0.26,-1.83l-0.34,-0.34l-3.28,0.43l-0.14,0.05l-1.3,0.93l-2.16,1.01l-0.12,0.09l-0.47,0.65l-1.12,0.05l-1.84,-0.21l-0.12,0.01l-1.33,0.41l-0.82,-0.21l0.16,-3.6l-0.48,-0.26l-1.97,1.43l-1.96,-0.06l-0.86,-1.23l-0.22,-0.13l-1.23,-0.11l0.34,-0.69l-0.05,-0.33l-1.36,-1.5l-0.92,-2.0l0.45,-0.32l0.13,-0.25l-0.0,-0.87l1.34,-0.64l0.17,-0.32l-0.23,-1.23l0.56,-0.77l0.05,-0.13l0.16,-1.03l2.7,-1.61l2.01,-0.47l0.16,-0.09l0.24,-0.27l2.11,0.11l0.31,-0.25l1.13,-6.87l0.06,-1.12l-0.4,-1.53l-0.1,-0.15l-1.0,-0.82l0.01,-1.45l1.08,-0.32l0.39,0.2l0.44,-0.24l0.08,-0.96l-0.25,-0.32l-1.22,-0.22l-0.02,-1.01l4.57,0.05l0.22,-0.09l0.6,-0.63l0.44,0.5l0.47,1.42l0.45,0.16l0.27,-0.18l1.21,1.16l0.23,0.08l1.95,-0.16l0.23,-0.14l0.43,-0.67l1.76,-0.55l1.05,-0.42l0.18,-0.2l0.25,-0.92l1.65,-0.66l0.18,-0.35l-0.14,-0.53l-0.26,-0.22l-1.91,-0.19l-0.29,-1.33l0.1,-1.64l-0.15,-0.28l-0.44,-0.25Z",
            name: "Brazil"
        },
        BS: {
            path: "M227.51,216.69l0.3,0.18l-0.24,1.07l0.03,-1.04l-0.09,-0.21ZM226.5,224.03l-0.13,0.03l-0.54,-1.3l-0.09,-0.12l-0.78,-0.64l0.4,-1.26l0.33,0.05l0.79,2.0l0.01,1.24ZM225.76,216.5l-2.16,0.34l-0.07,-0.41l0.85,-0.16l1.36,0.07l0.02,0.16Z",
            name: "The Bahamas"
        },
        BY: {
            path: "M480.08,135.28l2.09,0.02l0.13,-0.03l2.72,-1.3l0.16,-0.19l0.55,-1.83l1.94,-1.06l0.15,-0.31l-0.2,-1.33l1.33,-0.52l2.58,-1.3l2.39,0.8l0.3,0.75l0.37,0.17l1.22,-0.39l2.18,0.75l0.2,1.36l-0.48,0.85l0.01,0.32l1.57,2.26l0.92,0.6l-0.1,0.41l0.19,0.35l1.61,0.57l0.48,0.6l-0.64,0.49l-1.91,-0.11l-0.18,0.05l-0.48,0.32l-0.1,0.39l0.57,1.1l0.51,1.78l-1.79,0.17l-0.18,0.08l-0.77,0.73l-0.09,0.19l-0.13,1.31l-0.75,-0.22l-2.11,0.15l-0.56,-0.66l-0.39,-0.06l-0.8,0.49l-0.79,-0.4l-0.13,-0.03l-1.94,-0.07l-2.76,-0.79l-2.58,-0.27l-1.98,0.07l-0.15,0.05l-1.31,0.86l-0.8,0.09l-0.04,-1.16l-0.03,-0.12l-0.63,-1.28l1.22,-0.56l0.17,-0.27l0.01,-1.35l-0.04,-0.15l-0.66,-1.24l-0.08,-1.12Z",
            name: "Belarus"
        },
        BZ: {
            path: "M198.03,239.7l0.28,0.19l0.43,-0.1l0.82,-1.42l0.0,0.07l0.29,0.29l0.16,0.0l-0.02,0.35l-0.39,1.08l0.02,0.25l0.16,0.29l-0.23,0.8l0.04,0.24l0.09,0.14l-0.25,1.12l-0.38,0.53l-0.33,0.06l-0.21,0.15l-0.41,0.74l-0.25,0.0l0.17,-2.58l0.01,-2.2Z",
            name: "Belize"
        },
        RU: {
            path: "M688.57,38.85l0.63,2.39l0.44,0.19l2.22,-1.23l7.18,0.07l5.54,2.49l1.85,1.77l-0.55,2.34l-2.64,1.42l-6.57,2.76l-1.95,1.5l0.12,0.53l3.09,0.68l3.69,1.23l0.21,-0.01l1.98,-0.81l1.16,2.84l0.5,0.08l1.03,-1.18l3.86,-0.74l7.79,0.78l0.56,2.05l0.27,0.22l10.47,0.71l0.32,-0.29l0.13,-3.34l4.98,0.8l3.96,-0.02l3.88,2.43l1.06,2.79l-1.38,1.83l0.01,0.38l3.15,3.64l0.1,0.08l3.94,1.86l0.4,-0.14l2.28,-4.56l3.75,1.94l0.22,0.02l4.18,-1.22l4.76,1.4l0.26,-0.04l1.74,-1.23l3.98,0.63l0.32,-0.41l-1.71,-4.1l3.0,-1.86l22.39,3.04l2.06,2.67l0.1,0.08l6.55,3.51l0.17,0.03l10.08,-0.86l4.86,0.73l1.91,1.72l-0.29,3.13l0.18,0.31l3.08,1.26l0.19,0.01l3.32,-0.9l4.37,-0.11l4.78,0.87l4.61,-0.48l4.26,3.82l0.32,0.05l3.1,-1.4l0.12,-0.45l-1.91,-2.67l0.92,-1.64l7.78,1.22l5.22,-0.26l7.12,2.1l9.6,5.22l6.4,4.15l-0.2,2.44l0.14,0.28l1.69,1.04l0.45,-0.31l-0.51,-2.66l6.31,0.58l4.52,3.61l-2.1,1.52l-4.02,0.42l-0.27,0.29l-0.06,3.83l-0.81,0.67l-2.14,-0.11l-1.91,-1.39l-3.19,-1.13l-0.51,-1.63l-0.21,-0.2l-2.54,-0.67l-0.13,-0.0l-2.69,0.5l-1.12,-1.19l0.48,-1.36l-0.38,-0.39l-3.0,0.98l-0.17,0.44l1.02,1.76l-1.27,1.55l-3.09,1.71l-3.15,-0.29l-0.3,0.18l0.07,0.34l2.22,2.1l1.47,3.22l1.15,1.09l0.25,1.41l-0.48,0.76l-4.47,-0.81l-0.17,0.02l-6.97,2.9l-2.2,0.44l-0.11,0.05l-3.83,2.68l-3.63,2.32l-0.1,0.11l-0.76,1.4l-3.3,-2.4l-0.3,-0.03l-6.31,2.85l-0.99,-1.21l-0.4,-0.06l-2.32,1.54l-3.23,-0.49l-0.33,0.2l-0.79,2.39l-2.97,3.51l-0.07,0.21l0.09,1.47l0.22,0.27l2.62,0.74l-0.3,4.7l-2.06,0.12l-0.26,0.2l-1.07,2.94l0.04,0.27l0.83,1.19l-4.03,1.63l-0.18,0.21l-0.83,3.72l-3.55,0.79l-0.23,0.23l-0.73,3.32l-3.22,2.76l-0.76,-1.88l-1.07,-4.88l-1.39,-7.59l1.17,-4.76l2.05,-2.08l0.09,-0.19l0.11,-1.46l3.67,-0.77l0.15,-0.08l4.47,-4.61l4.29,-3.82l4.48,-3.01l0.11,-0.14l2.01,-5.43l-0.31,-0.4l-3.04,0.33l-0.24,0.17l-1.47,3.11l-5.98,3.94l-1.91,-4.36l-0.33,-0.17l-6.46,1.3l-0.15,0.08l-6.27,6.33l-0.01,0.41l1.7,1.87l-5.04,0.87l-3.51,0.34l0.16,-2.32l-0.26,-0.32l-3.89,-0.56l-0.19,0.04l-3.02,1.77l-7.63,-0.63l-8.24,1.1l-0.16,0.07l-8.11,7.09l-9.6,8.31l0.16,0.52l3.79,0.42l1.16,2.03l0.17,0.14l2.43,0.76l0.31,-0.08l1.5,-1.61l2.49,0.2l3.46,3.6l0.08,2.67l-1.91,3.26l-0.04,0.14l-0.21,3.91l-1.11,5.09l-3.73,4.55l-0.87,2.21l-6.73,7.14l-1.59,1.77l-3.23,1.72l-1.38,0.03l-1.48,-1.39l-0.37,-0.03l-3.36,2.22l-0.11,0.14l-0.16,0.42l-0.01,-1.09l1.0,-0.06l0.28,-0.27l0.36,-3.6l-0.61,-2.51l1.85,-0.94l2.94,0.53l0.32,-0.15l1.71,-3.1l0.84,-3.38l0.97,-1.18l1.32,-2.88l-0.34,-0.42l-4.14,0.95l-2.18,1.25l-3.51,-0.0l-0.95,-2.81l-0.1,-0.14l-2.97,-2.3l-0.11,-0.05l-4.19,-1.0l-0.89,-3.08l-0.87,-2.03l-0.95,-1.46l-1.54,-3.37l-0.12,-0.14l-2.27,-1.28l-3.83,-1.02l-3.37,0.1l-3.11,0.61l-0.13,0.06l-2.07,1.69l0.04,0.49l1.23,0.72l0.03,1.53l-1.34,1.05l-2.26,3.51l-0.05,0.17l0.02,1.27l-3.25,1.9l-2.87,-1.17l-0.14,-0.02l-2.86,0.26l-1.22,-1.02l-0.12,-0.06l-1.5,-0.35l-0.23,0.04l-3.62,2.27l-3.24,0.53l-2.28,0.79l-3.08,-0.51l-2.24,0.03l-1.49,-1.61l-2.45,-1.57l-0.11,-0.04l-2.6,-0.43l-3.17,0.43l-2.31,0.59l-3.31,-1.28l-0.45,-2.31l-0.21,-0.23l-2.94,-0.85l-2.26,-0.39l-2.77,-1.36l-0.37,0.09l-2.59,3.45l-0.03,0.32l0.91,1.74l-2.15,2.01l-3.47,-0.79l-2.44,-0.12l-1.59,-1.46l-0.2,-0.08l-2.55,-0.05l-2.12,-0.98l-0.24,-0.01l-3.85,1.57l-4.74,2.79l-2.59,0.55l-0.79,0.21l-1.21,-1.81l-0.29,-0.13l-3.05,0.41l-0.96,-1.25l-0.14,-0.1l-1.65,-0.6l-1.15,-1.82l-0.13,-0.12l-1.38,-0.6l-0.19,-0.02l-3.49,0.82l-3.35,-1.85l-0.38,0.08l-1.08,1.4l-5.36,-8.17l-3.02,-2.52l0.72,-0.85l0.01,-0.38l-0.37,-0.08l-6.22,3.21l-1.98,0.16l0.17,-1.51l-0.2,-0.31l-3.22,-1.17l-0.19,-0.0l-2.3,0.74l-0.72,-3.27l-0.24,-0.23l-4.5,-0.75l-0.21,0.04l-2.2,1.42l-6.21,1.27l-0.11,0.05l-1.16,0.81l-9.3,1.19l-0.18,0.09l-1.15,1.17l-0.02,0.39l1.56,2.01l-2.02,0.74l-0.16,0.42l0.35,0.68l-2.18,1.49l0.02,0.51l3.83,2.16l-0.45,1.13l-3.31,-0.13l-0.25,0.12l-0.57,0.77l-2.97,-1.59l-0.15,-0.04l-3.97,0.07l-0.13,0.03l-2.53,1.32l-2.84,-1.28l-5.52,-2.3l-0.12,-0.02l-3.91,0.09l-0.16,0.05l-5.17,3.6l-0.13,0.21l-0.25,1.89l-2.17,-1.6l-0.44,0.1l-2.0,3.59l0.06,0.37l0.55,0.5l-1.32,2.23l0.04,0.36l2.13,2.17l0.23,0.09l1.7,-0.08l1.42,1.89l-0.23,1.5l0.19,0.32l0.94,0.38l-0.89,1.44l-2.3,0.49l-0.17,0.11l-2.49,3.2l0.0,0.37l2.2,2.81l-0.23,1.93l0.06,0.22l2.56,3.32l-1.27,1.02l-0.4,0.66l-0.8,-0.15l-1.65,-1.75l-0.18,-0.09l-0.66,-0.09l-1.45,-0.64l-0.72,-1.16l-0.18,-0.13l-2.34,-0.63l-0.17,0.0l-1.32,0.41l-0.31,-0.4l-0.12,-0.09l-3.49,-1.48l-3.67,-0.49l-2.1,-0.52l-0.3,0.1l-0.12,0.14l-2.96,-2.4l-2.89,-1.19l-1.69,-1.42l1.27,-0.35l0.16,-0.1l2.08,-2.61l-0.04,-0.41l-1.02,-0.9l3.21,-1.12l0.2,-0.31l-0.07,-0.69l-0.37,-0.26l-1.86,0.42l0.05,-0.86l1.11,-0.76l2.35,-0.23l0.25,-0.19l0.39,-1.07l0.0,-0.19l-0.51,-1.64l0.95,-1.58l0.04,-0.16l-0.03,-0.95l-0.22,-0.28l-3.69,-1.06l-1.43,0.02l-1.45,-1.44l-0.29,-0.08l-1.83,0.49l-2.88,-1.04l0.04,-0.42l-0.04,-0.18l-0.89,-1.43l-0.23,-0.14l-1.77,-0.14l-0.13,-0.66l0.52,-0.56l0.01,-0.4l-1.6,-1.9l-0.27,-0.1l-2.55,0.32l-0.71,-0.16l-0.3,0.1l-0.53,0.63l-0.58,-0.08l-0.56,-1.97l-0.48,-0.94l0.17,-0.11l1.92,0.11l0.2,-0.06l0.97,-0.74l0.05,-0.42l-0.72,-0.91l-0.13,-0.1l-1.43,-0.51l0.09,-0.36l-0.13,-0.33l-0.97,-0.59l-1.43,-2.06l0.44,-0.77l0.04,-0.19l-0.25,-1.64l-0.2,-0.24l-2.45,-0.84l-0.19,-0.0l-1.05,0.34l-0.25,-0.62l-0.18,-0.17l-2.5,-0.84l-0.74,-1.93l-0.21,-1.7l-0.13,-0.21l-0.92,-0.63l0.83,-0.89l0.07,-0.27l-0.71,-3.26l1.69,-2.01l0.03,-0.34l-0.24,-0.41l2.63,-1.9l-0.01,-0.49l-2.31,-1.57l5.08,-4.61l2.33,-2.24l1.01,-2.08l-0.09,-0.37l-3.52,-2.56l0.94,-2.38l-0.04,-0.29l-2.14,-2.86l1.61,-3.35l-0.01,-0.29l-2.81,-4.58l2.19,-3.04l-0.06,-0.42l-3.7,-2.76l0.32,-2.67l1.87,-0.38l4.26,-1.77l2.46,-1.47l3.96,2.58l0.12,0.05l6.81,1.04l9.37,4.87l1.81,1.92l0.15,2.55l-2.61,2.06l-3.95,1.07l-11.1,-3.15l-0.17,0.0l-1.84,0.53l-0.1,0.53l3.97,2.97l0.15,1.77l0.16,4.14l0.19,0.27l3.21,1.22l1.94,1.03l0.44,-0.22l0.32,-1.94l-0.07,-0.25l-1.32,-1.52l1.25,-1.2l5.87,2.45l0.24,-0.01l2.11,-0.98l0.13,-0.42l-1.55,-2.75l5.52,-3.84l2.13,0.22l2.28,1.42l0.43,-0.12l1.46,-2.87l-0.04,-0.33l-1.97,-2.37l1.14,-2.38l-0.02,-0.3l-1.42,-2.07l6.15,1.22l1.14,1.92l-2.74,0.46l-0.25,0.3l0.02,2.36l0.12,0.24l1.97,1.44l0.25,0.05l3.87,-0.91l0.22,-0.23l0.58,-2.55l5.09,-1.98l8.67,-3.69l1.22,0.14l-2.06,2.2l0.18,0.5l3.11,0.45l0.23,-0.07l1.71,-1.41l4.59,-0.12l0.12,-0.03l3.53,-1.72l2.7,2.48l0.42,-0.01l2.85,-2.88l-0.0,-0.43l-2.42,-2.35l1.0,-1.13l7.2,1.31l3.42,1.36l9.06,4.97l0.39,-0.08l1.67,-2.27l-0.04,-0.4l-2.46,-2.23l-0.06,-0.82l-0.26,-0.27l-2.64,-0.38l0.69,-1.76l0.0,-0.22l-1.32,-3.47l-0.07,-1.27l4.52,-4.09l0.08,-0.11l1.6,-4.18l1.67,-0.84l6.33,1.2l0.46,2.31l-2.31,3.67l0.05,0.38l1.49,1.41l0.77,3.04l-0.56,6.05l0.09,0.24l2.62,2.54l-0.99,2.65l-4.87,5.96l0.17,0.48l2.86,0.61l0.31,-0.13l0.94,-1.42l2.67,-1.04l0.18,-0.19l0.64,-2.01l2.11,-1.98l0.05,-0.37l-1.38,-2.32l1.11,-2.74l-0.24,-0.41l-2.53,-0.33l-0.53,-2.16l1.96,-4.42l-0.05,-0.32l-3.03,-3.48l4.21,-2.94l0.12,-0.3l-0.52,-3.04l0.72,-0.06l1.18,2.35l-0.97,4.39l0.2,0.35l2.68,0.84l0.37,-0.38l-1.05,-3.07l3.89,-1.71l5.05,-0.24l4.55,2.62l0.36,-0.05l0.05,-0.36l-2.19,-3.84l-0.23,-4.78l4.07,-0.92l5.98,0.21l5.47,-0.64l0.2,-0.48l-1.88,-2.37l2.65,-2.99l2.75,-0.13l0.12,-0.03l4.82,-2.48l6.56,-0.67l0.23,-0.14l0.76,-1.27l6.33,-0.46l1.97,1.11l0.28,0.01l5.55,-2.71l4.53,0.08l0.29,-0.21l0.67,-2.18l2.29,-2.15l5.75,-2.13l3.48,1.4l-2.7,1.03l-0.19,0.31l0.26,0.26l5.47,0.78ZM871.83,65.73l0.25,-0.15l1.99,0.01l3.3,1.2l-0.08,0.22l-2.41,1.03l-5.73,0.49l-0.31,-1.0l2.99,-1.8ZM797.64,48.44l-2.22,1.51l-3.85,-0.43l-4.35,-1.85l0.42,-1.13l4.42,0.72l5.59,1.17ZM783.82,46.06l-1.71,3.25l-9.05,-0.14l-4.11,1.15l-4.64,-3.04l1.21,-3.13l3.11,-0.91l6.53,0.22l8.66,2.59ZM780.37,145.71l2.28,5.23l-3.09,-0.89l-0.37,0.19l-1.54,4.65l0.04,0.27l2.38,3.17l-0.05,1.4l-1.41,-1.41l-0.46,0.04l-1.23,1.81l-0.33,-1.86l0.28,-3.1l-0.28,-3.41l0.58,-2.46l0.11,-4.39l-0.03,-0.13l-1.44,-3.2l0.21,-4.39l2.19,-1.49l0.09,-0.41l-0.81,-1.3l0.48,-0.21l0.56,1.94l0.86,3.23l-0.05,3.36l1.03,3.35ZM780.16,57.18l-3.4,0.03l-5.06,-0.53l1.97,-1.59l2.95,-0.42l3.35,1.75l0.18,0.77ZM683.84,31.18l-13.29,1.97l4.16,-6.56l1.88,-0.58l1.77,0.34l6.08,3.02l-0.6,1.8ZM670.94,28.02l-5.18,0.65l-6.89,-1.58l-4.03,-2.07l-1.88,-3.98l-0.18,-0.16l-2.8,-0.93l5.91,-3.62l5.25,-1.29l4.73,2.88l5.63,5.44l-0.57,4.66ZM564.37,68.98l-0.85,0.23l-7.93,-0.57l-0.6,-1.84l-0.21,-0.2l-4.34,-1.18l-0.3,-2.08l2.34,-0.92l0.19,-0.29l-0.08,-2.43l4.85,-4.0l-0.12,-0.52l-1.68,-0.43l5.47,-3.94l0.11,-0.33l-0.6,-2.02l5.36,-2.55l8.22,-3.27l8.29,-0.96l4.34,-1.94l4.67,-0.65l1.45,1.72l-1.43,1.37l-8.8,2.52l-7.65,2.42l-7.92,4.84l-3.73,4.75l-3.92,4.58l-0.07,0.23l0.51,3.88l0.11,0.2l4.32,3.39ZM548.86,18.57l-3.28,0.75l-2.25,0.44l-0.22,0.19l-0.3,0.81l-2.67,0.86l-2.27,-1.14l1.2,-1.51l-0.23,-0.49l-3.14,-0.1l2.48,-0.54l3.55,-0.07l0.44,1.36l0.49,0.12l1.4,-1.35l2.2,-0.9l3.13,1.08l-0.54,0.49ZM477.5,133.25l-4.21,0.05l-2.69,-0.34l0.39,-1.03l3.24,-1.06l2.51,0.58l0.85,0.43l-0.2,0.71l-0.0,0.15l0.12,0.52Z",
            name: "Russia"
        },
        RW: {
            path: "M497.03,288.12l0.78,1.11l-0.12,1.19l-0.49,0.21l-1.25,-0.15l-0.3,0.16l-0.67,1.24l-1.01,-0.13l0.16,-0.92l0.22,-0.12l0.15,-0.24l0.09,-1.37l0.49,-0.48l0.42,0.18l0.25,-0.01l1.26,-0.65Z",
            name: "Rwanda"
        },
        RS: {
            path: "M469.75,168.65l0.21,-0.21l0.36,-1.44l-0.08,-0.29l-1.06,-1.03l0.54,-1.16l-0.28,-0.43l-0.26,0.0l0.55,-0.67l-0.01,-0.39l-0.77,-0.86l-0.45,-0.89l1.56,-0.67l1.39,0.12l1.22,1.1l0.26,0.91l0.16,0.19l1.38,0.66l0.17,1.12l0.14,0.21l1.46,0.9l0.35,-0.03l0.62,-0.54l0.09,0.06l-0.28,0.25l-0.03,0.42l0.29,0.34l-0.44,0.5l-0.07,0.26l0.22,1.12l0.07,0.14l1.02,1.1l-0.81,0.84l-0.42,0.96l0.04,0.3l0.12,0.15l-0.15,0.16l-1.04,0.04l-0.39,0.08l0.33,-0.81l-0.29,-0.41l-0.21,0.01l-0.39,-0.45l-0.13,-0.09l-0.32,-0.11l-0.27,-0.4l-0.14,-0.11l-0.4,-0.16l-0.31,-0.37l-0.34,-0.09l-0.45,0.17l-0.18,0.18l-0.29,0.84l-0.96,-0.65l-0.81,-0.33l-0.32,-0.37l-0.22,-0.18Z",
            name: "Republic of Serbia"
        },
        LT: {
            path: "M478.13,133.31l-0.14,-0.63l0.25,-0.88l-0.15,-0.35l-1.17,-0.58l-2.43,-0.57l-0.45,-2.51l2.58,-0.97l4.14,0.22l2.3,-0.32l0.26,0.54l0.22,0.17l1.26,0.22l2.25,1.6l0.19,1.23l-1.87,1.01l-0.14,0.18l-0.54,1.83l-2.54,1.21l-2.18,-0.02l-0.52,-0.91l-0.18,-0.14l-1.11,-0.32Z",
            name: "Lithuania"
        },
        LU: {
            path: "M435.95,147.99l0.33,0.49l-0.11,1.07l-0.39,0.04l-0.29,-0.15l0.21,-1.4l0.25,-0.05Z",
            name: "Luxembourg"
        },
        LR: {
            path: "M401.37,273.67l-0.32,0.01l-2.48,-1.15l-2.24,-1.89l-2.14,-1.38l-1.47,-1.42l0.44,-0.59l0.05,-0.13l0.12,-0.65l1.07,-1.3l1.08,-1.09l0.52,-0.07l0.43,-0.18l0.84,1.24l-0.15,0.89l0.07,0.25l0.49,0.54l0.22,0.1l0.71,0.01l0.27,-0.16l0.42,-0.83l0.19,0.02l-0.06,0.52l0.23,1.12l-0.5,1.03l0.06,0.35l0.73,0.69l0.14,0.08l0.71,0.15l0.92,0.91l0.06,0.76l-0.17,0.22l-0.06,0.15l-0.17,1.8Z",
            name: "Liberia"
        },
        RO: {
            path: "M477.94,155.19l1.02,-0.64l1.49,0.33l1.52,0.01l1.09,0.73l0.32,0.01l0.81,-0.46l1.8,-0.3l0.18,-0.1l0.54,-0.64l0.86,0.0l0.64,0.26l0.71,0.87l0.8,1.35l1.39,1.81l0.07,1.25l-0.26,1.3l0.01,0.15l0.45,1.42l0.15,0.18l1.12,0.57l0.25,0.01l1.05,-0.45l0.86,0.4l0.03,0.43l-0.92,0.51l-0.63,-0.24l-0.4,0.22l-0.64,3.41l-1.12,-0.24l-1.78,-1.09l-0.23,-0.04l-2.95,0.71l-1.25,0.77l-3.55,-0.16l-1.89,-0.47l-0.14,-0.0l-0.75,0.17l-0.61,-1.07l-0.3,-0.36l0.36,-0.32l-0.04,-0.48l-0.62,-0.38l-0.36,0.03l-0.62,0.54l-1.15,-0.71l-0.18,-1.14l-0.17,-0.22l-1.4,-0.67l-0.24,-0.86l-0.09,-0.14l-0.96,-0.87l1.49,-0.44l0.16,-0.11l1.51,-2.14l1.15,-2.09l1.44,-0.63Z",
            name: "Romania"
        },
        GW: {
            path: "M383.03,256.73l-1.12,-0.88l-0.14,-0.06l-0.94,-0.15l-0.43,-0.54l0.01,-0.27l-0.13,-0.26l-0.68,-0.48l-0.05,-0.16l0.99,-0.31l0.77,0.08l0.15,-0.02l0.61,-0.26l4.25,0.1l-0.02,0.44l-0.19,0.18l-0.08,0.29l0.17,0.66l-0.17,0.14l-0.44,0.0l-0.16,0.05l-0.57,0.37l-0.66,-0.04l-0.24,0.1l-0.92,1.03Z",
            name: "Guinea Bissau"
        },
        GT: {
            path: "M195.13,249.89l-1.05,-0.35l-1.5,-0.04l-1.06,-0.47l-1.19,-0.93l0.04,-0.53l0.27,-0.55l-0.03,-0.31l-0.24,-0.32l1.02,-1.77l3.04,-0.01l0.3,-0.28l0.06,-0.88l-0.19,-0.3l-0.3,-0.11l-0.23,-0.45l-0.11,-0.12l-0.9,-0.58l-0.35,-0.33l0.37,-0.0l0.3,-0.3l0.0,-1.15l4.05,0.02l-0.02,1.74l-0.2,2.89l0.3,0.32l0.67,-0.0l0.75,0.42l0.4,-0.11l-0.62,0.53l-1.17,0.7l-0.13,0.16l-0.18,0.49l0.0,0.21l0.14,0.34l-0.35,0.44l-0.49,0.13l-0.2,0.41l0.03,0.06l-0.27,0.16l-0.86,0.64l-0.12,0.22ZM199.35,245.38l0.07,-0.13l0.05,0.02l-0.13,0.11Z",
            name: "Guatemala"
        },
        GR: {
            path: "M487.2,174.55l-0.64,1.54l-0.43,0.24l-1.41,-0.08l-1.28,-0.28l-0.14,0.0l-3.03,0.77l-0.13,0.51l1.39,1.34l-0.78,0.29l-1.2,0.0l-1.23,-1.42l-0.47,0.02l-0.47,0.65l-0.04,0.27l0.56,1.76l0.06,0.11l1.02,1.12l-0.66,0.45l-0.04,0.46l1.39,1.35l1.15,0.79l0.02,1.06l-1.91,-0.63l-0.36,0.42l0.56,1.12l-1.2,0.23l-0.22,0.4l0.8,2.14l-1.15,0.02l-1.89,-1.15l-0.89,-2.19l-0.43,-1.91l-0.05,-0.11l-0.98,-1.35l-1.24,-1.62l-0.13,-0.63l1.07,-1.32l0.06,-0.14l0.13,-0.81l0.68,-0.36l0.16,-0.25l0.03,-0.54l1.4,-0.23l0.12,-0.05l0.87,-0.6l1.26,0.05l0.25,-0.11l0.34,-0.43l0.33,-0.07l1.81,0.08l0.13,-0.02l1.87,-0.77l1.64,0.97l0.19,0.04l2.28,-0.28l0.26,-0.29l0.02,-0.95l0.56,0.36ZM480.44,192.0l1.05,0.74l0.01,0.0l-1.26,-0.23l0.2,-0.51ZM481.76,192.79l1.86,-0.15l1.53,0.17l-0.02,0.19l0.34,0.3l-2.28,0.15l0.01,-0.13l-0.25,-0.31l-1.19,-0.22ZM485.65,193.28l0.65,-0.16l-0.05,0.12l-0.6,0.04Z",
            name: "Greece"
        },
        GQ: {
            path: "M444.81,282.04l-0.21,-0.17l0.74,-2.4l3.56,0.05l0.02,2.42l-3.34,-0.02l-0.76,0.13Z",
            name: "Equatorial Guinea"
        },
        GY: {
            path: "M271.34,264.25l1.43,0.81l1.44,1.53l0.06,1.19l0.28,0.28l0.84,0.05l2.13,1.92l-0.34,1.93l-1.37,0.59l-0.17,0.34l0.12,0.51l-0.43,1.21l0.03,0.26l1.11,1.82l0.26,0.14l0.56,0.0l0.32,1.29l1.25,1.78l-0.08,0.01l-1.34,-0.21l-0.24,0.06l-0.78,0.64l-1.06,0.41l-0.76,0.1l-0.22,0.15l-0.18,0.32l-0.95,-0.1l-1.38,-1.05l-0.19,-1.13l-0.6,-1.18l0.37,-1.96l0.65,-0.83l0.03,-0.32l-0.57,-1.17l-0.15,-0.14l-0.62,-0.27l0.25,-0.85l-0.08,-0.3l-0.58,-0.58l-0.24,-0.09l-1.15,0.1l-1.41,-1.58l0.48,-0.49l0.09,-0.22l-0.04,-0.92l1.31,-0.34l0.73,-0.52l0.04,-0.44l-0.75,-0.82l0.16,-0.66l1.74,-1.3Z",
            name: "Guyana"
        },
        GE: {
            path: "M525.41,174.19l0.26,-0.88l-0.0,-0.17l-0.63,-2.06l-0.1,-0.15l-1.45,-1.12l-0.11,-0.05l-1.31,-0.33l-0.66,-0.69l1.97,0.48l3.65,0.49l3.3,1.41l0.39,0.5l0.33,0.1l1.43,-0.45l2.14,0.58l0.7,1.14l0.13,0.12l1.06,0.47l-0.18,0.11l-0.08,0.43l1.08,1.41l-0.06,0.06l-1.16,-0.15l-1.82,-0.84l-0.31,0.04l-0.55,0.44l-3.29,0.44l-2.32,-1.41l-0.17,-0.04l-2.25,0.12Z",
            name: "Georgia"
        },
        GB: {
            path: "M412.82,118.6l-2.31,3.4l-0.0,0.33l0.31,0.13l2.52,-0.49l2.34,0.02l-0.56,2.51l-2.22,3.13l0.22,0.47l2.43,0.21l2.35,4.35l0.17,0.14l1.58,0.51l1.49,3.78l0.73,1.37l0.2,0.15l2.76,0.59l-0.25,1.75l-1.18,0.91l-0.08,0.39l0.87,1.49l-1.96,1.51l-3.31,-0.02l-4.15,0.88l-1.07,-0.59l-0.35,0.04l-1.55,1.44l-2.17,-0.35l-0.22,0.05l-1.61,1.15l-0.78,-0.38l3.31,-3.12l2.18,-0.7l0.21,-0.31l-0.26,-0.27l-3.78,-0.54l-0.48,-0.9l2.3,-0.92l0.13,-0.46l-1.29,-1.71l0.39,-1.83l3.46,0.29l0.32,-0.24l0.37,-1.99l-0.06,-0.24l-1.71,-2.17l-0.18,-0.11l-2.91,-0.58l-0.43,-0.68l0.82,-1.4l-0.03,-0.35l-0.82,-0.97l-0.46,0.01l-0.85,1.05l-0.11,-2.6l-0.05,-0.16l-1.19,-1.7l0.86,-3.53l1.81,-2.75l1.88,0.26l2.38,-0.24ZM406.39,132.84l-1.09,1.92l-1.65,-0.62l-1.26,0.02l0.41,-1.46l0.0,-0.16l-0.42,-1.51l1.62,-0.11l2.39,1.92Z",
            name: "United Kingdom"
        },
        GA: {
            path: "M448.76,294.47l-2.38,-2.34l-1.63,-2.04l-1.46,-2.48l0.06,-0.66l0.54,-0.81l0.61,-1.82l0.46,-1.69l0.63,-0.11l3.62,0.03l0.3,-0.3l-0.02,-2.75l0.88,-0.12l1.47,0.32l0.13,0.0l1.39,-0.3l-0.13,0.87l0.03,0.19l0.7,1.29l0.3,0.16l1.74,-0.19l0.36,0.29l-1.01,2.7l0.05,0.29l1.13,1.42l0.25,1.82l-0.3,1.56l-0.64,0.99l-1.93,-0.09l-1.26,-1.13l-0.5,0.17l-0.16,0.91l-1.48,0.27l-0.12,0.05l-0.86,0.63l-0.08,0.39l0.81,1.42l-1.48,1.08Z",
            name: "Gabon"
        },
        GN: {
            path: "M399.83,265.31l-0.69,-0.06l-0.3,0.16l-0.43,0.85l-0.39,-0.01l-0.3,-0.33l0.14,-0.87l-0.05,-0.22l-1.05,-1.54l-0.37,-0.11l-0.61,0.27l-0.84,0.12l0.02,-0.54l-0.04,-0.17l-0.35,-0.57l0.07,-0.63l-0.03,-0.17l-0.57,-1.11l-0.7,-0.9l-0.24,-0.12l-2.0,-0.0l-0.19,0.07l-0.51,0.42l-0.6,0.05l-0.21,0.11l-0.43,0.55l-0.3,0.7l-1.04,0.86l-0.91,-1.24l-1.0,-1.02l-0.69,-0.37l-0.52,-0.42l-0.3,-1.11l-0.37,-0.56l-0.1,-0.1l-0.4,-0.23l0.77,-0.85l0.62,0.04l0.18,-0.05l0.58,-0.38l0.46,-0.0l0.19,-0.07l0.39,-0.34l0.1,-0.3l-0.17,-0.67l0.15,-0.14l0.09,-0.2l0.03,-0.57l0.87,0.02l1.76,0.6l0.13,0.01l0.55,-0.06l0.22,-0.13l0.08,-0.12l1.18,0.17l0.17,-0.02l0.09,0.56l0.3,0.25l0.4,-0.0l0.14,-0.03l0.56,-0.29l0.23,0.05l0.63,0.59l0.15,0.07l1.07,0.2l0.24,-0.06l0.65,-0.52l0.77,-0.32l0.55,-0.32l0.3,0.04l0.44,0.45l0.34,0.74l0.84,0.87l-0.35,0.45l-0.06,0.15l-0.1,0.82l0.42,0.31l0.35,-0.16l0.05,0.04l-0.1,0.59l0.09,0.27l0.42,0.4l-0.06,0.02l-0.18,0.21l-0.2,0.86l0.03,0.21l0.56,1.02l0.52,1.71l-0.65,0.21l-0.15,0.12l-0.24,0.35l-0.03,0.28l0.16,0.41l-0.1,0.76l-0.12,0.0Z",
            name: "Guinea"
        },
        GM: {
            path: "M379.18,251.48l0.15,-0.55l2.51,-0.07l0.21,-0.09l0.48,-0.52l0.58,-0.03l0.91,0.58l0.16,0.05l0.78,0.01l0.14,-0.03l0.59,-0.31l0.16,0.24l-0.71,0.38l-0.94,-0.04l-1.02,-0.51l-0.3,0.01l-0.86,0.55l-0.37,0.02l-0.14,0.04l-0.53,0.31l-1.81,-0.04Z",
            name: "Gambia"
        },
        GL: {
            path: "M304.13,6.6l8.19,-3.63l8.72,0.28l0.19,-0.06l3.12,-2.28l8.75,-0.61l19.94,0.8l14.93,4.75l-3.92,2.01l-9.52,0.27l-13.48,0.6l-0.27,0.2l0.09,0.33l1.26,1.09l0.22,0.07l8.81,-0.67l7.49,2.07l0.19,-0.01l4.68,-1.78l1.76,1.84l-2.59,3.26l-0.01,0.36l0.34,0.11l6.35,-2.2l12.09,-2.32l7.31,1.14l1.17,2.13l-9.9,4.05l-1.43,1.32l-7.91,0.98l-0.26,0.31l0.29,0.29l5.25,0.25l-2.63,3.72l-2.02,3.61l-0.04,0.15l0.08,6.05l0.07,0.19l2.61,3.0l-3.4,0.2l-4.12,1.66l-0.04,0.54l4.5,2.67l0.53,3.9l-2.39,0.42l-0.19,0.48l2.91,3.83l-5.0,0.32l-0.27,0.22l0.12,0.33l2.69,1.84l-0.65,1.35l-3.36,0.71l-3.46,0.01l-0.21,0.51l3.05,3.15l0.02,1.53l-4.54,-1.79l-0.32,0.06l-1.29,1.26l0.11,0.5l3.33,1.15l3.17,2.74l0.85,3.29l-4.0,0.78l-1.83,-1.66l-3.1,-2.64l-0.36,-0.02l-0.13,0.33l0.8,2.92l-2.76,2.26l-0.09,0.33l0.28,0.2l6.59,0.19l2.47,0.18l-5.86,3.38l-6.76,3.43l-7.26,1.48l-2.73,0.02l-0.16,0.05l-2.67,1.72l-3.44,4.42l-5.28,2.86l-1.73,0.18l-3.33,1.01l-3.59,0.96l-0.15,0.1l-2.15,2.52l-0.07,0.19l-0.03,2.76l-1.21,2.49l-4.03,3.1l-0.1,0.33l0.98,2.94l-2.31,6.57l-3.21,0.21l-3.6,-3.0l-0.19,-0.07l-4.9,-0.02l-2.29,-1.97l-1.69,-3.78l-4.31,-4.86l-1.23,-2.52l-0.34,-3.58l-0.08,-0.17l-3.35,-3.67l0.85,-2.92l-0.09,-0.31l-1.5,-1.34l2.33,-4.7l3.67,-1.57l0.15,-0.13l1.02,-1.93l0.52,-3.47l-0.44,-0.31l-2.85,1.57l-1.33,0.64l-2.12,0.59l-2.81,-1.32l-0.15,-2.79l0.88,-2.17l2.09,-0.06l5.07,1.2l0.34,-0.17l-0.11,-0.37l-4.3,-2.9l-2.24,-1.58l-0.25,-0.05l-2.38,0.62l-1.7,-0.93l2.62,-4.1l-0.03,-0.36l-1.51,-1.75l-1.97,-3.3l-3.01,-5.21l-0.1,-0.11l-3.04,-1.85l0.03,-1.94l-0.18,-0.28l-6.82,-3.01l-5.35,-0.38l-6.69,0.21l-6.03,0.37l-2.81,-1.59l-3.84,-2.9l5.94,-1.5l5.01,-0.28l0.28,-0.29l-0.26,-0.31l-10.68,-1.38l-5.38,-2.1l0.27,-1.68l9.3,-2.6l9.18,-2.68l0.19,-0.16l0.97,-2.05l-0.18,-0.42l-6.29,-1.91l1.81,-1.9l8.58,-4.05l3.6,-0.63l0.23,-0.4l-0.92,-2.37l5.59,-1.5l7.66,-0.95l7.58,-0.05l2.65,1.84l0.31,0.02l6.52,-3.29l5.85,2.24l3.55,0.49l5.17,1.95l0.38,-0.16l-0.13,-0.39l-5.77,-3.16l0.29,-2.26Z",
            name: "Greenland"
        },
        KW: {
            path: "M540.87,207.81l0.41,0.94l-0.18,0.51l0.0,0.21l0.65,1.66l-1.15,0.05l-0.54,-1.12l-0.24,-0.17l-1.73,-0.2l1.44,-2.06l1.33,0.18Z",
            name: "Kuwait"
        },
        GH: {
            path: "M423.16,269.88l-3.58,1.34l-1.41,0.87l-2.13,0.69l-1.91,-0.61l0.09,-0.75l-0.03,-0.17l-1.04,-2.07l0.62,-2.7l1.04,-2.08l0.03,-0.19l-1.0,-5.46l0.05,-1.12l4.04,-0.11l1.08,0.18l0.18,-0.03l0.72,-0.36l0.75,0.13l-0.11,0.48l0.06,0.26l0.98,1.22l-0.0,1.77l0.24,1.99l0.05,0.13l0.55,0.81l-0.52,2.14l0.19,1.37l0.69,1.66l0.38,0.62Z",
            name: "Ghana"
        },
        OM: {
            path: "M568.16,231.0l-0.08,0.1l-0.84,1.61l-0.93,-0.11l-0.27,0.11l-0.58,0.73l-0.4,1.32l-0.01,0.14l0.29,1.61l-0.07,0.09l-1.0,-0.01l-0.16,0.04l-1.56,0.97l-0.14,0.2l-0.23,1.17l-0.41,0.4l-1.44,-0.02l-0.17,0.05l-0.98,0.65l-0.13,0.25l0.01,0.87l-0.97,0.57l-1.27,-0.22l-0.19,0.03l-1.63,0.84l-0.88,0.11l-2.55,-5.57l7.2,-2.49l0.19,-0.19l1.67,-5.23l-0.03,-0.25l-1.1,-1.78l0.05,-0.89l0.68,-1.03l0.05,-0.16l0.01,-0.89l0.96,-0.44l0.07,-0.5l-0.32,-0.26l0.16,-1.31l0.85,-0.01l1.03,1.67l0.09,0.09l1.4,0.96l0.11,0.05l1.82,0.34l1.37,0.45l1.75,2.32l0.13,0.1l0.7,0.26l-0.0,0.3l-1.25,2.19l-1.01,0.8ZM561.88,218.47l-0.01,0.02l-0.15,-0.29l0.3,-0.38l-0.14,0.65Z",
            name: "Oman"
        },
        _3: {
            path: "M543.2,261.06l-1.07,1.46l-1.65,1.99l-1.91,0.01l-8.08,-2.95l-0.89,-0.84l-0.9,-1.19l-0.81,-1.23l0.44,-0.73l0.76,-1.12l0.49,0.28l0.52,1.05l1.13,1.06l0.2,0.08l1.24,0.01l2.42,-0.65l2.77,-0.31l2.17,-0.78l1.31,-0.19l0.84,-0.43l1.03,-0.06l-0.01,4.54Z",
            name: "Somaliland"
        },
        _2: {
            path: "M384.23,230.37l0.07,-0.06l0.28,-0.89l0.99,-1.13l0.07,-0.13l0.8,-3.54l3.4,-2.8l0.09,-0.13l0.76,-2.17l0.07,5.5l-2.07,0.21l-0.24,0.17l-0.61,1.36l-0.02,0.16l0.43,3.46l-4.01,-0.01ZM391.82,218.2l0.07,-0.06l0.75,-1.93l1.86,-0.25l0.94,0.34l1.14,0.0l0.18,-0.06l0.73,-0.56l1.41,-0.08l-0.0,2.72l-7.08,-0.12Z",
            name: "Western Sahara"
        },
        _1: {
            path: "M472.71,172.84l-0.07,-0.43l-0.16,-0.22l-0.53,-0.27l-0.38,-0.58l0.3,-0.43l0.51,-0.19l0.18,-0.18l0.3,-0.87l0.12,-0.04l0.22,0.26l0.12,0.09l0.38,0.15l0.28,0.41l0.15,0.12l0.34,0.12l0.43,0.5l0.15,0.07l-0.12,0.3l-0.27,0.32l-0.03,0.18l-0.31,0.06l-1.48,0.47l-0.15,0.17Z",
            name: "Kosovo"
        },
        _0: {
            path: "M503.54,192.92l0.09,-0.17l0.41,0.01l-0.08,0.01l-0.42,0.15ZM504.23,192.76l1.02,0.02l0.4,-0.13l-0.09,0.29l0.03,0.08l-0.35,0.16l-0.24,-0.04l-0.06,-0.1l-0.18,-0.17l-0.19,-0.08l-0.33,-0.02Z",
            name: "Northern Cyprus"
        },
        JO: {
            path: "M510.26,200.93l0.28,-0.57l2.53,1.0l0.27,-0.02l4.57,-2.77l0.84,2.84l-0.28,0.25l-4.95,1.37l-0.14,0.49l2.24,2.48l-0.5,0.28l-0.13,0.14l-0.35,0.78l-1.76,0.35l-0.2,0.14l-0.57,0.94l-0.94,0.73l-2.45,-0.38l-0.03,-0.12l1.23,-4.32l-0.04,-1.1l0.34,-0.75l0.03,-0.12l0.0,-1.63Z",
            name: "Jordan"
        },
        HR: {
            path: "M455.49,162.73l1.53,0.09l0.24,-0.1l0.29,-0.34l0.64,0.38l0.14,0.04l0.98,0.06l0.32,-0.3l-0.01,-0.66l0.67,-0.25l0.19,-0.22l0.21,-1.11l1.72,-0.72l0.65,0.32l1.94,1.37l2.07,0.6l0.22,-0.02l0.67,-0.33l0.47,0.94l0.67,0.76l-0.63,0.77l-0.91,-0.55l-0.16,-0.04l-1.69,0.04l-2.2,-0.51l-1.17,0.07l-0.21,0.11l-0.36,0.42l-0.67,-0.53l-0.46,0.12l-0.52,1.29l0.05,0.31l1.21,1.42l0.58,0.99l1.15,1.14l0.95,0.68l0.92,1.23l0.1,0.09l1.75,0.91l-1.87,-0.89l-1.5,-1.11l-2.23,-0.88l-1.77,-1.9l0.12,-0.06l0.1,-0.47l-1.07,-1.22l-0.04,-0.94l-0.21,-0.27l-1.61,-0.49l-0.35,0.14l-0.53,0.93l-0.41,-0.57l0.04,-0.73Z",
            name: "Croatia"
        },
        HT: {
            path: "M237.82,234.68l1.35,0.1l1.95,0.37l0.18,1.15l-0.16,0.83l-0.51,0.37l-0.06,0.44l0.57,0.68l-0.02,0.22l-1.31,-0.35l-1.26,0.17l-1.49,-0.18l-0.15,0.02l-1.03,0.43l-1.02,-0.61l0.09,-0.36l2.04,0.32l1.9,0.21l0.19,-0.05l0.9,-0.58l0.05,-0.47l-1.05,-1.03l0.02,-0.86l-0.23,-0.3l-1.13,-0.29l0.18,-0.23Z",
            name: "Haiti"
        },
        HU: {
            path: "M461.96,157.92l0.68,-1.66l-0.03,-0.29l-0.15,-0.22l0.84,-0.0l0.3,-0.26l0.12,-0.84l0.88,0.57l0.98,0.38l0.16,0.01l2.1,-0.39l0.23,-0.21l0.14,-0.45l0.88,-0.1l1.06,-0.43l0.13,0.1l0.28,0.04l1.18,-0.4l0.14,-0.1l0.52,-0.67l0.63,-0.15l2.6,0.95l0.26,-0.03l0.38,-0.23l1.12,0.7l0.1,0.49l-1.31,0.57l-0.14,0.13l-1.18,2.14l-1.44,2.04l-1.85,0.55l-1.51,-0.13l-0.14,0.02l-1.92,0.82l-0.85,0.42l-1.91,-0.55l-1.83,-1.31l-0.74,-0.37l-0.44,-0.97l-0.26,-0.18Z",
            name: "Hungary"
        },
        HN: {
            path: "M202.48,251.87l-0.33,-0.62l-0.18,-0.14l-0.5,-0.15l0.13,-0.76l-0.11,-0.28l-0.34,-0.28l-0.6,-0.23l-0.18,-0.01l-0.81,0.22l-0.16,-0.24l-0.72,-0.39l-0.51,-0.48l-0.12,-0.07l-0.31,-0.09l0.24,-0.3l0.04,-0.3l-0.16,-0.4l0.1,-0.28l1.14,-0.69l1.0,-0.86l0.09,0.04l0.3,-0.05l0.47,-0.39l0.49,-0.03l0.14,0.13l0.29,0.06l0.31,-0.1l1.16,0.22l1.24,-0.08l0.81,-0.28l0.29,-0.25l0.63,0.1l0.69,0.18l0.65,-0.06l0.49,-0.2l1.04,0.32l0.38,0.06l0.7,0.44l0.71,0.56l0.92,0.41l0.1,0.11l-0.11,-0.01l-0.23,0.09l-0.3,0.3l-0.76,0.29l-0.58,0.0l-0.15,0.04l-0.45,0.26l-0.31,-0.07l-0.37,-0.34l-0.28,-0.07l-0.26,0.07l-0.18,0.15l-0.23,0.43l-0.04,-0.0l-0.33,0.28l-0.03,0.4l-0.76,0.61l-0.45,0.3l-0.15,0.16l-0.51,-0.36l-0.41,0.06l-0.45,0.56l-0.41,-0.01l-0.59,0.06l-0.27,0.31l0.04,0.96l-0.07,0.0l-0.25,0.16l-0.24,0.45l-0.42,0.06Z",
            name: "Honduras"
        },
        LV: {
            path: "M473.99,127.16l0.07,-2.15l1.15,-2.11l2.05,-1.07l1.84,2.48l0.25,0.12l2.01,-0.07l0.29,-0.25l0.45,-2.58l1.85,-0.56l0.98,0.4l2.13,1.33l0.16,0.05l1.97,0.01l1.02,0.7l0.21,1.67l0.71,1.84l-2.44,1.23l-1.36,0.53l-2.28,-1.62l-0.12,-0.05l-1.18,-0.2l-0.28,-0.6l-0.31,-0.17l-2.43,0.35l-4.17,-0.23l-0.12,0.02l-2.45,0.93Z",
            name: "Latvia"
        },
        PR: {
            path: "M254.95,238.31l1.15,0.21l0.2,0.23l-0.36,0.36l-1.76,-0.01l-1.2,0.07l-0.09,-0.69l0.17,-0.18l1.89,0.01Z",
            name: "Puerto Rico"
        },
        PS: {
            path: "M509.66,201.06l-0.0,1.44l-0.29,0.63l-0.59,0.19l0.02,-0.11l0.52,-0.31l-0.02,-0.53l-0.41,-0.2l0.36,-1.28l0.41,0.17Z",
            name: "West Bank"
        },
        PT: {
            path: "M398.65,173.6l0.75,-0.63l0.7,-0.3l0.51,1.2l0.28,0.18l1.48,-0.0l0.2,-0.08l0.33,-0.3l1.16,0.08l0.52,1.11l-0.95,0.66l-0.13,0.24l-0.03,2.2l-0.33,0.35l-0.08,0.18l-0.08,1.17l-0.86,0.19l-0.2,0.44l0.93,1.64l-0.64,1.79l0.07,0.31l0.72,0.72l-0.24,0.56l-0.9,1.05l-0.07,0.26l0.17,0.77l-0.73,0.54l-1.18,-0.36l-0.16,-0.0l-0.85,0.21l0.31,-1.81l-0.23,-1.87l-0.23,-0.25l-0.99,-0.24l-0.49,-0.91l0.18,-1.72l0.93,-0.99l0.08,-0.16l0.17,-1.17l0.52,-1.76l-0.04,-1.36l-0.51,-1.14l-0.09,-0.8Z",
            name: "Portugal"
        },
        PY: {
            path: "M264.33,341.43l0.93,-2.96l0.07,-1.42l1.1,-2.1l4.19,-0.73l2.22,0.04l2.12,1.21l0.07,0.76l0.7,1.38l-0.16,3.48l0.24,0.31l2.64,0.5l0.19,-0.03l0.9,-0.45l1.47,0.62l0.38,0.64l0.23,2.35l0.3,1.07l0.25,0.21l0.93,0.12l0.16,-0.02l0.8,-0.37l0.61,0.33l-0.0,1.25l-0.33,1.53l-0.5,1.57l-0.39,2.26l-2.14,1.94l-1.85,0.4l-2.74,-0.4l-2.13,-0.62l2.26,-3.75l0.03,-0.24l-0.36,-1.18l-0.17,-0.19l-2.55,-1.03l-3.04,-1.95l-2.07,-0.43l-4.4,-4.12Z",
            name: "Paraguay"
        },
        PA: {
            path: "M213.65,263.79l0.18,-0.43l0.02,-0.18l-0.06,-0.28l0.23,-0.18l-0.01,-0.48l-0.4,-0.29l-0.01,-0.62l0.57,-0.13l0.68,0.69l-0.04,0.39l0.26,0.33l1.0,0.11l0.27,-0.1l0.49,0.44l0.24,0.07l1.34,-0.22l1.04,-0.62l1.49,-0.5l0.86,-0.73l0.99,0.11l0.18,0.28l1.35,0.08l1.02,0.4l0.78,0.72l0.71,0.53l-0.1,0.12l-0.05,0.3l0.53,1.34l-0.28,0.44l-0.6,-0.13l-0.36,0.22l-0.2,0.76l-0.41,-0.36l-0.44,-1.12l0.49,-0.53l-0.14,-0.49l-0.51,-0.14l-0.41,-0.72l-0.11,-0.11l-1.25,-0.7l-0.19,-0.04l-1.1,0.16l-0.22,0.15l-0.47,0.81l-0.9,0.56l-0.49,0.08l-0.22,0.17l-0.25,0.52l0.05,0.32l0.93,1.07l-0.41,0.21l-0.29,0.3l-0.81,0.09l-0.36,-1.26l-0.53,-0.1l-0.21,0.28l-0.5,-0.09l-0.44,-0.88l-0.22,-0.16l-0.99,-0.16l-0.61,-0.28l-0.13,-0.03l-1.0,0.0Z",
            name: "Panama"
        },
        PG: {
            path: "M808.4,298.6l0.62,0.46l1.19,1.56l1.04,0.77l-0.18,0.37l-0.42,0.15l-0.92,-0.82l-1.05,-1.53l-0.27,-0.96ZM804.09,296.06l-0.3,0.26l-0.36,-1.11l-0.66,-1.06l-2.55,-1.89l-1.42,-0.59l0.17,-0.15l1.16,0.6l0.85,0.55l1.01,0.58l0.97,1.02l0.9,0.76l0.24,1.03ZM796.71,297.99l0.15,0.82l0.34,0.24l1.43,-0.19l0.19,-0.11l0.68,-0.82l1.36,-0.87l0.13,-0.31l-0.21,-1.13l1.04,-0.03l0.3,0.25l-0.04,1.17l-0.74,1.34l-1.17,0.18l-0.22,0.15l-0.35,0.62l-2.51,1.13l-1.21,-0.0l-1.99,-0.71l-1.19,-0.58l0.07,-0.28l1.98,0.32l1.46,-0.2l0.24,-0.21l0.25,-0.79ZM789.24,303.52l0.11,0.15l2.19,1.62l1.6,2.62l0.27,0.14l1.09,-0.06l-0.07,0.77l0.23,0.32l1.23,0.27l-0.14,0.09l0.05,0.53l2.39,0.95l-0.11,0.28l-1.33,0.14l-0.51,-0.55l-0.18,-0.09l-4.59,-0.65l-1.87,-1.55l-1.38,-1.35l-1.28,-2.17l-0.16,-0.13l-3.27,-1.1l-0.19,0.0l-2.12,0.72l-1.58,0.85l-0.15,0.31l0.28,1.63l-1.65,0.73l-1.37,-0.4l-2.3,-0.09l-0.08,-15.65l3.95,1.57l4.58,1.42l1.67,1.25l1.32,1.19l0.36,1.39l0.19,0.21l4.06,1.51l0.39,0.85l-1.9,0.22l-0.25,0.39l0.55,1.68Z",
            name: "Papua New Guinea"
        },
        PE: {
            path: "M246.44,329.21l-0.63,1.25l-1.05,0.54l-2.25,-1.33l-0.19,-0.93l-0.16,-0.21l-4.95,-2.58l-4.46,-2.79l-1.87,-1.52l-0.94,-1.91l0.33,-0.6l-0.01,-0.31l-2.11,-3.33l-2.46,-4.66l-2.36,-5.02l-1.04,-1.18l-0.77,-1.81l-0.08,-0.11l-1.95,-1.64l-1.54,-0.88l0.61,-0.85l0.02,-0.31l-1.15,-2.27l0.69,-1.56l1.59,-1.26l0.12,0.42l-0.56,0.47l-0.11,0.25l0.07,0.92l0.36,0.27l0.97,-0.19l0.85,0.23l0.99,1.19l0.41,0.05l1.42,-1.03l0.11,-0.16l0.46,-1.64l1.45,-2.06l2.92,-0.96l0.11,-0.07l2.73,-2.62l0.84,-1.72l0.02,-0.18l-0.3,-1.65l0.28,-0.1l1.49,1.06l0.77,1.14l0.1,0.09l1.08,0.6l1.43,2.55l0.21,0.15l1.86,0.31l0.18,-0.03l1.25,-0.6l0.77,0.37l0.17,0.03l1.4,-0.2l1.57,0.96l-1.45,2.29l0.23,0.46l0.63,0.05l0.66,0.7l-1.51,-0.08l-0.24,0.1l-0.27,0.31l-1.96,0.46l-2.95,1.74l-0.14,0.21l-0.17,1.1l-0.6,0.82l-0.05,0.23l0.21,1.13l-1.31,0.63l-0.17,0.27l0.0,0.91l-0.53,0.37l-0.1,0.37l1.04,2.27l1.31,1.46l-0.44,0.9l0.24,0.43l1.52,0.13l0.87,1.23l0.24,0.13l2.21,0.07l0.18,-0.06l1.55,-1.13l-0.14,3.22l0.23,0.3l1.14,0.29l0.16,-0.0l1.18,-0.36l1.97,3.71l-0.45,0.71l-0.04,0.14l-0.12,1.8l-0.05,2.07l-0.92,1.2l-0.03,0.31l0.38,0.8l-0.48,0.72l-0.02,0.3l1.01,2.02l-1.5,2.64Z",
            name: "Peru"
        },
        PK: {
            path: "M609.08,187.76l1.66,1.21l0.71,2.11l0.2,0.19l3.62,1.01l-1.98,1.95l-2.65,0.4l-3.75,-0.68l-0.26,0.08l-1.23,1.22l-0.07,0.31l0.89,2.46l0.88,1.92l0.1,0.12l1.67,1.14l-1.8,1.35l-0.12,0.25l0.04,1.85l-2.35,2.67l-1.59,2.79l-2.5,2.72l-2.76,-0.2l-0.24,0.09l-2.76,2.83l0.04,0.45l1.54,1.13l0.27,1.94l0.09,0.17l1.34,1.29l0.4,1.83l-5.14,-0.01l-0.22,0.09l-1.53,1.63l-1.52,-0.56l-0.76,-1.88l-1.93,-2.03l-0.25,-0.09l-4.6,0.5l-4.05,0.05l-3.1,0.33l0.77,-2.53l3.48,-1.33l0.19,-0.33l-0.21,-1.24l-0.19,-0.23l-1.01,-0.37l-0.06,-2.18l-0.17,-0.26l-2.32,-1.16l-0.96,-1.57l-0.56,-0.65l3.16,1.05l0.14,0.01l2.45,-0.4l1.44,0.33l0.3,-0.1l0.4,-0.47l1.58,0.22l0.14,-0.01l3.25,-1.14l0.2,-0.27l0.08,-2.23l1.23,-1.38l1.73,0.0l0.28,-0.2l0.22,-0.61l1.68,-0.32l0.86,0.24l0.27,-0.05l0.98,-0.78l0.11,-0.26l-0.13,-1.57l0.96,-1.52l1.51,-0.67l0.14,-0.41l-0.74,-1.4l1.86,0.07l0.26,-0.13l0.69,-1.01l0.05,-0.2l-0.09,-0.94l1.14,-1.09l0.09,-0.28l-0.29,-1.41l-0.51,-1.07l1.23,-1.05l2.6,-0.58l2.86,-0.33l1.33,-0.54l1.3,-0.29Z",
            name: "Pakistan"
        },
        PH: {
            path: "M737.11,263.82l0.25,1.66l0.14,1.34l-0.54,1.46l-0.64,-1.79l-0.5,-0.1l-1.17,1.28l-0.05,0.32l0.74,1.71l-0.49,0.81l-2.6,-1.28l-0.61,-1.57l0.68,-1.07l-0.07,-0.4l-1.59,-1.19l-0.42,0.06l-0.69,0.91l-1.01,-0.08l-0.21,0.06l-1.58,1.2l-0.17,-0.3l0.87,-1.88l1.48,-0.66l1.18,-0.81l0.71,0.92l0.34,0.1l1.9,-0.69l0.18,-0.18l0.34,-0.94l1.57,-0.06l0.29,-0.32l-0.1,-1.38l1.41,0.83l0.36,2.06ZM734.94,254.42l0.56,2.24l-1.41,-0.49l-0.4,0.3l0.07,0.94l0.51,1.3l-0.54,0.26l-0.08,-1.34l-0.25,-0.28l-0.56,-0.1l-0.23,-0.91l1.03,0.14l0.34,-0.31l-0.03,-0.96l-0.06,-0.18l-1.14,-1.44l1.62,0.04l0.57,0.78ZM724.68,238.33l1.48,0.71l0.33,-0.04l0.44,-0.38l0.05,0.13l-0.37,0.97l0.01,0.23l0.81,1.75l-0.59,1.92l-1.37,0.79l-0.14,0.2l-0.39,2.07l0.01,0.14l0.56,2.04l0.23,0.21l1.33,0.28l0.14,-0.0l1.0,-0.27l2.82,1.28l-0.2,1.16l0.12,0.29l0.66,0.5l-0.13,0.56l-1.54,-0.99l-0.89,-1.29l-0.49,0.0l-0.44,0.65l-1.34,-1.28l-0.26,-0.08l-2.18,0.36l-0.96,-0.44l0.09,-0.72l0.69,-0.57l-0.01,-0.47l-0.75,-0.59l-0.47,0.14l-0.15,0.43l-0.86,-1.02l-0.34,-1.02l-0.07,-1.74l0.49,0.41l0.49,-0.21l0.26,-3.99l0.73,-2.1l1.23,0.0ZM731.12,258.92l-0.82,0.75l-0.83,1.64l-0.52,0.5l-1.17,-1.33l0.36,-0.47l0.62,-0.7l0.07,-0.15l0.24,-1.35l0.73,-0.08l-0.31,1.29l0.16,0.34l0.37,-0.09l1.21,-1.6l-0.12,1.24ZM726.66,255.58l0.85,0.45l0.14,0.03l1.28,-0.0l-0.03,0.62l-1.04,0.96l-1.15,0.55l-0.05,-0.71l0.17,-1.26l-0.01,-0.13l-0.16,-0.51ZM724.92,252.06l-0.45,1.5l-0.7,-0.83l-0.95,-1.43l1.44,0.06l0.67,0.7ZM717.48,261.28l-1.87,1.35l0.21,-0.3l1.81,-1.57l1.5,-1.75l0.97,-1.84l0.23,1.08l-1.56,1.33l-1.29,1.7Z",
            name: "Philippines"
        },
        PL: {
            path: "M458.8,144.25l-0.96,-1.98l0.18,-1.06l-0.01,-0.15l-0.62,-1.8l-0.82,-1.11l0.56,-0.73l0.05,-0.28l-0.51,-1.51l1.48,-0.87l3.88,-1.58l3.06,-1.14l2.23,0.52l0.15,0.66l0.29,0.23l2.4,0.04l3.11,0.39l4.56,-0.05l1.12,0.32l0.51,0.89l0.1,1.45l0.03,0.12l0.66,1.23l-0.01,1.08l-1.33,0.61l-0.14,0.41l0.74,1.5l0.07,1.53l1.22,2.79l-0.19,0.66l-1.09,0.33l-0.14,0.09l-2.27,2.72l-0.04,0.31l0.35,0.8l-2.22,-1.16l-0.21,-0.02l-1.72,0.44l-1.1,-0.31l-0.21,0.02l-1.3,0.61l-1.11,-1.02l-0.32,-0.05l-0.81,0.35l-1.15,-1.61l-0.21,-0.12l-1.65,-0.17l-0.19,-0.82l-0.23,-0.23l-1.72,-0.37l-0.34,0.17l-0.25,0.56l-0.88,-0.44l0.12,-0.69l-0.25,-0.35l-1.78,-0.27l-1.08,-0.97Z",
            name: "Poland"
        },
        ZM: {
            path: "M502.81,308.32l1.09,1.04l0.58,1.94l-0.39,0.66l-0.5,2.05l-0.0,0.14l0.45,1.95l-0.69,0.77l-0.06,0.11l-0.76,2.37l0.15,0.36l0.62,0.31l-6.85,1.9l-0.22,0.33l0.2,1.54l-1.62,0.3l-0.12,0.05l-1.43,1.02l-0.11,0.15l-0.25,0.73l-0.73,0.17l-0.14,0.08l-2.18,2.12l-1.33,1.6l-0.65,0.05l-0.83,-0.29l-2.75,-0.28l-0.24,-0.1l-0.15,-0.27l-0.99,-0.58l-0.12,-0.04l-1.73,-0.14l-1.88,0.54l-1.5,-1.48l-1.61,-2.01l0.11,-7.73l4.92,0.03l0.29,-0.37l-0.19,-0.79l0.34,-0.86l0.0,-0.21l-0.41,-1.11l0.26,-1.14l-0.01,-0.16l-0.12,-0.36l0.18,0.01l0.1,0.56l0.31,0.25l1.14,-0.06l1.44,0.21l0.76,1.05l0.19,0.12l2.01,0.35l0.19,-0.03l1.24,-0.65l0.44,1.03l0.22,0.18l1.81,0.34l0.85,0.99l1.02,1.39l0.24,0.12l1.92,0.02l0.3,-0.32l-0.21,-2.74l-0.47,-0.23l-0.53,0.36l-1.58,-0.89l-0.51,-0.34l0.29,-2.36l0.44,-2.99l-0.03,-0.18l-0.5,-0.99l0.61,-1.38l0.53,-0.24l3.26,-0.41l0.89,0.23l1.01,0.62l1.04,0.44l1.6,0.43l1.35,0.72Z",
            name: "Zambia"
        },
        EE: {
            path: "M482.19,120.88l0.23,-1.68l-0.43,-0.31l-0.75,0.37l-1.34,-1.1l-0.18,-1.75l2.92,-0.95l3.07,-0.53l2.66,0.6l2.48,-0.1l0.18,0.31l-1.65,1.96l-0.06,0.26l0.71,3.25l-0.88,0.94l-1.85,-0.01l-2.08,-1.3l-1.14,-0.47l-0.2,-0.01l-1.69,0.51Z",
            name: "Estonia"
        },
        EG: {
            path: "M508.07,208.8l-0.66,1.06l-0.53,2.03l-0.64,1.32l-0.32,0.26l-1.74,-1.85l-1.77,-3.86l-0.48,-0.09l-0.26,0.25l-0.07,0.32l1.04,2.88l1.55,2.76l1.89,4.18l0.94,1.48l0.83,1.54l2.08,2.73l-0.3,0.28l-0.1,0.23l0.08,1.72l0.11,0.22l2.91,2.37l-28.78,0.0l0.0,-19.06l-0.73,-2.2l0.61,-1.59l0.0,-0.2l-0.34,-1.04l0.73,-1.08l3.13,-0.04l2.36,0.72l2.48,0.81l1.15,0.43l0.23,-0.01l1.93,-0.87l1.02,-0.78l2.08,-0.21l1.59,0.31l0.62,1.24l0.52,0.03l0.46,-0.71l1.86,0.59l1.95,0.16l0.17,-0.04l0.92,-0.52l1.48,4.24Z",
            name: "Egypt"
        },
        ZA: {
            path: "M467.06,373.27l-0.13,-0.29l0.01,-1.58l-0.02,-0.12l-0.71,-1.64l0.59,-0.37l0.14,-0.26l-0.07,-2.13l-0.05,-0.15l-1.63,-2.58l-1.25,-2.31l-1.71,-3.37l0.88,-0.98l0.7,0.52l0.39,1.08l0.23,0.19l1.1,0.19l1.55,0.51l0.14,0.01l1.35,-0.2l0.11,-0.04l2.24,-1.39l0.14,-0.25l0.0,-9.4l0.16,0.09l1.39,2.38l-0.22,1.53l0.04,0.19l0.56,0.94l0.3,0.14l1.79,-0.27l0.16,-0.08l1.23,-1.18l1.17,-0.79l0.1,-0.12l0.57,-1.19l1.02,-0.52l0.9,0.28l1.16,0.73l0.14,0.05l2.04,0.13l0.13,-0.02l1.6,-0.62l0.18,-0.19l0.63,-1.93l1.18,-0.19l0.19,-0.12l0.78,-1.05l0.81,-1.71l2.18,-1.91l3.44,-1.88l0.89,0.02l1.17,0.43l0.21,-0.0l0.76,-0.29l1.07,0.21l1.15,3.55l0.63,1.82l-0.44,2.9l0.1,0.52l-0.74,-0.29l-0.18,-0.01l-0.72,0.19l-0.21,0.2l-0.22,0.74l-0.66,0.97l-0.05,0.18l0.02,0.93l0.09,0.21l1.49,1.46l0.27,0.08l1.47,-0.29l0.22,-0.18l0.43,-1.01l1.29,0.02l-0.51,1.63l-0.29,2.2l-0.59,1.12l-2.2,1.78l-1.06,1.39l-0.72,1.44l-1.39,1.93l-2.81,2.84l-1.75,1.65l-1.85,1.24l-2.55,1.06l-1.23,0.14l-0.24,0.18l-0.22,0.54l-1.27,-0.35l-0.2,0.01l-1.15,0.5l-2.62,-0.52l-0.12,0.0l-1.46,0.33l-0.98,-0.14l-0.16,0.02l-2.55,1.1l-2.11,0.44l-1.59,1.07l-0.93,0.06l-0.97,-0.92l-0.19,-0.08l-0.72,-0.04l-1.0,-1.16l-0.25,0.05ZM493.72,359.24l-1.12,-0.86l-0.31,-0.03l-1.23,0.59l-1.36,1.07l-1.39,1.78l0.01,0.38l1.88,2.11l0.31,0.09l0.9,-0.27l0.18,-0.15l0.4,-0.77l1.28,-0.39l0.18,-0.16l0.42,-0.88l0.76,-1.32l-0.05,-0.37l-0.87,-0.82Z",
            name: "South Africa"
        },
        EC: {
            path: "M220.2,293.48l1.25,-1.76l0.02,-0.31l-0.54,-1.09l-0.5,-0.06l-0.78,0.94l-1.03,-0.75l0.33,-0.46l0.05,-0.23l-0.38,-2.04l0.66,-0.28l0.17,-0.19l0.45,-1.52l0.93,-1.58l0.04,-0.2l-0.13,-0.78l1.19,-0.47l1.57,-0.91l2.35,1.34l0.17,0.04l0.28,-0.02l0.52,0.91l0.21,0.15l2.12,0.35l0.2,-0.03l0.55,-0.31l1.08,0.73l0.97,0.54l0.31,1.67l-0.71,1.49l-2.64,2.54l-2.95,0.97l-0.15,0.11l-1.53,2.18l-0.49,1.68l-1.1,0.8l-0.87,-1.05l-0.15,-0.1l-1.01,-0.27l-0.13,-0.0l-0.7,0.14l-0.03,-0.43l0.6,-0.5l0.1,-0.31l-0.26,-0.91Z",
            name: "Ecuador"
        },
        AL: {
            path: "M470.27,171.7l0.38,0.19l0.45,-0.18l0.4,0.61l0.11,0.1l0.46,0.24l0.13,0.87l-0.3,0.95l-0.0,0.17l0.36,1.28l0.12,0.17l0.9,0.63l-0.03,0.44l-0.67,0.35l-0.16,0.22l-0.14,0.88l-0.96,1.18l-0.06,-0.03l-0.04,-0.48l-0.12,-0.22l-1.28,-0.92l-0.19,-1.25l0.2,-1.96l0.33,-0.89l-0.06,-0.3l-0.36,-0.41l-0.13,-0.75l0.66,-0.9Z",
            name: "Albania"
        },
        AO: {
            path: "M461.62,299.93l0.55,1.67l0.73,1.54l1.56,2.18l0.28,0.12l1.66,-0.2l0.81,-0.34l1.28,0.33l0.33,-0.14l0.39,-0.67l0.56,-1.3l1.37,-0.09l0.27,-0.21l0.07,-0.23l0.67,-0.01l-0.13,0.53l0.29,0.37l2.74,-0.02l0.04,1.29l0.03,0.13l0.46,0.87l-0.35,1.52l0.18,1.55l0.07,0.16l0.75,0.85l-0.13,2.89l0.41,0.29l0.56,-0.21l1.11,0.05l1.5,-0.37l0.9,0.12l0.18,0.53l-0.27,1.15l0.01,0.17l0.4,1.08l-0.33,0.85l-0.01,0.18l0.12,0.51l-4.83,-0.03l-0.3,0.3l-0.12,8.13l0.07,0.19l1.69,2.1l1.27,1.25l-4.03,0.92l-5.93,-0.36l-1.66,-1.19l-0.18,-0.06l-10.15,0.11l-0.34,0.13l-1.35,-1.05l-0.17,-0.06l-1.62,-0.08l-1.6,0.45l-0.88,0.36l-0.17,-1.2l0.34,-2.19l0.85,-2.32l0.14,-1.13l0.79,-2.24l0.57,-1.0l1.42,-1.64l0.82,-1.15l0.05,-0.13l0.26,-1.88l-0.13,-1.51l-0.07,-0.16l-0.72,-0.87l-1.23,-2.91l0.09,-0.37l0.73,-0.95l0.05,-0.27l-1.27,-4.12l-1.19,-1.54l0.1,-0.2l0.86,-0.28l0.78,0.03l0.83,-0.29l7.12,0.03ZM451.81,298.94l-0.17,0.07l-0.5,-1.42l0.85,-0.92l0.53,-0.29l0.48,0.44l-0.56,0.32l-0.1,0.1l-0.41,0.65l-0.05,0.14l-0.07,0.91Z",
            name: "Angola"
        },
        KZ: {
            path: "M598.42,172.08l-1.37,0.54l-3.3,2.09l-0.11,0.12l-1.01,1.97l-0.56,0.01l-0.6,-1.24l-0.26,-0.17l-2.95,-0.09l-0.46,-2.22l-0.29,-0.24l-0.91,-0.02l0.17,-2.72l-0.12,-0.26l-3.0,-2.22l-0.2,-0.06l-4.29,0.24l-2.8,0.42l-2.36,-2.7l-6.4,-3.65l-0.23,-0.03l-6.45,1.83l-0.22,0.29l0.1,10.94l-0.84,0.1l-1.65,-2.21l-0.11,-0.09l-1.69,-0.84l-0.2,-0.02l-2.84,0.63l-0.14,0.07l-0.71,0.64l-0.02,-0.11l0.57,-1.17l0.0,-0.26l-0.48,-1.05l-0.17,-0.16l-2.78,-0.99l-1.08,-2.62l-0.13,-0.15l-1.24,-0.7l-0.04,-0.48l2.07,0.25l0.34,-0.29l0.09,-2.03l1.84,-0.44l2.12,0.45l0.36,-0.25l0.45,-3.04l-0.45,-2.06l-0.31,-0.23l-2.44,0.15l-2.07,-0.75l-0.23,0.01l-2.88,1.38l-2.21,0.62l-0.96,-0.38l0.22,-1.39l-0.06,-0.23l-1.6,-2.12l-0.25,-0.12l-1.72,0.08l-1.87,-1.91l1.33,-2.24l-0.06,-0.38l-0.55,-0.5l1.72,-3.08l2.3,1.7l0.48,-0.2l0.29,-2.26l4.99,-3.48l3.76,-0.08l5.46,2.27l2.96,1.33l0.26,-0.01l2.59,-1.36l3.82,-0.06l3.13,1.67l0.38,-0.09l0.63,-0.85l3.36,0.14l0.29,-0.19l0.63,-1.57l-0.13,-0.37l-3.64,-2.05l2.0,-1.36l0.1,-0.38l-0.32,-0.62l2.09,-0.76l0.13,-0.47l-1.65,-2.13l0.89,-0.91l9.27,-1.18l0.13,-0.05l1.17,-0.82l6.2,-1.27l2.26,-1.43l4.19,0.7l0.74,3.39l0.38,0.22l2.52,-0.81l2.9,1.06l-0.18,1.63l0.32,0.33l2.52,-0.23l5.0,-2.58l0.03,0.39l3.16,2.62l5.57,8.48l0.49,0.02l1.18,-1.53l3.22,1.78l0.21,0.03l3.5,-0.83l1.21,0.52l1.16,1.82l0.15,0.12l1.67,0.61l1.01,1.32l0.28,0.11l3.04,-0.41l1.1,1.64l-1.68,1.89l-1.97,0.28l-0.26,0.29l-0.12,3.09l-1.2,1.23l-4.81,-1.01l-0.35,0.2l-1.77,5.51l-1.14,0.62l-4.92,1.23l-0.2,0.41l2.14,5.06l-1.45,0.67l-0.17,0.31l0.15,1.28l-1.05,-0.3l-1.21,-1.04l-0.17,-0.07l-3.73,-0.32l-4.15,-0.08l-0.92,0.31l-3.46,-1.24l-0.22,0.01l-1.42,0.63l-0.17,0.21l-0.32,1.49l-3.82,-0.97l-0.15,0.0l-1.65,0.43l-0.2,0.17l-0.51,1.21Z",
            name: "Kazakhstan"
        },
        ET: {
            path: "M516.0,247.63l1.21,0.92l0.3,0.04l1.3,-0.53l0.46,0.41l0.19,0.08l1.65,0.03l2.05,0.96l0.67,0.88l1.07,0.79l1.0,1.45l0.7,0.68l-0.72,0.92l-0.85,1.19l-0.04,0.25l0.19,0.67l0.04,0.74l0.29,0.28l1.4,0.04l0.55,-0.15l0.23,0.19l-0.41,0.67l0.01,0.32l0.92,1.39l0.93,1.23l0.99,0.94l0.1,0.06l8.19,2.99l1.51,0.01l-6.51,6.95l-3.14,0.11l-0.18,0.06l-2.15,1.71l-1.51,0.04l-0.22,0.1l-0.6,0.69l-1.46,-0.0l-0.93,-0.78l-0.32,-0.04l-2.29,1.05l-0.12,0.1l-0.64,0.9l-1.44,-0.17l-0.51,-0.26l-0.17,-0.03l-0.56,0.07l-0.68,-0.02l-3.1,-2.08l-0.17,-0.05l-1.62,0.0l-0.68,-0.65l0.0,-1.28l-0.21,-0.29l-1.19,-0.38l-1.42,-2.63l-0.13,-0.12l-1.05,-0.53l-0.46,-1.0l-1.27,-1.23l-0.17,-0.08l-1.08,-0.13l0.53,-0.9l1.17,-0.05l0.26,-0.17l0.37,-0.77l0.03,-0.14l-0.03,-2.23l0.7,-2.49l1.08,-0.65l0.14,-0.19l0.24,-1.0l1.03,-1.85l1.47,-1.22l0.09,-0.12l1.02,-2.51l0.36,-1.96l2.62,0.48l0.33,-0.18l0.63,-1.55Z",
            name: "Ethiopia"
        },
        ZW: {
            path: "M498.95,341.2l-1.16,-0.23l-0.16,0.01l-0.74,0.28l-1.11,-0.41l-1.02,-0.04l-1.52,-1.13l-0.12,-0.05l-1.79,-0.37l-0.65,-1.46l-0.01,-0.86l-0.22,-0.29l-0.99,-0.26l-2.74,-2.77l-0.77,-1.46l-0.52,-0.5l-0.72,-1.54l2.24,0.23l0.78,0.28l0.12,0.02l0.85,-0.06l0.21,-0.11l1.38,-1.66l2.11,-2.05l0.81,-0.18l0.22,-0.2l0.27,-0.8l1.29,-0.93l1.53,-0.28l0.11,0.66l0.3,0.25l2.02,-0.05l1.04,0.48l0.5,0.59l0.18,0.1l1.13,0.18l1.11,0.7l0.01,3.06l-0.49,1.82l-0.11,1.94l0.03,0.16l0.35,0.68l-0.24,1.3l-0.27,0.17l-0.12,0.15l-0.64,1.83l-2.49,2.8Z",
            name: "Zimbabwe"
        },
        ES: {
            path: "M398.67,172.8l0.09,-1.45l-0.06,-0.2l-0.82,-1.05l3.16,-1.96l3.01,0.54l3.33,-0.02l2.64,0.52l2.14,-0.15l3.9,0.1l0.91,1.08l0.14,0.09l4.61,1.38l0.26,-0.04l0.77,-0.55l2.66,1.29l0.17,0.03l2.59,-0.35l0.1,1.28l-2.2,1.85l-3.13,0.62l-0.23,0.23l-0.21,0.92l-1.54,1.68l-0.97,2.4l0.02,0.26l0.85,1.46l-1.27,1.14l-0.09,0.14l-0.5,1.73l-1.73,0.53l-0.15,0.1l-1.68,2.1l-3.03,0.04l-2.38,-0.05l-0.17,0.05l-1.57,1.01l-0.9,1.01l-0.96,-0.19l-0.82,-0.86l-0.69,-1.6l-0.22,-0.18l-2.14,-0.41l-0.13,-0.62l0.83,-0.97l0.39,-0.86l-0.06,-0.33l-0.73,-0.73l0.63,-1.74l-0.02,-0.25l-0.8,-1.41l0.69,-0.15l0.23,-0.27l0.09,-1.29l0.33,-0.36l0.08,-0.2l0.03,-2.16l1.03,-0.72l0.1,-0.37l-0.7,-1.5l-0.25,-0.17l-1.46,-0.11l-0.22,0.07l-0.34,0.3l-1.17,0.0l-0.55,-1.29l-0.39,-0.16l-1.02,0.44l-0.45,0.36Z",
            name: "Spain"
        },
        ER: {
            path: "M527.15,253.05l-0.77,-0.74l-1.01,-1.47l-1.14,-0.86l-0.62,-0.84l-0.11,-0.09l-2.18,-1.02l-0.12,-0.03l-1.61,-0.03l-0.52,-0.46l-0.31,-0.05l-1.31,0.54l-1.38,-1.06l-0.46,0.12l-0.69,1.68l-2.49,-0.46l-0.2,-0.76l1.06,-3.69l0.24,-1.65l0.66,-0.66l1.76,-0.4l0.16,-0.1l0.97,-1.13l1.24,2.55l0.68,2.34l0.09,0.14l1.4,1.27l3.39,2.4l1.37,1.43l2.14,2.34l0.94,0.6l-0.32,0.26l-0.85,-0.17Z",
            name: "Eritrea"
        },
        ME: {
            path: "M469.05,172.9l-0.57,-0.8l-0.1,-0.09l-0.82,-0.46l0.16,-0.33l0.35,-1.57l0.72,-0.62l0.27,-0.16l0.48,0.38l0.35,0.4l0.12,0.08l0.79,0.32l0.66,0.43l-0.43,0.62l-0.28,0.11l-0.07,-0.25l-0.53,-0.1l-1.09,1.49l-0.05,0.23l0.06,0.32Z",
            name: "Montenegro"
        },
        MD: {
            path: "M488.2,153.75l0.14,-0.11l1.49,-0.28l1.75,0.95l1.06,0.14l0.92,0.7l-0.15,0.9l0.15,0.31l0.8,0.46l0.33,1.2l0.09,0.14l0.72,0.66l-0.11,0.28l0.1,0.33l-0.06,0.02l-1.25,-0.08l-0.17,-0.29l-0.39,-0.12l-0.52,0.25l-0.16,0.36l0.13,0.42l-0.6,0.88l-0.43,1.03l-0.22,0.12l-0.32,-1.0l0.25,-1.34l-0.08,-1.38l-0.06,-0.17l-1.43,-1.87l-0.81,-1.36l-0.78,-0.95l-0.12,-0.09l-0.29,-0.12Z",
            name: "Moldova"
        },
        MG: {
            path: "M544.77,316.45l0.64,1.04l0.6,1.62l0.4,3.04l0.63,1.21l-0.22,1.07l-0.15,0.26l-0.59,-1.05l-0.52,-0.01l-0.47,0.76l-0.04,0.23l0.46,1.84l-0.19,0.92l-0.61,0.53l-0.1,0.21l-0.16,2.15l-0.97,2.98l-1.24,3.59l-1.55,4.97l-0.96,3.67l-1.08,2.93l-1.94,0.61l-2.05,1.06l-3.2,-1.53l-0.62,-1.26l-0.18,-2.39l-0.87,-2.07l-0.22,-1.8l0.4,-1.69l1.01,-0.4l0.19,-0.28l0.01,-0.79l1.15,-1.91l0.04,-0.11l0.23,-1.66l-0.03,-0.17l-0.57,-1.21l-0.46,-1.58l-0.19,-2.25l0.82,-1.36l0.33,-1.51l1.11,-0.1l1.4,-0.53l0.9,-0.45l1.03,-0.03l0.21,-0.09l1.41,-1.45l2.12,-1.65l0.75,-1.29l0.03,-0.24l-0.17,-0.56l0.53,0.15l0.32,-0.1l1.38,-1.77l0.06,-0.18l0.04,-1.44l0.54,-0.74l0.62,0.77Z",
            name: "Madagascar"
        },
        MA: {
            path: "M378.66,230.13l0.07,-0.75l0.93,-0.72l0.82,-1.37l0.04,-0.21l-0.14,-0.8l0.8,-1.74l1.33,-1.61l0.79,-0.4l0.14,-0.15l0.66,-1.55l0.08,-1.46l0.83,-1.52l1.6,-0.94l0.11,-0.11l1.56,-2.71l1.2,-0.99l2.24,-0.29l0.17,-0.08l1.95,-1.83l1.3,-0.77l2.09,-2.28l0.07,-0.26l-0.61,-3.34l0.92,-2.3l0.33,-1.44l1.52,-1.79l2.48,-1.27l1.86,-1.16l0.1,-0.11l1.67,-2.93l0.72,-1.59l1.54,0.01l1.43,1.14l0.21,0.06l2.33,-0.19l2.55,0.62l0.97,0.03l0.83,1.6l0.15,1.71l0.86,2.96l0.09,0.14l0.5,0.45l-0.31,0.73l-3.11,0.44l-0.16,0.07l-1.07,0.97l-1.36,0.23l-0.25,0.28l-0.1,1.85l-2.74,1.02l-0.14,0.11l-0.9,1.3l-1.93,0.69l-2.56,0.44l-4.04,2.01l-0.17,0.27l0.02,2.91l-0.08,0.0l-0.3,0.31l0.05,1.15l-1.25,0.07l-0.16,0.06l-0.73,0.55l-0.98,0.0l-0.85,-0.33l-0.15,-0.02l-2.11,0.29l-0.24,0.19l-0.76,1.95l-0.63,0.16l-0.21,0.19l-1.15,3.29l-3.42,2.81l-0.1,0.17l-0.81,3.57l-0.98,1.12l-0.3,0.85l-5.13,0.19Z",
            name: "Morocco"
        },
        UZ: {
            path: "M587.83,186.48l0.06,-1.46l-0.19,-0.29l-3.31,-1.24l-2.57,-1.4l-1.63,-1.38l-2.79,-1.98l-1.2,-2.98l-0.12,-0.14l-0.84,-0.54l-0.18,-0.05l-2.61,0.13l-0.76,-0.48l-0.25,-2.25l-0.17,-0.24l-3.37,-1.6l-0.32,0.04l-2.08,1.73l-2.11,1.02l-0.16,0.35l0.31,1.14l-2.14,0.03l-0.09,-10.68l6.1,-1.74l6.25,3.57l2.36,2.72l0.27,0.1l2.92,-0.44l4.17,-0.23l2.78,2.06l-0.18,2.87l0.29,0.32l0.98,0.02l0.46,2.22l0.28,0.24l3.0,0.09l0.61,1.25l0.28,0.17l0.93,-0.02l0.26,-0.16l1.06,-2.06l3.21,-2.03l1.3,-0.5l0.19,0.08l-1.75,1.62l0.05,0.48l1.85,1.12l0.27,0.02l1.65,-0.69l2.4,1.27l-2.69,1.79l-1.79,-0.27l-0.89,0.06l-0.22,-0.52l0.48,-1.26l-0.34,-0.4l-3.35,0.69l-0.22,0.18l-0.78,1.87l-1.07,1.47l-1.93,-0.13l-0.29,0.16l-0.65,1.29l0.16,0.42l1.69,0.64l0.48,1.91l-1.25,2.6l-1.64,-0.53l-1.18,-0.03Z",
            name: "Uzbekistan"
        },
        MM: {
            path: "M670.1,233.39l-1.46,1.11l-1.68,0.11l-0.26,0.19l-1.1,2.7l-0.95,0.42l-0.14,0.42l1.21,2.27l1.61,1.92l0.94,1.55l-0.82,1.99l-0.77,0.42l-0.13,0.39l0.64,1.35l1.62,1.97l0.26,1.32l-0.04,1.15l0.02,0.13l0.92,2.18l-1.3,2.23l-0.79,1.69l-0.1,-0.77l0.74,-1.87l-0.02,-0.26l-0.8,-1.42l0.2,-2.68l-0.06,-0.2l-0.98,-1.27l-0.8,-2.98l-0.45,-3.22l-1.11,-2.22l-0.45,-0.1l-1.64,1.28l-2.74,1.76l-1.26,-0.2l-1.27,-0.49l0.79,-2.93l0.0,-0.14l-0.52,-2.42l-1.93,-2.97l0.26,-0.8l-0.22,-0.39l-1.37,-0.31l-1.65,-1.98l-0.12,-1.5l0.41,0.19l0.42,-0.26l0.05,-1.7l1.08,-0.54l0.16,-0.34l-0.24,-1.0l0.5,-0.79l0.05,-0.15l0.08,-2.35l1.58,0.49l0.36,-0.15l1.12,-2.19l0.15,-1.34l1.35,-2.18l0.04,-0.17l-0.07,-1.35l2.97,-1.71l1.67,0.45l0.38,-0.33l-0.18,-1.46l0.7,-0.4l0.15,-0.32l-0.13,-0.72l0.94,-0.13l0.74,1.41l0.11,0.12l0.95,0.56l0.07,1.89l-0.09,2.08l-2.28,2.15l-0.09,0.19l-0.3,3.15l0.35,0.32l2.37,-0.39l0.53,2.17l0.2,0.21l1.3,0.42l-0.63,1.9l0.14,0.36l1.86,0.99l1.1,0.49l0.24,0.0l1.45,-0.6l0.04,0.51l-2.01,1.6l-0.56,0.96l-1.34,0.56Z",
            name: "Myanmar"
        },
        ML: {
            path: "M390.79,248.2l0.67,-0.37l0.14,-0.18l0.36,-1.31l0.51,-0.04l1.68,0.69l0.21,0.0l1.34,-0.48l0.89,0.16l0.3,-0.13l0.29,-0.44l9.89,-0.04l0.29,-0.21l0.56,-1.8l-0.11,-0.33l-0.33,-0.24l-2.37,-22.1l3.41,-0.04l8.37,5.73l8.38,5.68l0.56,1.15l0.14,0.14l1.56,0.75l0.99,0.36l0.03,1.45l0.33,0.29l2.45,-0.22l0.01,5.52l-1.3,1.64l-0.06,0.15l-0.18,1.37l-1.99,0.36l-3.4,0.22l-0.19,0.09l-0.85,0.83l-1.48,0.09l-1.49,0.01l-0.54,-0.43l-0.26,-0.05l-1.38,0.36l-2.39,1.08l-0.13,0.12l-0.44,0.73l-1.88,1.11l-0.11,0.12l-0.3,0.57l-0.86,0.42l-1.1,-0.31l-0.28,0.07l-0.69,0.62l-0.09,0.16l-0.35,1.66l-1.93,2.04l-0.08,0.23l0.05,0.76l-0.63,0.99l-0.04,0.19l0.14,1.23l-0.81,0.29l-0.32,0.17l-0.27,-0.75l-0.39,-0.18l-0.65,0.26l-0.36,-0.04l-0.29,0.14l-0.37,0.6l-1.69,-0.02l-0.63,-0.34l-0.32,0.02l-0.12,0.09l-0.47,-0.45l0.1,-0.6l-0.09,-0.27l-0.31,-0.3l-0.33,-0.05l-0.05,0.02l0.02,-0.21l0.46,-0.59l-0.02,-0.39l-0.99,-1.02l-0.34,-0.74l-0.56,-0.56l-0.17,-0.09l-0.5,-0.07l-0.19,0.04l-0.58,0.35l-0.79,0.33l-0.65,0.51l-0.85,-0.16l-0.63,-0.59l-0.14,-0.07l-0.41,-0.08l-0.2,0.03l-0.59,0.31l-0.07,0.0l-0.1,-0.63l0.11,-0.85l-0.21,-0.98l-0.11,-0.17l-0.86,-0.66l-0.45,-1.34l-0.1,-1.36Z",
            name: "Mali"
        },
        MN: {
            path: "M641.06,150.59l2.41,-0.53l4.76,-2.8l3.67,-1.49l2.06,0.96l0.12,0.03l2.5,0.05l1.59,1.45l0.19,0.08l2.47,0.12l3.59,0.81l0.27,-0.07l2.43,-2.28l0.06,-0.36l-0.93,-1.77l2.33,-3.1l2.66,1.3l2.26,0.39l2.75,0.8l0.44,2.3l0.19,0.22l3.56,1.38l0.18,0.01l2.35,-0.6l3.1,-0.42l2.4,0.41l2.37,1.52l1.49,1.63l0.23,0.1l2.29,-0.03l3.13,0.52l0.15,-0.01l2.28,-0.79l3.27,-0.53l0.11,-0.04l3.56,-2.23l1.31,0.31l1.26,1.05l0.22,0.07l2.45,-0.22l-0.98,1.96l-1.77,3.21l-0.01,0.28l0.64,1.31l0.35,0.16l1.35,-0.38l2.4,0.48l0.22,-0.04l1.78,-1.09l1.82,0.92l2.11,2.07l-0.17,0.68l-1.79,-0.31l-3.74,0.45l-1.85,0.96l-1.78,2.01l-3.74,1.18l-2.46,1.61l-2.45,-0.6l-1.42,-0.28l-0.31,0.13l-1.31,1.99l0.0,0.33l0.78,1.15l0.3,0.74l-1.58,0.93l-1.75,1.59l-2.83,1.03l-3.77,0.12l-4.05,1.05l-2.81,1.54l-0.95,-0.8l-0.19,-0.07l-2.96,0.0l-3.64,-1.8l-2.55,-0.48l-3.38,0.41l-5.13,-0.67l-2.66,0.06l-1.35,-1.65l-1.12,-2.78l-0.21,-0.18l-1.5,-0.33l-2.98,-1.89l-0.12,-0.04l-3.37,-0.43l-2.84,-0.51l-0.75,-1.13l0.93,-3.54l-0.04,-0.24l-1.73,-2.55l-0.15,-0.12l-3.52,-1.18l-1.99,-1.61l-0.54,-1.85Z",
            name: "Mongolia"
        },
        MK: {
            path: "M472.73,173.87l0.08,0.01l0.32,-0.25l0.08,-0.44l1.29,-0.41l1.37,-0.28l1.03,-0.04l1.06,0.82l0.14,1.59l-0.22,0.04l-0.17,0.11l-0.32,0.4l-1.2,-0.05l-0.18,0.05l-0.9,0.61l-1.45,0.23l-0.85,-0.59l-0.3,-1.09l0.22,-0.71Z",
            name: "Macedonia"
        },
        MW: {
            path: "M507.18,313.84l-0.67,1.85l-0.01,0.16l0.7,3.31l0.31,0.24l0.75,-0.03l0.78,0.71l0.99,1.75l0.2,3.03l-0.91,0.45l-0.14,0.15l-0.59,1.38l-1.24,-1.21l-0.17,-1.62l0.49,-1.12l0.02,-0.16l-0.15,-1.03l-0.13,-0.21l-0.99,-0.65l-0.26,-0.03l-0.53,0.18l-1.31,-1.12l-1.15,-0.59l0.66,-2.06l0.75,-0.84l0.07,-0.27l-0.47,-2.04l0.48,-1.94l0.4,-0.65l0.03,-0.24l-0.64,-2.15l-0.08,-0.13l-0.44,-0.42l1.34,0.26l1.25,1.73l0.67,3.3Z",
            name: "Malawi"
        },
        MR: {
            path: "M390.54,247.66l-1.48,-1.58l-1.51,-1.88l-0.12,-0.09l-1.64,-0.67l-1.17,-0.74l-0.17,-0.05l-1.4,0.03l-0.12,0.03l-1.14,0.52l-1.15,-0.21l-0.26,0.08l-0.44,0.43l-0.11,-0.72l0.68,-1.29l0.31,-2.43l-0.28,-2.63l-0.29,-1.27l0.24,-1.24l-0.03,-0.2l-0.65,-1.24l-1.19,-1.05l0.32,-0.51l9.64,0.02l0.3,-0.34l-0.46,-3.71l0.51,-1.12l2.17,-0.22l0.27,-0.3l-0.08,-6.5l7.91,0.13l0.31,-0.3l0.01,-3.5l8.17,5.63l-2.89,0.04l-0.29,0.33l2.42,22.56l0.12,0.21l0.26,0.19l-0.43,1.38l-9.83,0.04l-0.25,0.13l-0.27,0.41l-0.77,-0.14l-0.15,0.01l-1.3,0.47l-1.64,-0.67l-0.14,-0.02l-0.79,0.06l-0.27,0.22l-0.39,1.39l-0.53,0.29Z",
            name: "Mauritania"
        },
        UG: {
            path: "M500.74,287.17l-2.84,-0.02l-0.92,0.32l-1.37,0.71l-0.29,-0.12l0.02,-1.6l0.54,-0.89l0.04,-0.13l0.14,-1.96l0.49,-1.09l0.91,-1.24l0.97,-0.68l0.8,-0.89l-0.13,-0.49l-0.79,-0.27l0.13,-2.55l0.78,-0.52l1.45,0.51l0.18,0.01l1.97,-0.57l1.72,0.01l0.18,-0.06l1.29,-0.97l0.98,1.44l0.29,1.24l1.05,2.75l-0.84,1.68l-1.94,2.66l-0.06,0.18l0.02,2.36l-4.8,0.18Z",
            name: "Uganda"
        },
        MY: {
            path: "M717.6,273.52l-1.51,0.7l-2.13,-0.41l-2.88,-0.0l-0.29,0.21l-0.84,2.77l-0.9,0.82l-0.08,0.12l-1.23,3.34l-1.81,0.47l-2.29,-0.68l-0.14,-0.01l-1.2,0.22l-0.14,0.07l-1.36,1.18l-1.47,-0.17l-0.12,0.01l-1.46,0.46l-1.51,-1.25l-0.24,-0.97l1.26,0.59l0.2,0.02l1.93,-0.47l0.22,-0.22l0.47,-1.98l0.9,-0.4l2.97,-0.54l0.17,-0.09l1.8,-1.98l1.02,-1.32l0.9,1.03l0.48,-0.04l0.43,-0.7l1.02,0.07l0.32,-0.27l0.25,-2.72l1.84,-1.67l1.23,-1.89l0.73,-0.01l1.12,1.11l0.1,0.99l0.18,0.24l1.66,0.71l1.85,0.67l-0.09,0.51l-1.45,0.11l-0.26,0.4l0.35,0.97ZM673.78,269.53l0.17,1.14l0.35,0.25l1.65,-0.3l0.18,-0.11l0.68,-0.86l0.31,0.13l1.41,1.45l0.99,1.59l0.13,1.57l-0.26,1.09l0.0,0.15l0.24,0.84l0.18,1.46l0.11,0.2l0.82,0.64l0.92,2.08l-0.03,0.52l-1.4,0.13l-2.29,-1.79l-2.86,-1.92l-0.27,-1.16l-0.07,-0.13l-1.39,-1.61l-0.33,-1.99l-0.05,-0.12l-0.84,-1.27l0.26,-1.72l-0.03,-0.18l-0.45,-0.87l0.13,-0.13l1.71,0.92Z",
            name: "Malaysia"
        },
        MX: {
            path: "M133.41,213.83l0.61,0.09l0.27,-0.09l0.93,-1.01l0.08,-0.18l0.09,-1.22l-0.09,-0.23l-1.93,-1.94l-1.46,-0.77l-2.96,-5.62l-0.86,-2.1l2.44,-0.18l2.68,-0.25l-0.03,0.08l0.17,0.4l3.79,1.35l5.81,1.97l6.96,-0.02l0.3,-0.3l0.0,-0.84l3.91,0.0l0.87,0.93l1.27,0.87l1.44,1.17l0.79,1.37l0.62,1.49l0.12,0.14l1.35,0.85l2.08,0.82l0.35,-0.1l1.49,-2.04l1.81,-0.05l1.63,1.01l1.21,1.8l0.86,1.58l1.47,1.55l0.53,1.82l0.73,1.32l0.14,0.13l1.98,0.84l1.78,0.59l0.61,-0.03l-0.78,1.89l-0.45,1.96l-0.19,3.58l-0.24,1.27l0.01,0.14l0.43,1.43l0.78,1.31l0.49,1.98l0.06,0.12l1.63,1.9l0.61,1.51l0.98,1.28l0.16,0.11l2.58,0.67l0.98,1.02l0.31,0.08l2.17,-0.71l1.91,-0.26l1.87,-0.47l1.67,-0.49l1.59,-1.06l0.11,-0.14l0.6,-1.52l0.22,-2.21l0.35,-0.62l1.58,-0.64l2.59,-0.59l2.18,0.09l1.43,-0.2l0.39,0.36l-0.07,1.02l-1.28,1.48l-0.65,1.68l0.07,0.32l0.33,0.32l-0.79,2.49l-0.28,-0.3l-0.24,-0.09l-1.0,0.08l-0.24,0.15l-0.74,1.28l-0.19,-0.13l-0.28,-0.03l-0.3,0.12l-0.19,0.29l0.0,0.06l-4.34,-0.02l-0.3,0.3l-0.0,1.16l-0.83,0.0l-0.28,0.19l0.08,0.33l0.93,0.86l0.9,0.58l0.24,0.48l0.16,0.15l0.2,0.08l-0.03,0.38l-2.94,0.01l-0.26,0.15l-1.21,2.09l0.02,0.33l0.25,0.33l-0.21,0.44l-0.04,0.22l-2.42,-2.35l-1.36,-0.87l-2.04,-0.67l-0.13,-0.01l-1.4,0.19l-2.07,0.98l-1.14,0.23l-1.72,-0.66l-1.85,-0.48l-2.31,-1.16l-1.92,-0.38l-2.79,-1.18l-2.04,-1.2l-0.6,-0.66l-0.19,-0.1l-1.37,-0.15l-2.45,-0.78l-1.07,-1.18l-2.63,-1.44l-1.2,-1.56l-0.44,-0.93l0.5,-0.15l0.2,-0.39l-0.2,-0.58l0.46,-0.55l0.07,-0.19l0.01,-0.91l-0.06,-0.18l-0.81,-1.13l-0.25,-1.08l-0.86,-1.36l-2.21,-2.63l-2.53,-2.09l-1.2,-1.63l-0.11,-0.09l-2.08,-1.06l-0.34,-0.48l0.35,-1.53l-0.16,-0.34l-1.24,-0.61l-1.39,-1.23l-0.6,-1.81l-0.24,-0.2l-1.25,-0.2l-1.38,-1.35l-1.11,-1.25l-0.1,-0.76l-0.05,-0.13l-1.33,-2.04l-0.85,-2.02l0.04,-0.99l-0.14,-0.27l-1.81,-1.1l-0.2,-0.04l-0.74,0.11l-1.34,-0.72l-0.42,0.16l-0.4,1.12l-0.0,0.19l0.41,1.3l0.24,2.04l0.06,0.15l0.88,1.16l1.84,1.86l0.4,0.61l0.12,0.1l0.27,0.14l0.29,0.82l0.31,0.2l0.2,-0.02l0.43,1.51l0.09,0.14l0.72,0.65l0.51,0.91l1.58,1.4l0.8,2.42l0.77,1.23l0.66,1.19l0.13,1.34l0.28,0.27l1.08,0.08l0.92,1.1l0.83,1.08l-0.03,0.24l-0.88,0.81l-0.13,-0.0l-0.59,-1.42l-0.07,-0.11l-1.67,-1.53l-1.81,-1.28l-1.15,-0.61l0.07,-1.85l-0.38,-1.45l-0.12,-0.17l-2.91,-2.03l-0.39,0.04l-0.11,0.11l-0.42,-0.46l-0.11,-0.08l-1.49,-0.63l-1.09,-1.16Z",
            name: "Mexico"
        },
        VU: {
            path: "M839.92,325.66l0.78,0.73l-0.18,0.07l-0.6,-0.8ZM839.13,322.74l0.27,1.36l-0.13,-0.06l-0.21,-0.02l-0.29,0.08l-0.22,-0.43l-0.03,-1.32l0.61,0.4Z",
            name: "Vanuatu"
        },
        FR: {
            path: "M444.58,172.63l-0.68,1.92l-0.72,-0.38l-0.51,-1.79l0.43,-0.95l1.15,-0.83l0.33,2.04ZM429.71,147.03l1.77,1.57l0.26,0.07l1.16,-0.23l2.12,1.44l0.56,0.28l0.16,0.03l0.61,-0.06l1.09,0.78l0.13,0.05l3.18,0.53l-1.09,1.94l-0.3,2.16l-0.48,0.38l-1.0,-0.26l-0.37,0.32l0.07,0.66l-1.73,1.68l-0.09,0.21l-0.04,1.42l0.41,0.29l0.96,-0.4l0.67,1.07l-0.09,0.78l0.04,0.19l0.61,0.97l-0.71,0.78l-0.07,0.28l0.65,2.39l0.21,0.21l1.09,0.31l-0.2,0.95l-2.08,1.58l-4.81,-0.8l-0.13,0.01l-3.65,0.99l-0.22,0.24l-0.25,1.6l-2.59,0.35l-2.74,-1.33l-0.31,0.03l-0.79,0.57l-4.38,-1.31l-0.79,-0.94l1.16,-1.64l0.05,-0.15l0.48,-6.17l-0.06,-0.21l-2.58,-3.3l-1.89,-1.65l-0.11,-0.06l-3.64,-1.17l-0.2,-1.88l2.92,-0.63l4.14,0.82l0.35,-0.36l-0.65,-3.0l1.77,1.05l0.27,0.02l5.83,-2.54l0.17,-0.19l0.71,-2.54l1.75,-0.53l0.27,0.88l0.27,0.21l1.04,0.05l1.08,1.23ZM289.1,278.45l-0.85,0.84l-0.88,0.13l-0.25,-0.51l-0.21,-0.16l-0.56,-0.1l-0.25,0.07l-0.63,0.55l-0.62,-0.29l0.5,-0.88l0.21,-1.11l0.42,-1.05l-0.03,-0.28l-0.93,-1.42l-0.18,-1.54l1.13,-1.87l2.42,0.78l2.55,2.04l0.33,0.81l-1.4,2.16l-0.77,1.84Z",
            name: "France"
        },
        FI: {
            path: "M492.26,76.42l-0.38,3.12l0.12,0.28l3.6,2.69l-2.14,2.96l-0.01,0.33l2.83,4.61l-1.61,3.36l0.03,0.31l2.15,2.87l-0.96,2.44l0.1,0.35l3.51,2.55l-0.81,1.72l-2.28,2.19l-5.28,4.79l-4.51,0.31l-4.39,1.37l-3.87,0.75l-1.34,-1.89l-0.11,-0.09l-2.23,-1.14l0.53,-3.54l-0.01,-0.14l-1.17,-3.37l1.12,-2.13l2.23,-2.44l5.69,-4.33l1.65,-0.84l0.16,-0.31l-0.26,-1.73l-0.15,-0.22l-3.4,-1.91l-0.77,-1.47l-0.07,-6.45l-0.12,-0.24l-3.91,-2.94l-3.0,-1.92l0.97,-0.76l2.6,2.17l0.21,0.07l3.2,-0.21l2.63,1.03l0.3,-0.05l2.39,-1.94l0.09,-0.13l1.18,-3.12l3.63,-1.42l2.87,1.59l-0.98,2.87Z",
            name: "Finland"
        },
        FJ: {
            path: "M869.98,327.07l-1.31,0.44l-0.14,-0.41l0.96,-0.41l0.85,-0.17l1.43,-0.78l-0.16,0.65l-1.64,0.67ZM867.58,329.12l0.54,0.47l-0.31,1.0l-1.32,0.3l-1.13,-0.26l-0.17,-0.78l0.72,-0.66l0.98,0.27l0.25,-0.04l0.43,-0.29Z",
            name: "Fiji"
        },
        FK: {
            path: "M268.15,427.89l2.6,-1.73l1.98,0.77l0.31,-0.05l1.32,-1.17l1.58,1.18l-0.54,0.84l-3.1,0.92l-1.0,-1.04l-0.39,-0.04l-1.9,1.35l-0.86,-1.04Z",
            name: "Falkland Islands"
        },
        NI: {
            path: "M202.1,252.6l0.23,-0.0l0.12,-0.11l0.68,-0.09l0.22,-0.15l0.23,-0.43l0.2,-0.01l0.28,-0.31l-0.04,-0.97l0.29,-0.03l0.5,0.02l0.25,-0.11l0.37,-0.46l0.51,0.35l0.4,-0.06l0.23,-0.28l0.45,-0.29l0.87,-0.7l0.11,-0.21l0.02,-0.26l0.23,-0.12l0.25,-0.48l0.29,0.27l0.14,0.07l0.5,0.12l0.22,-0.03l0.48,-0.28l0.66,-0.02l0.87,-0.33l0.36,-0.32l0.21,0.01l-0.11,0.48l0.0,0.14l0.22,0.8l-0.54,0.85l-0.27,1.03l-0.09,1.18l0.14,0.72l0.05,0.95l-0.24,0.15l-0.13,0.19l-0.23,1.09l0.0,0.14l0.14,0.53l-0.42,0.53l-0.06,0.24l0.12,0.69l0.08,0.15l0.18,0.19l-0.26,0.23l-0.49,-0.11l-0.35,-0.44l-0.16,-0.1l-0.79,-0.21l-0.23,0.03l-0.45,0.26l-1.51,-0.62l-0.31,0.05l-0.17,0.15l-1.81,-1.62l-0.6,-0.9l-1.04,-0.79l-0.77,-0.71Z",
            name: "Nicaragua"
        },
        NL: {
            path: "M436.22,136.65l1.82,0.08l0.36,0.89l-0.6,2.96l-0.53,1.06l-1.32,0.0l-0.3,0.34l0.35,2.89l-0.83,-0.47l-1.56,-1.43l-0.29,-0.07l-2.26,0.67l-1.02,-0.15l0.68,-0.48l0.1,-0.12l2.14,-4.84l3.25,-1.35Z",
            name: "Netherlands"
        },
        NO: {
            path: "M491.45,67.31l7.06,3.0l-2.52,0.94l-0.11,0.49l2.43,2.49l-3.82,1.59l-1.48,0.3l0.89,-2.61l-0.14,-0.36l-3.21,-1.78l-0.25,-0.02l-3.89,1.52l-0.17,0.17l-1.2,3.17l-2.19,1.78l-2.53,-0.99l-0.13,-0.02l-3.15,0.21l-2.69,-2.25l-0.38,-0.01l-1.43,1.11l-1.47,0.17l-0.26,0.26l-0.33,2.57l-4.42,-0.65l-0.33,0.22l-0.6,2.19l-2.17,-0.01l-0.27,0.16l-4.15,7.68l-3.88,5.76l-0.0,0.33l0.81,1.23l-0.7,1.27l-2.3,-0.06l-0.28,0.18l-1.63,3.72l-0.02,0.13l0.15,5.17l0.07,0.18l1.51,1.84l-0.79,4.24l-2.04,2.5l-0.92,1.75l-1.39,-1.88l-0.44,-0.05l-4.89,4.21l-3.16,0.81l-3.24,-1.74l-0.86,-3.82l-0.78,-8.6l2.18,-2.36l6.56,-3.28l5.0,-4.16l4.63,-5.74l5.99,-8.09l4.17,-3.23l6.84,-5.49l5.39,-1.92l4.06,0.24l0.23,-0.09l3.72,-3.67l4.51,0.19l4.4,-0.89ZM484.58,19.95l4.42,1.82l-3.25,2.68l-7.14,0.65l-7.16,-0.91l-0.39,-1.37l-0.28,-0.22l-3.48,-0.1l-2.25,-2.15l7.09,-1.48l3.55,1.36l0.28,-0.03l2.42,-1.66l6.18,1.41ZM481.99,33.92l-4.73,1.85l-3.76,-1.06l1.27,-1.02l0.04,-0.43l-1.18,-1.35l4.46,-0.94l0.89,1.83l0.17,0.15l2.83,0.96ZM466.5,23.95l7.64,3.87l-5.63,1.94l-0.19,0.19l-1.35,3.88l-2.08,0.96l-0.16,0.19l-1.14,4.18l-2.71,0.18l-4.94,-2.95l1.95,-1.63l-0.08,-0.51l-3.7,-1.54l-4.79,-4.54l-1.78,-4.01l6.29,-1.88l1.25,1.81l0.25,0.13l3.57,-0.08l0.26,-0.17l0.87,-1.79l3.41,-0.18l3.08,1.94Z",
            name: "Norway"
        },
        NA: {
            path: "M461.88,357.98l-1.61,-1.77l-0.94,-1.9l-0.54,-2.58l-0.62,-1.95l-0.83,-4.05l-0.06,-3.13l-0.33,-1.5l-0.07,-0.14l-0.95,-1.06l-1.27,-2.12l-1.3,-3.1l-0.59,-1.71l-1.98,-2.46l-0.13,-1.67l0.99,-0.4l1.44,-0.42l1.48,0.07l1.42,1.11l0.31,0.03l0.32,-0.15l9.99,-0.11l1.66,1.18l0.16,0.06l6.06,0.37l4.69,-1.06l2.01,-0.57l1.5,0.14l0.63,0.37l-1.0,0.41l-0.7,0.01l-0.16,0.05l-1.38,0.88l-0.79,-0.88l-0.29,-0.09l-3.83,0.9l-1.84,0.08l-0.29,0.3l-0.07,8.99l-2.18,0.08l-0.29,0.3l-0.0,17.47l-2.04,1.27l-1.21,0.18l-1.51,-0.49l-0.99,-0.18l-0.36,-1.0l-0.1,-0.14l-0.99,-0.74l-0.4,0.04l-0.98,1.09Z",
            name: "Namibia"
        },
        NC: {
            path: "M835.87,338.68l2.06,1.63l1.01,0.94l-0.49,0.32l-1.21,-0.62l-1.76,-1.16l-1.58,-1.36l-1.61,-1.79l-0.16,-0.41l0.54,0.02l1.32,0.83l1.08,0.87l0.79,0.73Z",
            name: "New Caledonia"
        },
        NE: {
            path: "M426.67,254.17l0.03,-1.04l-0.24,-0.3l-2.66,-0.53l-0.06,-1.0l-0.07,-0.17l-1.37,-1.62l-0.3,-1.04l0.15,-0.94l1.37,-0.09l0.19,-0.09l0.85,-0.83l3.34,-0.22l2.22,-0.41l0.24,-0.26l0.2,-1.5l1.32,-1.65l0.07,-0.19l-0.01,-5.74l3.4,-1.13l7.24,-5.12l8.46,-4.95l3.76,1.08l1.35,1.39l0.36,0.05l1.39,-0.77l0.55,3.66l0.12,0.2l0.82,0.6l0.03,0.69l0.1,0.21l0.87,0.74l-0.47,0.99l-0.96,5.26l-0.13,3.25l-3.08,2.34l-0.1,0.15l-1.08,3.37l0.08,0.31l0.94,0.86l-0.01,1.51l0.29,0.3l1.25,0.05l-0.14,0.66l-0.51,0.11l-0.24,0.26l-0.06,0.57l-0.04,0.0l-1.59,-2.62l-0.21,-0.14l-0.59,-0.1l-0.23,0.05l-1.83,1.33l-1.79,-0.68l-1.42,-0.17l-0.17,0.03l-0.65,0.32l-1.39,-0.07l-0.19,0.06l-1.4,1.03l-1.12,0.05l-2.97,-1.29l-0.26,0.01l-1.12,0.59l-1.08,-0.04l-0.85,-0.88l-0.11,-0.07l-2.51,-0.95l-0.14,-0.02l-2.69,0.3l-0.16,0.07l-0.65,0.55l-0.1,0.16l-0.34,1.41l-0.69,0.98l-0.05,0.15l-0.13,1.72l-1.47,-1.13l-0.18,-0.06l-0.9,0.01l-0.2,0.08l-0.32,0.28Z",
            name: "Niger"
        },
        NG: {
            path: "M442.0,272.7l-2.4,0.83l-0.88,-0.12l-0.19,0.04l-0.89,0.52l-1.78,-0.05l-1.23,-1.44l-0.88,-1.87l-1.77,-1.66l-0.21,-0.08l-3.78,0.03l0.13,-3.75l-0.06,-1.58l0.44,-1.47l0.74,-0.75l1.21,-1.56l0.04,-0.29l-0.22,-0.56l0.44,-0.9l0.01,-0.24l-0.54,-1.44l0.26,-2.97l0.72,-1.06l0.33,-1.37l0.51,-0.43l2.53,-0.28l2.38,0.9l0.89,0.91l0.2,0.09l1.28,0.04l0.15,-0.03l1.06,-0.56l2.9,1.26l0.13,0.02l1.28,-0.06l0.16,-0.06l1.39,-1.02l1.36,0.07l0.15,-0.03l0.64,-0.32l1.22,0.13l1.9,0.73l0.28,-0.04l1.86,-1.35l0.33,0.06l1.62,2.67l0.29,0.14l0.32,-0.04l0.73,0.74l-0.19,0.37l-0.12,0.74l-2.03,1.89l-0.07,0.11l-0.66,1.62l-0.35,1.28l-0.48,0.51l-0.07,0.12l-0.48,1.67l-1.26,0.98l-0.1,0.15l-0.38,1.24l-0.58,1.07l-0.2,0.91l-1.43,0.7l-1.26,-0.93l-0.19,-0.06l-0.95,0.04l-0.2,0.09l-1.41,1.39l-0.61,0.02l-0.26,0.17l-1.19,2.42l-0.61,1.67Z",
            name: "Nigeria"
        },
        NZ: {
            path: "M857.9,379.62l1.85,3.1l0.33,0.14l0.22,-0.28l0.04,-1.41l0.57,0.4l0.35,2.06l0.17,0.22l2.02,0.94l1.78,0.26l0.22,-0.06l1.31,-1.01l0.84,0.22l-0.53,2.27l-0.67,1.5l-1.71,-0.05l-0.25,0.12l-0.67,0.89l-0.05,0.23l0.21,1.15l-0.31,0.46l-2.15,3.57l-1.6,0.99l-0.28,-0.51l-0.15,-0.13l-0.72,-0.3l1.27,-2.15l0.01,-0.29l-0.82,-1.63l-0.15,-0.14l-2.5,-1.09l0.05,-0.69l1.67,-0.94l0.15,-0.21l0.42,-2.24l-0.11,-1.95l-0.03,-0.12l-0.97,-1.85l0.05,-0.41l-0.09,-0.25l-1.18,-1.17l-1.94,-2.49l-0.86,-1.64l0.38,-0.09l1.24,1.43l0.12,0.08l1.81,0.68l0.67,2.39ZM853.93,393.55l0.57,1.24l0.44,0.12l1.51,-1.03l0.52,0.91l0.0,1.09l-0.88,1.31l-1.62,2.2l-1.26,1.2l-0.05,0.38l0.64,1.02l-1.4,0.03l-0.14,0.04l-2.14,1.16l-0.14,0.17l-0.67,2.0l-1.38,3.06l-3.07,2.19l-2.12,-0.06l-1.55,-0.99l-0.14,-0.05l-2.53,-0.2l-0.31,-0.84l1.25,-2.15l3.07,-2.97l1.62,-0.59l1.81,-1.17l2.18,-1.63l1.55,-1.65l1.08,-2.18l0.9,-0.72l0.11,-0.17l0.35,-1.56l1.37,-1.07l0.4,0.91Z",
            name: "New Zealand"
        },
        NP: {
            path: "M641.26,213.53l-0.14,0.95l0.32,1.64l-0.21,0.78l-1.83,0.04l-2.98,-0.62l-1.86,-0.25l-1.37,-1.3l-0.18,-0.08l-3.38,-0.34l-3.21,-1.49l-2.38,-1.34l-2.16,-0.92l0.84,-2.2l1.51,-1.18l0.89,-0.57l1.83,0.77l2.5,1.76l1.39,0.41l0.78,1.21l0.17,0.13l1.91,0.53l2.0,1.17l2.92,0.66l2.63,0.24Z",
            name: "Nepal"
        },
        CI: {
            path: "M413.53,272.08l-0.83,0.02l-1.79,-0.49l-1.64,0.03l-3.04,0.46l-1.73,0.72l-2.4,0.89l-0.12,-0.02l0.16,-1.7l0.19,-0.25l0.06,-0.2l-0.08,-0.99l-0.09,-0.19l-1.06,-1.05l-0.15,-0.08l-0.71,-0.15l-0.51,-0.48l0.45,-0.92l0.02,-0.19l-0.24,-1.16l0.07,-0.43l0.14,-0.0l0.3,-0.26l0.15,-1.1l-0.02,-0.15l-0.13,-0.34l0.09,-0.13l0.83,-0.27l0.19,-0.37l-0.62,-2.02l-0.55,-1.0l0.14,-0.59l0.35,-0.14l0.24,-0.16l0.53,0.29l0.14,0.04l1.93,0.02l0.26,-0.14l0.36,-0.58l0.39,0.01l0.43,-0.17l0.28,0.79l0.43,0.16l0.56,-0.31l0.89,-0.32l0.92,0.45l0.39,0.75l0.14,0.13l1.13,0.53l0.3,-0.03l0.81,-0.59l1.02,-0.08l1.49,0.57l0.62,3.33l-1.03,2.09l-0.65,2.84l0.02,0.2l1.05,2.08l-0.07,0.64Z",
            name: "Ivory Coast"
        },
        CH: {
            path: "M444.71,156.27l0.05,0.3l-0.34,0.69l0.13,0.4l1.13,0.58l1.07,0.1l-0.12,0.81l-0.87,0.42l-1.75,-0.37l-0.34,0.18l-0.47,1.1l-0.86,0.07l-0.33,-0.38l-0.41,-0.04l-1.34,1.01l-1.02,0.13l-0.93,-0.58l-0.82,-1.32l-0.37,-0.12l-0.77,0.32l0.02,-0.84l1.74,-1.69l0.09,-0.25l-0.04,-0.38l0.73,0.19l0.26,-0.06l0.6,-0.48l2.02,0.02l0.24,-0.12l0.38,-0.51l2.31,0.84Z",
            name: "Switzerland"
        },
        CO: {
            path: "M232.24,284.95l-0.94,-0.52l-1.22,-0.82l-0.31,-0.01l-0.62,0.35l-1.88,-0.31l-0.54,-0.95l-0.29,-0.15l-0.37,0.03l-2.34,-1.33l-0.15,-0.35l0.57,-0.11l0.24,-0.32l-0.1,-1.15l0.46,-0.71l1.11,-0.15l0.21,-0.13l1.05,-1.57l0.95,-1.31l-0.08,-0.43l-0.73,-0.47l0.4,-1.24l0.01,-0.16l-0.53,-2.15l0.44,-0.54l0.06,-0.24l-0.4,-2.13l-0.06,-0.13l-0.93,-1.22l0.21,-0.8l0.52,0.12l0.32,-0.13l0.47,-0.75l0.03,-0.27l-0.52,-1.32l0.09,-0.11l1.14,0.07l0.22,-0.08l1.82,-1.71l0.96,-0.25l0.22,-0.28l0.02,-0.81l0.43,-2.01l1.28,-1.04l1.48,-0.05l0.27,-0.19l0.12,-0.31l1.73,0.19l0.2,-0.05l1.96,-1.28l0.97,-0.56l1.16,-1.16l0.64,0.11l0.43,0.44l-0.31,0.55l-1.49,0.39l-0.19,0.16l-0.6,1.2l-0.97,0.74l-0.73,0.94l-0.06,0.13l-0.3,1.76l-0.68,1.44l0.23,0.43l1.1,0.14l0.27,0.97l0.08,0.13l0.49,0.49l0.17,0.85l-0.27,0.86l-0.01,0.14l0.09,0.53l0.2,0.23l0.52,0.18l0.54,0.79l0.27,0.13l3.18,-0.24l1.31,0.29l1.7,2.08l0.31,0.1l0.96,-0.26l1.75,0.13l1.41,-0.27l0.56,0.27l-0.36,1.07l-0.54,0.81l-0.05,0.13l-0.2,1.8l0.51,1.79l0.07,0.12l0.65,0.68l0.05,0.32l-1.16,1.14l0.05,0.47l0.86,0.52l0.6,0.79l0.31,1.01l-0.7,-0.81l-0.44,-0.01l-0.74,0.77l-4.75,-0.05l-0.3,0.31l0.03,1.57l0.25,0.29l1.2,0.21l-0.02,0.24l-0.1,-0.05l-0.22,-0.02l-1.41,0.41l-0.22,0.29l-0.01,1.82l0.11,0.23l1.04,0.85l0.35,1.3l-0.06,1.02l-1.02,6.26l-0.84,-0.89l-0.19,-0.09l-0.25,-0.02l1.35,-2.13l-0.1,-0.42l-1.92,-1.17l-0.2,-0.04l-1.41,0.2l-0.82,-0.39l-0.26,0.0l-1.29,0.62l-1.63,-0.27l-1.4,-2.5l-0.12,-0.12l-1.1,-0.61l-0.83,-1.2l-1.67,-1.19l-0.27,-0.04l-0.54,0.19Z",
            name: "Colombia"
        },
        CN: {
            path: "M740.32,148.94l0.22,0.21l4.3,1.03l2.84,2.2l0.99,2.92l0.28,0.2l3.8,0.0l0.15,-0.04l2.13,-1.24l3.5,-0.8l-1.05,2.29l-0.95,1.13l-0.06,0.12l-0.85,3.41l-1.56,2.81l-2.83,-0.51l-0.19,0.03l-2.15,1.09l-0.15,0.34l0.65,2.59l-0.33,3.3l-1.03,0.07l-0.28,0.3l0.01,0.75l-1.09,-1.2l-0.48,0.05l-0.94,1.6l-3.76,1.26l-0.2,0.36l0.29,1.19l-1.67,-0.08l-1.11,-0.88l-0.42,0.05l-1.69,2.08l-2.71,1.57l-2.04,1.88l-3.42,0.84l-0.11,0.05l-1.8,1.34l-1.54,0.46l0.52,-0.53l0.06,-0.33l-0.44,-0.96l1.84,-1.84l0.02,-0.41l-1.32,-1.56l-0.36,-0.08l-2.23,1.08l-2.83,2.06l-1.52,1.85l-2.32,0.13l-0.2,0.09l-1.28,1.37l-0.03,0.37l1.32,1.97l0.18,0.13l1.83,0.43l0.07,1.08l0.18,0.26l1.98,0.84l0.3,-0.03l2.66,-1.96l2.06,1.04l0.12,0.03l1.4,0.07l0.27,1.0l-3.24,0.73l-0.17,0.11l-1.13,1.5l-2.38,1.4l-0.1,0.1l-1.29,1.99l0.1,0.42l2.6,1.5l0.97,2.72l1.52,2.56l1.66,2.08l-0.03,1.76l-1.4,0.67l-0.15,0.38l0.6,1.47l0.13,0.15l1.29,0.75l-0.35,2.0l-0.58,1.96l-1.22,0.21l-0.2,0.14l-1.83,2.93l-2.02,3.51l-2.29,3.13l-3.4,2.42l-3.42,2.18l-2.75,0.3l-0.15,0.06l-1.32,1.01l-0.68,-0.67l-0.41,-0.01l-1.37,1.27l-3.42,1.28l-2.62,0.4l-0.24,0.21l-0.8,2.57l-0.95,0.11l-0.53,-1.54l0.52,-0.89l-0.19,-0.44l-3.36,-0.84l-0.17,0.01l-1.09,0.4l-2.36,-0.64l-1.0,-0.9l0.35,-1.34l-0.23,-0.37l-2.22,-0.47l-1.15,-0.94l-0.36,-0.02l-2.08,1.37l-2.35,0.29l-1.98,-0.01l-0.13,0.03l-1.32,0.63l-1.28,0.38l-0.21,0.33l0.33,2.65l-0.78,-0.04l-0.14,-0.39l-0.07,-1.04l-0.41,-0.26l-1.72,0.71l-0.96,-0.43l-1.63,-0.86l0.65,-1.95l-0.19,-0.38l-1.43,-0.46l-0.56,-2.27l-0.34,-0.22l-2.26,0.38l0.25,-2.65l2.29,-2.15l0.09,-0.2l0.1,-2.21l-0.07,-2.09l-0.15,-0.25l-1.02,-0.6l-0.8,-1.52l-0.31,-0.16l-1.42,0.2l-2.16,-0.32l0.55,-0.74l0.01,-0.35l-1.17,-1.7l-0.41,-0.08l-1.67,1.07l-1.97,-0.63l-0.25,0.03l-2.89,1.73l-2.26,1.99l-1.82,0.3l-1.0,-0.66l-0.15,-0.05l-1.28,-0.06l-1.75,-0.61l-0.24,0.02l-1.35,0.69l-0.1,0.08l-1.2,1.45l-0.14,-1.41l-0.4,-0.25l-1.46,0.55l-2.83,-0.26l-2.77,-0.61l-1.99,-1.17l-1.91,-0.54l-0.78,-1.21l-0.17,-0.13l-1.36,-0.38l-2.54,-1.79l-2.01,-0.84l-0.28,0.02l-0.89,0.56l-3.31,-1.83l-2.35,-1.67l-0.57,-2.49l1.34,0.28l0.36,-0.28l0.08,-1.42l-0.05,-0.19l-0.93,-1.34l0.24,-2.18l-0.07,-0.22l-2.69,-3.32l-0.15,-0.1l-3.97,-1.11l-0.69,-2.05l-0.11,-0.15l-1.79,-1.3l-0.39,-0.73l-0.36,-1.57l0.08,-1.09l-0.18,-0.3l-1.52,-0.66l-0.22,-0.01l-0.51,0.18l-0.52,-2.21l0.59,-0.55l0.06,-0.35l-0.22,-0.44l2.12,-1.24l1.63,-0.55l2.58,0.39l0.31,-0.16l0.87,-1.75l3.05,-0.34l0.21,-0.12l0.84,-1.12l3.87,-1.59l0.15,-0.14l0.35,-0.68l0.03,-0.17l-0.17,-1.51l1.52,-0.7l0.15,-0.39l-2.12,-5.0l4.62,-1.15l1.35,-0.72l0.14,-0.17l1.72,-5.37l4.7,0.99l0.28,-0.08l1.39,-1.43l0.08,-0.2l0.11,-2.95l1.83,-0.26l0.18,-0.1l1.85,-2.08l0.61,-0.17l0.57,1.97l0.1,0.15l2.2,1.75l3.48,1.17l1.59,2.36l-0.93,3.53l0.04,0.24l0.9,1.35l0.2,0.13l2.98,0.53l3.32,0.43l2.97,1.89l1.49,0.35l1.08,2.67l1.52,1.88l0.24,0.11l2.74,-0.07l5.15,0.67l3.36,-0.41l2.39,0.43l3.67,1.81l0.13,0.03l2.92,-0.0l1.02,0.86l0.34,0.03l2.88,-1.59l3.98,-1.03l3.81,-0.13l3.02,-1.12l1.77,-1.61l1.73,-1.01l0.13,-0.37l-0.41,-1.01l-0.72,-1.07l1.09,-1.66l1.21,0.24l2.57,0.63l0.24,-0.04l2.46,-1.62l3.78,-1.19l0.13,-0.09l1.8,-2.03l1.66,-0.84l3.54,-0.41l1.93,0.35l0.34,-0.22l0.27,-1.12l-0.08,-0.29l-2.27,-2.22l-2.08,-1.07l-0.29,0.01l-1.82,1.12l-2.36,-0.47l-0.14,0.01l-1.18,0.34l-0.46,-0.94l1.69,-3.08l1.1,-2.21l2.75,1.12l0.26,-0.02l3.53,-2.06l0.15,-0.26l-0.02,-1.35l2.18,-3.39l1.35,-1.04l0.12,-0.24l-0.03,-1.85l-0.15,-0.25l-1.0,-0.58l1.68,-1.37l3.01,-0.59l3.25,-0.09l3.67,0.99l2.08,1.18l1.51,3.3l0.95,1.45l0.85,1.99l0.92,3.19ZM697.0,237.37l-1.95,1.12l-1.74,-0.68l-0.06,-1.9l1.08,-1.03l2.62,-0.7l1.23,0.05l0.37,0.65l-1.01,1.08l-0.54,1.4Z",
            name: "China"
        },
        CM: {
            path: "M453.76,278.92l-0.26,-0.11l-0.18,-0.02l-1.42,0.31l-1.56,-0.33l-1.17,0.16l-3.7,-0.05l0.3,-1.63l-0.04,-0.21l-0.98,-1.66l-0.15,-0.13l-1.03,-0.38l-0.46,-1.01l-0.13,-0.14l-0.48,-0.27l0.02,-0.46l0.62,-1.72l1.1,-2.25l0.54,-0.02l0.2,-0.09l1.41,-1.39l0.73,-0.03l1.32,0.97l0.31,0.03l1.72,-0.85l0.16,-0.2l0.22,-1.0l0.57,-1.03l0.36,-1.18l1.26,-0.98l0.1,-0.15l0.49,-1.7l0.48,-0.51l0.07,-0.13l0.35,-1.3l0.63,-1.54l2.06,-1.92l0.09,-0.17l0.12,-0.79l0.24,-0.41l-0.04,-0.36l-0.89,-0.91l0.04,-0.45l0.28,-0.06l0.85,1.39l0.16,1.59l-0.09,1.66l0.04,0.17l1.09,1.84l-0.86,-0.02l-0.72,0.17l-1.07,-0.24l-0.34,0.17l-0.54,1.19l0.06,0.34l1.48,1.47l1.06,0.44l0.32,0.94l0.73,1.6l-0.32,0.57l-1.23,2.49l-0.54,0.41l-0.12,0.21l-0.19,1.95l0.24,1.08l-0.18,0.67l0.07,0.28l1.13,1.25l0.24,0.93l0.92,1.29l1.1,0.8l0.1,1.01l0.26,0.73l-0.12,0.93l-1.65,-0.49l-2.02,-0.66l-3.19,-0.11Z",
            name: "Cameroon"
        },
        CL: {
            path: "M246.8,429.1l-1.14,0.78l-2.25,1.21l-0.16,0.23l-0.37,2.94l-0.75,0.06l-2.72,-1.07l-2.83,-2.34l-3.06,-1.9l-0.71,-1.92l0.67,-1.84l-0.02,-0.25l-1.22,-2.13l-0.31,-5.41l1.02,-2.95l2.59,-2.4l-0.13,-0.51l-3.32,-0.8l2.06,-2.4l0.07,-0.15l0.79,-4.77l2.44,0.95l0.4,-0.22l1.31,-6.31l-0.16,-0.33l-1.68,-0.8l-0.42,0.21l-0.72,3.47l-1.01,-0.27l0.74,-4.06l0.85,-5.46l1.12,-1.96l0.03,-0.22l-0.71,-2.82l-0.19,-2.94l0.76,-0.07l0.26,-0.2l1.53,-4.62l1.73,-4.52l1.07,-4.2l-0.56,-4.2l0.73,-2.2l0.01,-0.12l-0.29,-3.3l1.46,-3.34l0.45,-5.19l0.8,-5.52l0.78,-5.89l-0.18,-4.33l-0.49,-3.47l1.1,-0.56l0.13,-0.13l0.44,-0.88l0.9,1.29l0.32,1.8l0.1,0.18l1.16,0.97l-0.73,2.33l0.01,0.21l1.33,2.91l0.97,3.6l0.35,0.22l1.57,-0.31l0.16,0.34l-0.79,2.51l-2.61,1.25l-0.17,0.28l0.08,4.36l-0.48,0.79l0.01,0.33l0.6,0.84l-1.62,1.55l-1.67,2.6l-0.89,2.47l-0.02,0.13l0.23,2.56l-1.5,2.76l-0.03,0.21l1.15,4.8l0.11,0.17l0.54,0.42l-0.01,2.37l-1.4,2.7l-0.03,0.15l0.06,2.25l-1.8,1.78l-0.09,0.21l0.02,2.73l0.71,2.63l-1.33,0.94l-0.12,0.17l-0.67,2.64l-0.59,3.03l0.4,3.55l-0.84,0.51l-0.14,0.31l0.58,3.5l0.08,0.16l0.96,0.99l-0.7,1.08l0.11,0.43l1.04,0.55l0.19,0.8l-0.89,0.48l-0.16,0.31l0.26,1.77l-0.89,4.06l-1.31,2.67l-0.03,0.19l0.28,1.53l-0.73,1.88l-1.85,1.37l-0.12,0.26l0.22,3.46l0.06,0.16l0.88,1.19l0.28,0.12l1.32,-0.17l-0.04,2.13l0.04,0.15l1.04,1.95l0.24,0.16l5.94,0.44ZM248.79,430.71l0.0,7.41l0.3,0.3l2.67,0.0l1.01,0.06l-0.54,0.91l-1.99,1.01l-1.13,-0.1l-1.42,-0.27l-1.87,-1.06l-2.57,-0.49l-3.09,-1.9l-2.52,-1.83l-2.65,-2.93l0.93,0.32l3.54,2.29l3.32,1.23l0.34,-0.09l1.29,-1.57l0.83,-2.32l2.11,-1.28l1.43,0.32Z",
            name: "Chile"
        },
        CA: {
            path: "M280.14,145.66l-1.66,2.88l0.06,0.37l0.37,0.03l1.5,-1.01l1.17,0.49l-0.64,0.83l0.13,0.46l2.22,0.89l0.28,-0.03l1.02,-0.7l2.09,0.83l-0.69,2.1l0.37,0.38l1.43,-0.45l0.27,1.43l0.74,1.88l-0.95,2.5l-0.88,0.09l-1.34,-0.48l0.49,-2.34l-0.14,-0.32l-0.7,-0.4l-0.36,0.04l-2.81,2.66l-0.63,-0.05l1.2,-1.01l-0.1,-0.52l-2.4,-0.77l-2.79,0.18l-4.65,-0.09l-0.22,-0.54l1.37,-0.99l0.01,-0.48l-0.82,-0.65l1.91,-1.79l2.57,-5.17l1.49,-1.81l2.04,-1.07l0.63,0.08l-0.27,0.51l-1.33,2.07ZM193.92,74.85l-0.01,4.24l0.19,0.28l0.33,-0.07l3.14,-3.22l2.65,2.5l-0.71,3.04l0.06,0.26l2.42,2.88l0.46,0.0l2.66,-3.14l1.83,-3.74l0.03,-0.12l0.13,-4.53l3.23,0.31l3.63,0.64l3.18,2.08l0.13,1.91l-1.79,2.22l-0.0,0.37l1.69,2.2l-0.28,1.8l-4.74,2.84l-3.33,0.62l-2.5,-1.21l-0.41,0.17l-0.73,2.05l-2.39,3.44l-0.74,1.78l-2.78,2.61l-3.48,0.26l-0.17,0.07l-1.98,1.68l-0.1,0.21l-0.15,2.33l-2.68,0.45l-0.17,0.09l-3.1,3.2l-2.75,4.38l-0.99,3.06l-0.14,4.31l0.25,0.31l3.5,0.58l1.07,3.24l1.18,2.76l0.34,0.18l3.43,-0.69l4.55,1.52l2.45,1.32l1.76,1.65l0.12,0.07l3.11,0.96l2.63,1.46l0.13,0.04l4.12,0.2l2.41,0.3l-0.36,2.81l0.8,3.51l1.81,3.78l0.08,0.1l3.73,3.17l0.34,0.03l1.93,-1.08l0.13,-0.15l1.35,-3.44l0.01,-0.18l-1.31,-5.38l-0.08,-0.14l-1.46,-1.5l3.68,-1.51l2.84,-2.46l1.45,-2.55l0.04,-0.17l-0.2,-2.39l-0.04,-0.12l-1.7,-3.07l-2.9,-2.64l2.79,-3.66l0.05,-0.27l-1.08,-3.38l-0.8,-5.75l1.45,-0.75l4.18,1.03l2.6,0.38l0.18,-0.03l1.93,-0.95l2.18,1.23l3.01,2.18l0.73,1.42l0.25,0.16l4.18,0.27l-0.06,2.95l0.83,4.7l0.22,0.24l2.19,0.55l1.75,2.08l0.38,0.07l3.63,-2.03l0.11,-0.11l2.38,-4.06l1.36,-1.43l1.76,3.01l3.26,4.68l2.68,4.19l-0.94,2.09l0.12,0.38l3.31,1.98l2.23,1.98l0.13,0.07l3.94,0.89l1.48,1.02l0.96,2.82l0.22,0.2l1.85,0.43l0.88,1.13l0.17,3.53l-1.68,1.16l-1.76,1.14l-4.08,1.17l-0.11,0.06l-3.08,2.65l-4.11,0.52l-5.35,-0.69l-3.76,-0.02l-2.62,0.23l-0.2,0.1l-2.05,2.29l-3.13,1.41l-0.11,0.08l-3.6,4.24l-2.87,2.92l-0.05,0.36l0.33,0.14l2.13,-0.52l0.15,-0.08l3.98,-4.15l5.16,-2.63l3.58,-0.31l1.82,1.3l-2.09,1.91l-0.09,0.29l0.8,3.46l0.82,2.37l0.15,0.17l3.25,1.56l0.16,0.03l4.14,-0.45l0.21,-0.12l2.03,-2.86l0.11,1.46l0.13,0.22l1.26,0.88l-2.7,1.78l-5.51,1.83l-2.52,1.26l-2.75,2.16l-1.52,-0.18l-0.08,-2.16l4.19,-2.47l0.14,-0.34l-0.3,-0.22l-4.01,0.1l-2.66,0.36l-1.45,-1.56l0.0,-4.16l-0.11,-0.23l-1.11,-0.91l-0.28,-0.05l-1.5,0.48l-0.7,-0.7l-0.45,0.02l-1.91,2.39l-0.8,2.5l-0.82,1.31l-0.95,0.43l-0.77,0.15l-0.23,0.2l-0.18,0.56l-8.2,0.02l-0.13,0.03l-1.19,0.61l-2.95,2.45l-0.78,1.13l-4.6,0.01l-0.12,0.02l-1.13,0.48l-0.13,0.44l0.37,0.55l0.2,0.82l-0.01,0.09l-3.1,1.42l-2.63,0.5l-2.84,1.57l-0.47,0.0l-0.72,-0.4l-0.18,-0.27l0.03,-0.15l0.52,-1.0l1.2,-1.71l0.73,-1.8l0.02,-0.17l-1.03,-5.47l-0.15,-0.21l-2.35,-1.32l0.16,-0.29l-0.05,-0.35l-0.37,-0.38l-0.22,-0.09l-0.56,0.0l-0.35,-0.34l-0.11,-0.65l-0.46,-0.2l-0.39,0.26l-0.2,-0.03l-0.11,-0.33l-0.48,-0.25l-0.21,-0.71l-0.15,-0.18l-3.97,-2.07l-4.8,-2.39l-0.25,-0.01l-2.19,0.89l-0.72,0.03l-3.04,-0.82l-0.14,-0.0l-1.94,0.4l-2.4,-0.98l-2.56,-0.51l-1.7,-0.19l-0.62,-0.44l-0.42,-1.67l-0.3,-0.23l-0.85,0.02l-0.29,0.3l-0.01,0.95l-69.26,-0.01l-4.77,-3.14l-1.78,-1.41l-4.51,-1.38l-1.3,-2.73l0.34,-1.96l-0.17,-0.33l-3.06,-1.37l-0.41,-2.58l-0.11,-0.18l-2.92,-2.4l-0.05,-1.53l1.32,-1.59l0.07,-0.2l-0.07,-2.21l-0.16,-0.26l-4.19,-2.22l-2.52,-4.02l-1.56,-2.6l-0.08,-0.09l-2.28,-1.64l-1.65,-1.48l-1.31,-1.89l-0.38,-0.1l-2.51,1.21l-2.28,1.92l-2.03,-2.22l-1.85,-1.71l-2.44,-1.04l-2.28,-0.12l0.03,-37.72l4.27,0.98l4.0,2.13l2.61,0.4l0.24,-0.07l2.17,-1.81l2.92,-1.33l3.63,0.53l0.18,-0.03l3.72,-1.94l3.89,-1.06l1.6,1.72l0.37,0.06l1.87,-1.04l0.14,-0.19l0.48,-1.83l1.37,0.38l4.18,3.96l0.41,0.0l2.89,-2.62l0.28,2.79l0.37,0.26l3.08,-0.73l0.17,-0.12l0.85,-1.16l2.81,0.24l3.83,1.86l5.86,1.61l3.46,0.75l2.44,-0.26l2.89,1.89l-3.12,1.89l-0.14,0.31l0.24,0.24l4.53,0.92l6.84,-0.5l2.04,-0.71l2.54,2.44l0.39,0.02l2.72,-2.16l-0.01,-0.48l-2.26,-1.61l1.27,-1.16l2.94,-0.19l1.94,-0.42l1.89,0.97l2.49,2.32l0.24,0.08l2.71,-0.33l4.35,1.9l0.17,0.02l3.86,-0.67l3.62,0.1l0.31,-0.33l-0.26,-2.44l1.9,-0.65l3.58,1.36l-0.01,3.84l0.23,0.29l0.34,-0.17l1.51,-3.23l1.81,0.1l0.31,-0.22l1.13,-4.37l-0.08,-0.29l-2.68,-2.73l-2.83,-1.76l0.19,-4.73l2.77,-3.15l3.06,0.69l2.44,1.97l3.24,4.88l-2.05,2.02l0.15,0.51l4.41,0.85ZM265.85,150.7l-0.84,0.04l-3.15,-0.99l-1.77,-1.17l0.19,-0.06l3.17,0.79l2.39,1.27l0.01,0.12ZM249.41,3.71l6.68,0.49l5.34,0.79l4.34,1.6l-0.08,1.24l-5.91,2.56l-6.03,1.21l-2.36,1.38l-0.14,0.34l0.29,0.22l4.37,-0.02l-4.96,3.01l-4.06,1.64l-0.11,0.08l-4.21,4.62l-5.07,0.92l-0.12,0.05l-1.53,1.1l-7.5,0.59l-0.28,0.28l0.24,0.31l2.67,0.54l-1.04,0.6l-0.09,0.44l1.89,2.49l-2.11,1.66l-3.83,1.52l-0.15,0.13l-1.14,2.01l-3.41,1.55l-0.16,0.36l0.35,1.19l0.3,0.22l3.98,-0.19l0.03,0.78l-6.42,2.99l-6.44,-1.41l-7.41,0.79l-3.72,-0.62l-4.48,-0.26l-0.25,-2.0l4.37,-1.13l0.21,-0.38l-1.14,-3.55l1.13,-0.28l6.61,2.29l0.35,-0.12l-0.04,-0.37l-3.41,-3.45l-0.14,-0.08l-3.57,-0.92l1.62,-1.7l4.36,-1.3l0.2,-0.18l0.71,-1.94l-0.12,-0.36l-3.45,-2.15l-0.88,-2.43l6.36,0.23l1.94,0.61l0.23,-0.02l3.91,-2.1l0.15,-0.32l-0.26,-0.24l-5.69,-0.67l-8.69,0.37l-4.3,-1.92l-2.12,-2.39l-2.82,-1.68l-0.44,-1.65l3.41,-1.06l2.93,-0.2l4.91,-0.99l3.69,-2.28l2.93,0.31l2.64,1.68l0.42,-0.1l1.84,-3.23l3.17,-0.96l4.45,-0.69l7.56,-0.26l1.26,0.64l0.18,0.03l7.2,-1.06l10.81,0.8ZM203.94,57.59l0.01,0.32l1.97,2.97l0.51,-0.01l2.26,-3.75l6.05,-1.89l4.08,4.72l-0.36,2.95l0.38,0.33l4.95,-1.36l0.11,-0.05l2.23,-1.77l5.37,2.31l3.32,2.14l0.3,1.89l0.36,0.25l4.48,-1.01l2.49,2.8l0.14,0.09l5.99,1.78l2.09,1.74l2.18,3.83l-4.29,1.91l-0.01,0.54l5.9,2.83l3.95,0.94l3.54,3.84l0.2,0.1l3.58,0.25l-0.67,2.51l-4.18,4.54l-2.84,-1.61l-3.91,-3.95l-0.26,-0.09l-3.24,0.52l-0.25,0.26l-0.32,2.37l0.1,0.26l2.63,2.38l3.42,1.89l0.96,1.0l1.57,3.8l-0.74,2.43l-2.85,-0.96l-6.26,-3.15l-0.38,0.09l0.04,0.39l3.54,3.4l2.55,2.31l0.23,0.78l-6.26,-1.43l-5.33,-2.25l-2.73,-1.73l0.67,-0.86l-0.09,-0.45l-7.38,-4.01l-0.44,0.27l0.03,0.89l-6.85,0.61l-1.8,-1.17l1.43,-2.6l4.56,-0.07l5.15,-0.52l0.23,-0.45l-0.76,-1.34l0.8,-1.89l3.21,-4.06l0.05,-0.29l-0.72,-1.95l-0.97,-1.47l-0.11,-0.1l-3.84,-2.1l-4.53,-1.33l1.09,-0.75l0.05,-0.45l-2.65,-2.75l-0.18,-0.09l-2.12,-0.24l-1.91,-1.47l-0.39,0.02l-1.27,1.25l-4.4,0.56l-9.06,-0.99l-5.28,-1.31l-4.01,-0.67l-1.72,-1.31l2.32,-1.85l0.1,-0.33l-0.28,-0.2l-3.3,-0.02l-0.74,-4.36l1.86,-4.09l2.46,-1.88l5.74,-1.15l-1.5,2.55ZM261.28,159.28l0.19,0.14l1.82,0.42l1.66,-0.05l-0.66,0.68l-0.75,0.16l-3.0,-1.25l-0.46,-0.77l0.51,-0.52l0.68,1.19ZM230.87,84.48l-2.48,0.19l-0.52,-1.74l0.96,-2.17l2.03,-0.53l1.71,1.04l0.02,1.6l-0.22,0.46l-1.5,1.16ZM229.52,58.19l0.14,0.82l-4.99,-0.22l-2.73,0.63l-0.59,-0.23l-2.61,-2.4l0.08,-1.38l0.94,-0.25l5.61,0.51l4.14,2.54ZM222.12,105.0l-0.79,1.63l-0.75,-0.22l-0.52,-0.91l0.04,-0.09l0.84,-1.01l0.74,0.06l0.44,0.55ZM183.77,38.22l2.72,1.65l0.16,0.04l4.83,-0.01l1.92,1.52l-0.51,1.75l0.18,0.36l2.84,1.14l1.56,1.19l0.16,0.06l3.37,0.22l3.65,0.42l4.07,-1.1l5.05,-0.43l3.96,0.35l2.53,1.8l0.48,1.79l-1.37,1.16l-3.6,1.03l-3.22,-0.59l-7.17,0.76l-5.1,0.09l-4.0,-0.6l-6.48,-1.56l-0.81,-2.57l-0.3,-2.49l-0.1,-0.19l-2.51,-2.25l-0.16,-0.07l-5.12,-0.63l-2.61,-1.45l0.75,-1.71l4.88,0.32ZM207.46,91.26l0.42,1.62l0.42,0.19l1.12,-0.55l1.35,0.99l2.74,1.39l2.73,1.2l0.2,1.74l0.35,0.26l1.72,-0.29l1.31,0.97l-1.72,0.96l-3.68,-0.9l-1.34,-1.71l-0.43,-0.04l-2.46,2.1l-3.23,1.85l-0.74,-1.98l-0.31,-0.19l-2.47,0.28l1.49,-1.34l0.1,-0.19l0.32,-3.15l0.79,-3.45l1.34,0.25ZM215.59,102.66l-2.73,2.0l-1.49,-0.08l-0.37,-0.7l1.61,-1.56l3.0,0.03l-0.02,0.3ZM202.79,24.07l0.11,0.12l2.54,1.53l-3.01,1.47l-4.55,4.07l-4.3,0.38l-5.07,-0.68l-2.51,-2.09l0.03,-1.72l1.86,-1.4l0.1,-0.34l-0.29,-0.2l-4.49,0.04l-2.63,-1.79l-1.45,-2.36l1.61,-2.38l1.65,-1.69l2.47,-0.4l0.19,-0.48l-0.72,-0.89l5.1,-0.26l3.1,3.05l0.13,0.07l4.21,1.25l3.99,1.06l1.92,3.65ZM187.5,59.3l-0.15,0.1l-2.59,3.4l-2.5,-0.15l-1.47,-3.92l0.04,-2.24l1.22,-1.92l2.34,-1.26l5.11,0.17l4.28,1.06l-3.36,3.86l-2.9,0.9ZM186.19,48.8l-1.15,1.63l-3.42,-0.35l-2.68,-1.15l1.11,-1.88l3.34,-1.27l2.01,1.63l0.79,1.38ZM185.78,35.41l-0.95,0.13l-4.48,-0.33l-0.4,-0.91l4.5,0.07l1.45,0.82l-0.1,0.21ZM180.76,32.56l-3.43,1.03l-1.85,-1.14l-1.01,-1.92l-0.16,-1.87l2.87,0.2l1.39,0.35l2.75,1.75l-0.55,1.6ZM181.03,76.32l-1.21,1.2l-3.19,-1.26l-0.18,-0.01l-1.92,0.45l-2.88,-1.67l1.84,-1.16l1.6,-1.77l2.45,1.17l1.45,0.77l2.05,2.28ZM169.72,54.76l2.83,0.97l0.14,0.01l4.25,-0.58l0.47,1.01l-2.19,2.16l0.07,0.48l3.61,1.95l-0.41,3.84l-3.87,1.68l-2.23,-0.36l-1.73,-1.75l-6.07,-3.53l0.03,-1.01l4.79,0.55l0.3,-0.16l-0.04,-0.34l-2.55,-2.89l2.59,-2.05ZM174.44,40.56l1.49,1.87l0.07,2.48l-1.07,3.52l-3.87,0.48l-2.41,-0.72l0.05,-2.72l-0.33,-0.3l-3.79,0.36l-0.13,-3.31l2.36,0.14l0.15,-0.03l3.7,-1.74l3.44,0.29l0.31,-0.22l0.03,-0.12ZM170.14,31.5l0.75,1.74l-3.52,-0.52l-4.19,-1.77l-4.65,-0.17l1.65,-1.11l-0.05,-0.52l-2.86,-1.26l-0.13,-1.58l4.52,0.7l6.66,1.99l1.84,2.5ZM134.64,58.08l-1.08,1.93l0.34,0.44l5.44,-1.41l3.37,2.32l0.37,-0.02l2.66,-2.28l2.03,1.38l2.01,4.53l0.53,0.04l1.26,-1.93l0.03,-0.27l-1.67,-4.55l1.82,-0.58l2.36,0.73l2.69,1.84l1.53,4.46l0.77,3.24l0.15,0.19l4.22,2.26l4.32,2.04l-0.21,1.51l-3.87,0.34l-0.19,0.5l1.45,1.54l-0.65,1.23l-4.3,-0.65l-4.4,-1.19l-2.97,0.28l-4.67,1.48l-6.31,0.65l-4.27,0.39l-1.26,-1.91l-0.15,-0.12l-3.42,-1.2l-0.16,-0.01l-2.05,0.45l-2.66,-3.02l1.2,-0.34l3.82,-0.76l3.58,0.19l3.27,-0.78l0.23,-0.29l-0.24,-0.29l-4.84,-1.06l-5.42,0.35l-3.4,-0.09l-0.97,-1.22l5.39,-1.7l0.21,-0.33l-0.3,-0.25l-3.82,0.06l-3.95,-1.1l1.88,-3.13l1.68,-1.81l6.54,-2.84l2.11,0.77ZM158.85,56.58l-1.82,2.62l-3.38,-2.9l0.49,-0.39l3.17,-0.18l1.54,0.86ZM149.71,42.7l1.0,1.87l0.37,0.14l2.17,-0.83l2.33,0.2l0.38,2.16l-1.38,2.17l-8.33,0.76l-6.34,2.15l-3.51,0.1l-0.22,-1.13l4.98,-2.12l0.17,-0.34l-0.31,-0.23l-11.27,0.6l-3.04,-0.78l3.14,-4.57l2.2,-1.35l6.87,1.7l4.4,3.0l0.14,0.05l4.37,0.39l0.27,-0.48l-3.41,-4.68l1.96,-1.62l2.28,0.53l0.79,2.32ZM145.44,29.83l-2.18,0.77l-3.79,-0.0l0.02,-0.31l2.34,-1.5l1.2,0.23l2.42,0.83ZM144.83,34.5l-4.44,1.46l-3.18,-1.48l1.6,-1.36l3.51,-0.53l3.1,0.75l-0.6,1.16ZM119.02,65.87l-6.17,2.07l-1.19,-1.82l-0.13,-0.11l-5.48,-2.32l0.92,-1.7l1.73,-3.44l2.16,-3.15l-0.02,-0.36l-2.09,-2.56l7.84,-0.71l3.59,1.02l6.32,0.27l2.35,1.37l2.25,1.71l-2.68,1.04l-6.21,3.41l-3.1,3.28l-0.08,0.21l0.0,1.81ZM129.66,35.4l-0.3,3.55l-1.77,1.67l-2.34,0.27l-4.62,2.2l-3.89,0.76l-2.83,-0.93l3.85,-3.52l5.04,-3.36l3.75,0.07l3.11,-0.7ZM111.24,152.74l-0.82,0.29l-3.92,-1.39l-0.7,-1.06l-0.12,-0.1l-2.15,-1.09l-0.41,-0.84l-0.2,-0.16l-2.44,-0.56l-0.84,-1.56l0.1,-0.36l2.34,0.64l1.53,0.5l2.28,0.34l0.78,1.04l1.24,1.55l0.09,0.08l2.42,1.3l0.81,1.39ZM88.54,134.82l0.14,0.02l2.0,-0.23l-0.67,3.48l0.06,0.24l1.78,2.22l-0.24,-0.0l-1.4,-1.42l-0.91,-1.53l-1.26,-1.08l-0.42,-1.35l0.09,-0.66l0.82,0.31Z",
            name: "Canada"
        },
        CG: {
            path: "M453.66,296.61l-0.9,-0.82l-0.35,-0.04l-0.83,0.48l-0.77,0.83l-1.65,-2.13l1.66,-1.2l0.08,-0.39l-0.81,-1.43l0.59,-0.43l1.62,-0.29l0.24,-0.24l0.1,-0.58l0.94,0.84l0.19,0.08l2.21,0.11l0.27,-0.14l0.81,-1.29l0.32,-1.76l-0.27,-1.96l-0.06,-0.15l-1.08,-1.35l1.02,-2.74l-0.09,-0.34l-0.62,-0.5l-0.22,-0.06l-1.66,0.18l-0.55,-1.03l0.12,-0.73l2.85,0.09l1.98,0.65l2.0,0.59l0.38,-0.25l0.17,-1.3l1.26,-2.24l1.34,-1.19l1.54,0.38l1.35,0.12l-0.11,1.15l-0.74,1.34l-0.5,1.61l-0.31,2.22l0.12,1.41l-0.4,0.9l-0.06,0.88l-0.24,0.67l-1.57,1.15l-1.24,1.41l-1.09,2.43l-0.03,0.13l0.08,1.95l-0.55,0.69l-1.46,1.23l-1.32,1.41l-0.61,-0.29l-0.13,-0.57l-0.29,-0.23l-1.36,-0.02l-0.23,0.1l-0.72,0.81l-0.41,-0.16Z",
            name: "Republic of the Congo"
        },
        CF: {
            path: "M459.41,266.56l1.9,-0.17l0.22,-0.12l0.36,-0.5l0.14,0.02l0.55,0.51l0.29,0.07l3.15,-0.96l0.12,-0.07l1.05,-0.97l1.29,-0.87l0.12,-0.33l-0.17,-0.61l0.38,-0.12l2.36,0.15l0.15,-0.03l2.36,-1.17l0.12,-0.1l1.78,-2.72l1.18,-0.96l1.23,-0.34l0.21,0.79l0.07,0.13l1.37,1.5l0.01,0.86l-0.39,1.0l-0.01,0.17l0.16,0.78l0.1,0.17l0.91,0.76l1.89,1.09l1.24,0.92l0.02,0.67l0.12,0.23l1.67,1.3l0.99,1.03l0.61,1.46l0.14,0.15l1.79,0.95l0.2,0.4l-0.44,0.14l-1.54,-0.06l-1.98,-0.26l-0.93,0.22l-0.19,0.14l-0.3,0.48l-0.57,0.05l-0.91,-0.49l-0.26,-0.01l-2.7,1.21l-1.04,-0.23l-0.21,0.03l-0.34,0.19l-0.12,0.13l-0.64,1.3l-1.67,-0.43l-1.77,-0.24l-1.58,-0.91l-2.06,-0.85l-0.27,0.02l-1.42,0.88l-0.97,1.27l-0.06,0.14l-0.19,1.46l-1.3,-0.11l-1.67,-0.42l-0.27,0.07l-1.55,1.41l-0.99,1.76l-0.14,-1.18l-0.13,-0.22l-1.1,-0.78l-0.86,-1.2l-0.2,-0.84l-0.07,-0.13l-1.07,-1.19l0.16,-0.59l0.0,-0.15l-0.24,-1.01l0.18,-1.77l0.5,-0.38l0.09,-0.11l1.18,-2.4Z",
            name: "Central African Republic"
        },
        CD: {
            path: "M497.85,276.25l-0.14,2.77l0.2,0.3l0.57,0.19l-0.47,0.52l-1.0,0.71l-0.96,1.31l-0.56,1.22l-0.16,2.04l-0.54,0.89l-0.04,0.15l-0.02,1.76l-0.63,0.61l-0.09,0.2l-0.08,1.33l-0.2,0.11l-0.15,0.21l-0.23,1.37l0.03,0.2l0.6,1.08l0.16,2.96l0.44,2.29l-0.24,1.25l0.01,0.15l0.5,1.46l0.07,0.12l1.41,1.37l1.09,2.56l-0.51,-0.11l-3.45,0.45l-0.67,0.3l-0.15,0.15l-0.71,1.61l0.01,0.26l0.52,1.03l-0.43,2.9l-0.31,2.55l0.13,0.29l0.7,0.46l1.75,0.99l0.31,-0.01l0.26,-0.17l0.15,1.9l-1.44,-0.02l-0.94,-1.28l-0.94,-1.1l-0.17,-0.1l-1.76,-0.33l-0.5,-1.18l-0.42,-0.15l-1.44,0.75l-1.79,-0.32l-0.77,-1.05l-0.2,-0.12l-1.59,-0.23l-0.97,0.04l-0.1,-0.53l-0.27,-0.25l-0.86,-0.06l-1.13,-0.15l-1.62,0.37l-1.04,-0.06l-0.32,0.09l0.11,-2.56l-0.08,-0.21l-0.77,-0.87l-0.17,-1.41l0.36,-1.47l-0.03,-0.21l-0.48,-0.91l-0.04,-1.52l-0.3,-0.29l-2.65,0.02l0.13,-0.53l-0.29,-0.37l-1.28,0.01l-0.28,0.21l-0.07,0.24l-1.35,0.09l-0.26,0.18l-0.62,1.45l-0.25,0.42l-1.17,-0.3l-0.19,0.01l-0.79,0.34l-1.44,0.18l-1.41,-1.96l-0.7,-1.47l-0.61,-1.86l-0.28,-0.21l-7.39,-0.03l-0.92,0.3l-0.78,-0.03l-0.78,0.25l-0.11,-0.25l0.35,-0.15l0.18,-0.26l0.07,-1.02l0.33,-0.52l0.72,-0.42l0.52,0.2l0.33,-0.08l0.76,-0.86l0.99,0.02l0.11,0.48l0.16,0.2l0.94,0.44l0.35,-0.07l1.46,-1.56l1.44,-1.21l0.68,-0.85l0.06,-0.2l-0.08,-1.99l1.04,-2.33l1.1,-1.23l1.62,-1.19l0.11,-0.14l0.29,-0.8l0.08,-0.94l0.38,-0.82l0.03,-0.16l-0.13,-1.38l0.3,-2.16l0.47,-1.51l0.73,-1.31l0.04,-0.12l0.15,-1.51l0.21,-1.66l0.89,-1.16l1.16,-0.7l1.9,0.79l1.69,0.95l1.81,0.24l1.85,0.48l0.35,-0.16l0.71,-1.43l0.16,-0.09l1.03,0.23l0.19,-0.02l2.65,-1.19l0.86,0.46l0.17,0.03l0.81,-0.08l0.23,-0.14l0.31,-0.5l0.75,-0.17l1.83,0.26l1.64,0.06l0.72,-0.21l1.39,1.9l0.16,0.11l1.12,0.3l0.24,-0.04l0.58,-0.36l1.05,0.15l0.15,-0.02l1.15,-0.44l0.47,0.84l0.08,0.09l2.08,1.57Z",
            name: "Democratic Republic of the Congo"
        },
        CZ: {
            path: "M463.29,152.22l-0.88,-0.47l-0.18,-0.03l-1.08,0.15l-1.86,-0.94l-0.21,-0.02l-0.88,0.24l-0.13,0.07l-1.25,1.17l-1.63,-0.91l-1.38,-1.36l-1.22,-0.75l-0.24,-1.24l-0.33,-0.75l1.53,-0.6l0.98,-0.84l1.74,-0.62l0.11,-0.07l0.47,-0.47l0.46,0.27l0.24,0.03l0.96,-0.3l1.06,0.95l0.15,0.07l1.57,0.24l-0.1,0.6l0.16,0.32l1.36,0.68l0.41,-0.15l0.28,-0.62l1.29,0.28l0.19,0.84l0.26,0.23l1.73,0.18l0.74,1.02l-0.17,0.0l-0.25,0.13l-0.32,0.49l-0.46,0.11l-0.22,0.23l-0.13,0.57l-0.32,0.1l-0.2,0.22l-0.03,0.14l-0.65,0.25l-1.05,-0.05l-0.28,0.17l-0.22,0.43Z",
            name: "Czech Republic"
        },
        CY: {
            path: "M505.03,193.75l-1.51,0.68l-1.0,-0.3l-0.32,-0.63l0.69,-0.06l0.41,0.13l0.19,-0.0l0.62,-0.22l0.31,0.02l0.06,0.22l0.49,0.17l0.06,-0.01Z",
            name: "Cyprus"
        },
        CR: {
            path: "M213.0,263.84l-0.98,-0.4l-0.3,-0.31l0.16,-0.24l0.05,-0.21l-0.09,-0.56l-0.1,-0.18l-0.76,-0.65l-0.99,-0.5l-0.74,-0.28l-0.13,-0.58l-0.12,-0.18l-0.66,-0.45l-0.34,-0.0l-0.13,0.31l0.13,0.59l-0.17,0.21l-0.34,-0.42l-0.14,-0.1l-0.7,-0.22l-0.23,-0.34l0.01,-0.62l0.31,-0.74l-0.14,-0.38l-0.3,-0.15l0.47,-0.4l1.48,0.6l0.26,-0.02l0.47,-0.27l0.58,0.15l0.35,0.44l0.17,0.11l0.74,0.17l0.27,-0.07l0.3,-0.27l0.52,1.09l0.97,1.02l0.77,0.71l-0.41,0.1l-0.23,0.3l0.01,1.02l0.12,0.24l0.2,0.14l-0.07,0.05l-0.11,0.3l0.08,0.37l-0.23,0.63Z",
            name: "Costa Rica"
        },
        CU: {
            path: "M215.01,226.09l2.08,0.18l1.94,0.03l2.24,0.86l0.95,0.92l0.25,0.08l2.22,-0.28l0.79,0.55l3.68,2.81l0.19,0.06l0.77,-0.03l1.18,0.42l-0.12,0.47l0.27,0.37l1.78,0.1l1.59,0.9l-0.11,0.22l-1.5,0.3l-1.64,0.13l-1.75,-0.2l-2.69,0.19l1.0,-0.86l-0.03,-0.48l-1.02,-0.68l-0.13,-0.05l-1.52,-0.16l-0.74,-0.64l-0.57,-1.42l-0.3,-0.19l-1.36,0.1l-2.23,-0.67l-0.71,-0.52l-0.14,-0.06l-3.2,-0.4l-0.42,-0.25l0.56,-0.39l0.12,-0.33l-0.27,-0.22l-2.46,-0.13l-0.2,0.06l-1.72,1.31l-0.94,0.03l-0.25,0.15l-0.29,0.53l-1.04,0.24l-0.29,-0.07l0.7,-0.43l0.1,-0.11l0.5,-0.87l1.04,-0.54l1.23,-0.49l1.86,-0.25l0.62,-0.28Z",
            name: "Cuba"
        },
        SZ: {
            path: "M500.95,353.41l-0.41,0.97l-1.16,0.23l-1.29,-1.26l-0.02,-0.71l0.63,-0.93l0.23,-0.7l0.47,-0.12l1.04,0.4l0.32,1.05l0.2,1.08Z",
            name: "Swaziland"
        },
        SY: {
            path: "M510.84,199.83l0.09,-0.11l0.07,-0.2l-0.04,-1.08l0.56,-1.4l1.3,-1.01l0.1,-0.34l-0.41,-1.11l-0.24,-0.19l-0.89,-0.11l-0.2,-1.84l0.55,-1.05l1.3,-1.22l0.09,-0.19l0.09,-1.09l0.39,0.27l0.25,0.04l2.66,-0.77l1.35,0.52l2.06,-0.01l2.93,-1.08l1.35,0.04l2.14,-0.34l-0.83,1.16l-1.31,0.68l-0.16,0.3l0.23,2.03l-0.9,3.25l-5.43,2.87l-4.79,2.91l-2.32,-0.92Z",
            name: "Syria"
        },
        KG: {
            path: "M599.04,172.15l0.38,-0.9l1.43,-0.37l4.04,1.02l0.37,-0.23l0.36,-1.64l1.17,-0.52l3.45,1.24l0.2,-0.0l0.86,-0.31l4.09,0.08l3.61,0.31l1.18,1.02l0.11,0.06l1.19,0.34l-0.13,0.26l-3.84,1.58l-0.13,0.1l-0.81,1.08l-3.08,0.34l-0.24,0.16l-0.85,1.7l-2.43,-0.37l-0.14,0.01l-1.79,0.61l-2.39,1.4l-0.12,0.39l0.25,0.49l-0.48,0.45l-4.57,0.43l-3.04,-0.94l-2.45,0.18l0.14,-1.02l2.42,0.44l0.27,-0.08l0.81,-0.81l1.76,0.27l0.21,-0.05l3.21,-2.14l-0.03,-0.51l-2.97,-1.57l-0.26,-0.01l-1.64,0.69l-1.38,-0.84l1.81,-1.67l-0.09,-0.5l-0.46,-0.18Z",
            name: "Kyrgyzstan"
        },
        KE: {
            path: "M523.3,287.04l0.06,0.17l1.29,1.8l-1.46,0.84l-0.11,0.11l-0.55,0.93l-0.81,0.16l-0.24,0.24l-0.34,1.69l-0.81,1.06l-0.46,1.58l-0.76,0.63l-3.3,-2.3l-0.16,-1.32l-0.15,-0.23l-9.35,-5.28l-0.02,-2.4l1.92,-2.63l0.91,-1.83l0.01,-0.24l-1.09,-2.86l-0.29,-1.24l-1.09,-1.63l2.93,-2.85l0.92,0.3l0.0,1.19l0.09,0.22l0.86,0.83l0.21,0.08l1.65,0.0l3.09,2.08l0.16,0.05l0.79,0.03l0.54,-0.06l0.58,0.28l1.67,0.2l0.28,-0.12l0.69,-0.98l2.04,-0.94l0.86,0.73l0.19,0.07l1.1,0.0l-1.82,2.36l-0.06,0.18l0.03,9.12Z",
            name: "Kenya"
        },
        SS: {
            path: "M505.7,261.39l0.02,1.64l-0.27,0.55l-1.15,0.05l-0.24,0.15l-0.85,1.44l0.22,0.45l1.44,0.17l1.15,1.12l0.42,0.95l0.14,0.15l1.06,0.54l1.33,2.45l-3.06,2.98l-1.44,1.08l-1.75,0.01l-1.92,0.56l-1.5,-0.53l-0.27,0.03l-0.85,0.57l-1.98,-1.5l-0.56,-1.02l-0.37,-0.13l-1.32,0.5l-1.08,-0.15l-0.2,0.04l-0.56,0.35l-0.9,-0.24l-1.44,-1.97l-0.39,-0.77l-0.13,-0.13l-1.78,-0.94l-0.65,-1.5l-1.08,-1.12l-1.57,-1.22l-0.02,-0.68l-0.12,-0.23l-1.37,-1.02l-1.17,-0.68l0.2,-0.08l0.86,-0.48l0.14,-0.18l0.63,-2.22l0.6,-1.02l1.47,-0.28l0.35,0.56l1.29,1.48l0.14,0.09l0.69,0.22l0.22,-0.02l0.83,-0.4l1.58,0.08l0.26,0.39l0.25,0.13l2.49,0.0l0.3,-0.25l0.06,-0.35l1.13,-0.42l0.18,-0.18l0.22,-0.63l0.68,-0.38l1.95,1.37l0.23,0.05l1.29,-0.26l0.19,-0.12l1.23,-1.8l1.36,-1.37l0.08,-0.25l-0.21,-1.52l-0.06,-0.15l-0.25,-0.3l0.94,-0.08l0.26,-0.21l0.1,-0.32l0.6,0.09l-0.25,1.67l0.3,1.83l0.11,0.19l1.22,0.94l0.25,0.73l-0.04,1.2l0.26,0.31l0.09,0.01Z",
            name: "South Sudan"
        },
        SR: {
            path: "M278.1,270.26l2.71,0.45l0.31,-0.14l0.19,-0.32l1.82,-0.16l2.25,0.56l-1.09,1.81l-0.04,0.19l0.2,1.72l0.05,0.13l0.9,1.35l-0.39,0.99l-0.21,1.09l-0.48,0.8l-1.2,-0.44l-0.17,-0.01l-1.12,0.24l-0.95,-0.21l-0.35,0.2l-0.25,0.73l0.05,0.29l0.3,0.35l-0.06,0.13l-1.01,-0.15l-1.42,-2.03l-0.32,-1.36l-0.29,-0.23l-0.63,-0.0l-0.95,-1.56l0.41,-1.16l0.01,-0.17l-0.08,-0.35l1.29,-0.56l0.18,-0.22l0.35,-1.97Z",
            name: "Suriname"
        },
        KH: {
            path: "M680.28,257.89l-0.93,-1.2l-1.24,-2.56l-0.56,-2.9l1.45,-1.92l3.07,-0.46l2.26,0.35l2.03,0.98l0.38,-0.11l1.0,-1.55l1.86,0.79l0.52,1.51l-0.28,2.82l-4.05,1.88l-0.12,0.45l0.79,1.1l-2.2,0.17l-2.08,0.98l-1.89,-0.33Z",
            name: "Cambodia"
        },
        SV: {
            path: "M197.02,248.89l0.18,-0.05l0.59,0.17l0.55,0.51l0.64,0.35l0.06,0.22l0.37,0.21l1.01,-0.28l0.38,0.13l0.16,0.13l-0.14,0.81l-0.18,0.38l-1.22,-0.03l-0.84,-0.23l-1.11,-0.52l-1.31,-0.15l-0.49,-0.38l0.02,-0.08l0.76,-0.57l0.46,-0.27l0.11,-0.35Z",
            name: "El Salvador"
        },
        SK: {
            path: "M468.01,150.02l0.05,0.07l0.36,0.1l0.85,-0.37l1.12,1.02l0.33,0.05l1.38,-0.65l1.07,0.3l0.16,0.0l1.69,-0.43l1.95,1.02l-0.51,0.64l-0.45,1.2l-0.32,0.2l-2.55,-0.93l-0.17,-0.01l-0.82,0.2l-0.17,0.11l-0.53,0.68l-0.94,0.32l-0.14,-0.11l-0.29,-0.04l-1.18,0.48l-0.95,0.09l-0.26,0.21l-0.15,0.47l-1.84,0.34l-0.82,-0.31l-1.14,-0.73l-0.2,-0.89l0.42,-0.84l0.91,0.05l0.12,-0.02l0.86,-0.33l0.18,-0.21l0.03,-0.13l0.32,-0.1l0.2,-0.22l0.12,-0.55l0.39,-0.1l0.18,-0.13l0.3,-0.45l0.43,-0.0Z",
            name: "Slovakia"
        },
        KR: {
            path: "M737.31,185.72l0.84,0.08l0.27,-0.12l0.89,-1.2l1.63,-0.13l1.1,-0.2l0.21,-0.16l0.12,-0.24l1.86,2.95l0.59,1.79l0.02,3.17l-0.84,1.38l-2.23,0.55l-1.95,1.14l-1.91,0.21l-0.22,-1.21l0.45,-2.07l-0.01,-0.17l-0.99,-2.67l1.54,-0.4l0.17,-0.46l-1.55,-2.24Z",
            name: "South Korea"
        },
        SI: {
            path: "M455.77,159.59l1.79,0.21l0.18,-0.04l1.2,-0.68l2.12,-0.08l0.21,-0.1l0.38,-0.42l0.1,0.01l0.28,0.62l-1.71,0.71l-0.18,0.22l-0.21,1.1l-0.71,0.26l-0.2,0.28l0.01,0.55l-0.59,-0.04l-0.79,-0.47l-0.38,0.06l-0.36,0.41l-0.84,-0.05l0.05,-0.15l-0.56,-1.24l0.21,-1.17Z",
            name: "Slovenia"
        },
        KP: {
            path: "M747.76,172.02l-0.23,-0.04l-0.26,0.08l-1.09,1.02l-0.78,1.06l-0.06,0.19l0.09,1.95l-1.12,0.57l-0.53,0.58l-0.88,0.82l-1.69,0.51l-1.09,0.79l-0.12,0.22l-0.07,1.17l-0.22,0.25l0.09,0.47l0.96,0.46l1.22,1.1l-0.19,0.37l-0.91,0.16l-1.75,0.14l-0.22,0.12l-0.87,1.18l-0.95,-0.09l-0.3,0.18l-0.97,-0.44l-0.39,0.13l-0.25,0.44l-0.29,0.09l-0.03,-0.2l-0.18,-0.23l-0.62,-0.25l-0.43,-0.29l0.52,-0.97l0.52,-0.3l0.13,-0.38l-0.18,-0.42l0.59,-1.47l0.01,-0.21l-0.16,-0.48l-0.22,-0.2l-1.41,-0.31l-0.82,-0.55l1.74,-1.62l2.73,-1.58l1.62,-1.96l0.96,0.76l0.17,0.06l2.17,0.11l0.31,-0.37l-0.32,-1.31l3.61,-1.21l0.16,-0.13l0.79,-1.34l1.25,1.38Z",
            name: "North Korea"
        },
        SO: {
            path: "M543.8,256.48l0.61,-0.05l1.14,-0.37l1.31,-0.25l0.12,-0.05l1.11,-0.81l0.57,-0.0l0.03,0.39l-0.23,1.49l0.01,1.25l-0.52,0.92l-0.7,2.71l-1.19,2.79l-1.54,3.2l-2.13,3.66l-2.12,2.79l-2.92,3.39l-2.47,2.0l-3.76,2.5l-2.33,1.9l-2.77,3.06l-0.61,1.35l-0.28,0.29l-1.22,-1.69l-0.03,-8.92l2.12,-2.76l0.59,-0.68l1.47,-0.04l0.18,-0.06l2.15,-1.71l3.16,-0.11l0.21,-0.09l7.08,-7.55l1.76,-2.12l1.14,-1.57l0.06,-0.18l0.01,-4.67Z",
            name: "Somalia"
        },
        SN: {
            path: "M379.28,250.34l-0.95,-1.82l-0.09,-0.1l-0.83,-0.6l0.62,-0.28l0.13,-0.11l1.21,-1.8l0.6,-1.31l0.71,-0.68l1.09,0.2l0.18,-0.02l1.17,-0.53l1.25,-0.03l1.17,0.73l1.59,0.65l1.47,1.83l1.59,1.7l0.12,1.56l0.49,1.46l0.1,0.14l0.85,0.65l0.18,0.82l-0.08,0.57l-0.13,0.05l-1.29,-0.19l-0.29,0.13l-0.11,0.16l-0.35,0.04l-1.83,-0.61l-5.84,-0.13l-0.12,0.02l-0.6,0.26l-0.87,-0.06l-1.01,0.32l-0.26,-1.26l1.9,0.04l0.16,-0.04l0.54,-0.32l0.37,-0.02l0.15,-0.05l0.78,-0.5l0.92,0.46l0.12,0.03l1.09,0.04l0.15,-0.03l1.08,-0.57l0.11,-0.44l-0.51,-0.74l-0.39,-0.1l-0.76,0.39l-0.62,-0.01l-0.92,-0.58l-0.18,-0.05l-0.79,0.04l-0.2,0.09l-0.48,0.51l-2.41,0.06Z",
            name: "Senegal"
        },
        SL: {
            path: "M392.19,267.53l-0.44,-0.12l-1.73,-0.97l-1.24,-1.28l-0.4,-0.84l-0.27,-1.65l1.21,-1.0l0.09,-0.12l0.27,-0.66l0.32,-0.41l0.56,-0.05l0.16,-0.07l0.5,-0.41l1.75,0.0l0.59,0.77l0.49,0.96l-0.07,0.64l0.04,0.19l0.36,0.58l-0.03,0.84l0.24,0.2l-0.64,0.65l-1.13,1.37l-0.06,0.14l-0.12,0.66l-0.43,0.58Z",
            name: "Sierra Leone"
        },
        SB: {
            path: "M826.74,311.51l0.23,0.29l-0.95,-0.01l-0.39,-0.63l0.65,0.27l0.45,0.09ZM825.01,308.52l-1.18,-1.39l-0.37,-1.06l0.24,0.0l0.82,1.84l0.49,0.6ZM823.21,309.42l-0.44,0.03l-1.43,-0.24l-0.32,-0.24l0.08,-0.5l1.29,0.31l0.72,0.47l0.11,0.18ZM817.9,303.81l2.59,1.44l0.3,0.41l-1.21,-0.66l-1.34,-0.89l-0.34,-0.3ZM813.77,302.4l0.48,0.34l0.1,0.08l-0.33,-0.17l-0.25,-0.25Z",
            name: "Solomon Islands"
        },
        SA: {
            path: "M528.24,243.1l-0.2,-0.69l-0.07,-0.12l-0.69,-0.71l-0.18,-0.94l-0.12,-0.19l-1.24,-0.89l-1.28,-2.09l-0.7,-2.08l-0.07,-0.11l-1.73,-1.79l-0.11,-0.07l-1.03,-0.39l-1.57,-2.36l-0.27,-1.72l0.1,-1.53l-0.03,-0.15l-1.44,-2.93l-1.25,-1.13l-1.34,-0.56l-0.72,-1.33l0.11,-0.49l-0.02,-0.2l-0.7,-1.38l-0.08,-0.1l-0.68,-0.56l-0.97,-1.98l-2.8,-4.03l-0.25,-0.13l-0.85,0.01l0.29,-1.11l0.12,-0.97l0.23,-0.81l2.52,0.39l0.23,-0.06l1.08,-0.84l0.6,-0.95l1.78,-0.35l0.22,-0.17l0.37,-0.83l0.74,-0.42l0.08,-0.46l-2.17,-2.4l4.55,-1.26l0.12,-0.06l0.36,-0.32l2.83,0.71l3.67,1.91l7.04,5.5l0.17,0.06l4.64,0.22l2.06,0.24l0.55,1.15l0.28,0.17l1.56,-0.06l0.9,2.15l0.14,0.15l1.14,0.57l0.39,0.85l0.11,0.13l1.59,1.06l0.12,0.91l-0.23,0.83l0.01,0.18l0.32,0.9l0.07,0.11l0.68,0.7l0.33,0.86l0.37,0.65l0.09,0.1l0.76,0.53l0.25,0.04l0.45,-0.12l0.35,0.75l0.1,0.63l0.96,2.68l0.23,0.19l7.53,1.33l0.27,-0.09l0.24,-0.26l0.87,1.41l-1.58,4.96l-7.34,2.54l-7.28,1.02l-2.34,1.17l-0.12,0.1l-1.74,2.63l-0.86,0.32l-0.49,-0.68l-0.28,-0.12l-0.92,0.12l-2.32,-0.25l-0.41,-0.23l-0.15,-0.04l-2.89,0.06l-0.63,0.2l-0.91,-0.59l-0.43,0.11l-0.66,1.27l-0.03,0.21l0.21,0.89l-0.6,0.45Z",
            name: "Saudi Arabia"
        },
        SE: {
            path: "M476.42,90.44l-0.15,0.1l-2.43,2.86l-0.07,0.24l0.36,2.31l-3.84,3.1l-4.83,3.38l-0.11,0.15l-1.82,5.45l0.03,0.26l1.78,2.68l2.27,1.99l-2.13,3.88l-2.49,0.82l-0.2,0.24l-0.95,6.05l-1.32,3.09l-2.82,-0.32l-0.3,0.16l-1.34,2.64l-2.48,0.14l-0.76,-3.15l-2.09,-4.04l-1.85,-5.01l1.03,-1.98l2.06,-2.53l0.06,-0.13l0.83,-4.45l-0.06,-0.25l-1.54,-1.86l-0.15,-5.0l1.52,-3.48l2.28,0.06l0.27,-0.16l0.87,-1.59l-0.01,-0.31l-0.8,-1.21l3.79,-5.63l4.07,-7.54l2.23,0.01l0.29,-0.22l0.59,-2.15l4.46,0.66l0.34,-0.26l0.34,-2.64l1.21,-0.14l3.24,2.08l3.78,2.85l0.06,6.37l0.03,0.14l0.67,1.29l-3.95,1.07Z",
            name: "Sweden"
        },
        SD: {
            path: "M505.98,259.75l-0.31,-0.9l-0.1,-0.14l-1.2,-0.93l-0.27,-1.66l0.29,-1.83l-0.25,-0.34l-1.16,-0.17l-0.33,0.21l-0.11,0.37l-1.3,0.11l-0.21,0.49l0.55,0.68l0.18,1.29l-1.31,1.33l-1.18,1.72l-1.04,0.21l-2.0,-1.4l-0.32,-0.02l-0.95,0.52l-0.14,0.16l-0.21,0.6l-1.16,0.43l-0.19,0.23l-0.04,0.27l-2.08,0.0l-0.25,-0.39l-0.24,-0.13l-1.81,-0.09l-0.14,0.03l-0.8,0.38l-0.49,-0.16l-1.22,-1.39l-0.42,-0.67l-0.31,-0.14l-1.81,0.35l-0.2,0.14l-0.72,1.24l-0.61,2.14l-0.73,0.4l-0.62,0.22l-0.83,-0.68l-0.12,-0.6l0.38,-0.97l0.01,-1.14l-0.08,-0.2l-1.39,-1.53l-0.25,-0.97l0.03,-0.57l-0.11,-0.25l-0.81,-0.66l-0.03,-1.34l-0.04,-0.14l-0.52,-0.98l-0.31,-0.15l-0.42,0.07l0.12,-0.44l0.63,-1.03l0.03,-0.23l-0.24,-0.88l0.69,-0.66l0.02,-0.41l-0.4,-0.46l0.58,-1.39l1.04,-1.71l1.97,0.16l0.32,-0.3l-0.12,-10.24l0.02,-0.8l2.59,-0.01l0.3,-0.3l0.0,-4.92l29.19,0.0l0.68,2.17l-0.4,0.35l-0.1,0.27l0.36,2.69l0.93,3.15l0.12,0.16l2.05,1.4l-0.99,1.15l-1.75,0.4l-0.15,0.08l-0.79,0.79l-0.08,0.17l-0.24,1.69l-1.07,3.75l-0.0,0.16l0.25,0.96l-0.38,2.1l-0.98,2.41l-1.52,1.3l-1.07,1.94l-0.25,0.99l-1.08,0.64l-0.13,0.18l-0.46,1.65Z",
            name: "Sudan"
        },
        DO: {
            path: "M241.7,234.97l0.15,-0.22l1.73,0.01l1.43,0.64l0.15,0.03l0.45,-0.04l0.36,0.74l0.28,0.17l1.02,-0.04l-0.04,0.43l0.27,0.33l1.03,0.09l0.91,0.7l-0.57,0.64l-0.99,-0.47l-0.16,-0.03l-1.11,0.11l-0.79,-0.12l-0.26,0.09l-0.38,0.4l-0.66,0.11l-0.28,-0.45l-0.38,-0.12l-0.83,0.37l-0.14,0.13l-0.85,1.49l-0.27,-0.17l-0.1,-0.58l0.05,-0.67l-0.07,-0.21l-0.44,-0.53l0.35,-0.25l0.12,-0.19l0.19,-1.0l-0.2,-1.4Z",
            name: "Dominican Republic"
        },
        DJ: {
            path: "M528.78,253.36l0.34,0.45l-0.06,0.76l-1.26,0.54l-0.05,0.53l0.82,0.53l-0.57,0.83l-0.3,-0.25l-0.27,-0.05l-0.56,0.17l-1.07,-0.03l-0.04,-0.56l-0.16,-0.56l0.76,-1.07l0.76,-0.97l0.89,0.18l0.25,-0.06l0.51,-0.42Z",
            name: "Djibouti"
        },
        DK: {
            path: "M452.4,129.07l-1.27,2.39l-2.25,-1.69l-0.26,-1.08l3.15,-1.0l0.63,1.39ZM447.87,126.25l-0.35,0.76l-0.47,-0.24l-0.38,0.09l-1.8,2.53l-0.03,0.29l0.56,1.4l-1.22,0.4l-1.68,-0.41l-0.92,-1.76l-0.07,-3.47l0.38,-0.88l0.62,-0.93l2.07,-0.21l0.19,-0.1l0.84,-0.95l1.5,-0.76l-0.06,1.26l-0.7,1.1l-0.03,0.25l0.3,1.0l0.18,0.19l1.06,0.42Z",
            name: "Denmark"
        },
        DE: {
            path: "M445.51,131.69l0.03,0.94l0.21,0.28l2.32,0.74l-0.02,1.0l0.37,0.3l2.55,-0.65l1.36,-0.89l2.63,1.27l1.09,1.01l0.51,1.51l-0.6,0.78l-0.0,0.36l0.88,1.17l0.58,1.68l-0.18,1.08l0.03,0.18l0.87,1.81l-0.66,0.2l-0.55,-0.32l-0.36,0.05l-0.58,0.58l-1.73,0.62l-0.99,0.84l-1.77,0.7l-0.16,0.4l0.42,0.94l0.26,1.34l0.14,0.2l1.25,0.76l1.22,1.2l-0.71,1.2l-0.81,0.37l-0.17,0.32l0.34,1.99l-0.04,0.09l-0.47,-0.39l-0.17,-0.07l-1.2,-0.1l-1.85,0.57l-2.15,-0.13l-0.29,0.18l-0.21,0.5l-0.96,-0.67l-0.24,-0.05l-0.67,0.16l-2.6,-0.94l-0.34,0.1l-0.42,0.57l-1.64,-0.02l0.26,-1.88l1.24,-2.15l-0.21,-0.45l-3.54,-0.58l-0.98,-0.71l0.12,-1.26l-0.05,-0.2l-0.44,-0.64l0.27,-2.18l-0.38,-3.14l1.17,-0.0l0.27,-0.17l0.63,-1.26l0.65,-3.17l-0.02,-0.17l-0.41,-1.0l0.32,-0.47l1.77,-0.16l0.37,0.6l0.47,0.06l1.7,-1.69l0.06,-0.33l-0.55,-1.24l-0.09,-1.51l1.5,0.36l0.16,-0.01l1.22,-0.4Z",
            name: "Germany"
        },
        YE: {
            path: "M553.53,242.65l-1.51,0.58l-0.17,0.16l-0.48,1.14l-0.07,0.79l-2.31,1.0l-3.98,1.19l-2.28,1.8l-0.97,0.12l-0.7,-0.14l-0.23,0.05l-1.42,1.03l-1.51,0.47l-2.07,0.13l-0.68,0.15l-0.17,0.1l-0.49,0.6l-0.57,0.16l-0.18,0.13l-0.3,0.49l-1.06,-0.05l-0.13,0.02l-0.73,0.32l-1.48,-0.11l-0.55,-1.26l0.07,-1.32l-0.04,-0.16l-0.39,-0.72l-0.48,-1.85l-0.52,-0.79l0.08,-0.02l0.22,-0.36l-0.23,-1.05l0.24,-0.39l0.04,-0.19l-0.09,-0.95l0.96,-0.72l0.11,-0.31l-0.23,-0.98l0.46,-0.88l0.75,0.49l0.26,0.03l0.63,-0.22l2.76,-0.06l0.5,0.25l2.42,0.26l0.85,-0.11l0.52,0.71l0.35,0.1l1.17,-0.43l0.15,-0.12l1.75,-2.64l2.22,-1.11l6.95,-0.96l2.55,5.58Z",
            name: "Yemen"
        },
        AT: {
            path: "M463.17,154.15l-0.14,0.99l-1.15,0.01l-0.24,0.47l0.39,0.56l-0.75,1.84l-0.36,0.4l-2.06,0.07l-0.14,0.04l-1.18,0.67l-1.96,-0.23l-3.43,-0.78l-0.5,-0.97l-0.33,-0.16l-2.47,0.55l-0.2,0.16l-0.18,0.37l-1.27,-0.38l-1.28,-0.09l-0.81,-0.41l0.25,-0.51l0.03,-0.18l-0.05,-0.28l0.35,-0.08l1.16,0.81l0.45,-0.13l0.27,-0.64l2.0,0.12l1.84,-0.57l1.05,0.09l0.71,0.59l0.47,-0.11l0.23,-0.54l0.02,-0.17l-0.32,-1.85l0.69,-0.31l0.13,-0.12l0.73,-1.23l1.61,0.89l0.35,-0.04l1.35,-1.27l0.7,-0.19l1.84,0.93l0.18,0.03l1.08,-0.15l0.81,0.43l-0.07,0.15l-0.02,0.2l0.24,1.06Z",
            name: "Austria"
        },
        DZ: {
            path: "M450.58,224.94l-8.31,4.86l-7.23,5.12l-3.46,1.13l-2.42,0.22l-0.02,-1.33l-0.2,-0.28l-1.15,-0.42l-1.45,-0.69l-0.55,-1.13l-0.1,-0.12l-8.45,-5.72l-17.72,-12.17l0.03,-0.38l-0.02,-3.21l3.84,-1.91l2.46,-0.41l2.1,-0.75l0.14,-0.11l0.9,-1.3l2.84,-1.06l0.19,-0.27l0.09,-1.81l1.21,-0.2l0.15,-0.07l1.06,-0.96l3.19,-0.46l0.23,-0.18l0.46,-1.08l-0.08,-0.34l-0.6,-0.54l-0.83,-2.85l-0.18,-1.8l-0.82,-1.57l2.13,-1.37l2.65,-0.49l0.13,-0.05l1.55,-1.15l2.34,-0.85l4.2,-0.51l4.07,-0.23l1.21,0.41l0.23,-0.01l2.3,-1.11l2.52,-0.02l0.94,0.62l0.2,0.05l1.25,-0.13l-0.36,1.03l-0.01,0.14l0.39,2.66l-0.56,2.2l-1.49,1.52l-0.08,0.24l0.22,2.12l0.11,0.2l1.94,1.58l0.02,0.54l0.12,0.23l1.45,1.06l1.04,4.85l0.81,2.42l0.13,1.19l-0.43,2.17l0.17,1.28l-0.31,1.53l0.2,1.56l-0.9,1.02l-0.01,0.38l1.43,1.88l0.09,1.06l0.04,0.13l0.89,1.48l0.37,0.12l1.03,-0.43l1.79,1.12l0.89,1.34Z",
            name: "Algeria"
        },
        US: {
            path: "M892.64,99.05l1.16,0.57l0.21,0.02l1.45,-0.38l1.92,0.99l2.17,0.47l-1.65,0.72l-1.75,-0.79l-0.93,-0.7l-0.21,-0.06l-2.11,0.22l-0.35,-0.2l0.09,-0.87ZM183.29,150.37l0.39,1.54l0.12,0.17l0.78,0.55l0.14,0.05l1.74,0.2l2.52,0.5l2.4,0.98l0.17,0.02l1.96,-0.4l3.01,0.81l0.91,-0.02l2.22,-0.88l4.67,2.33l3.86,2.01l0.21,0.71l0.15,0.18l0.33,0.17l-0.02,0.05l0.23,0.43l0.67,0.1l0.21,-0.05l0.1,-0.07l0.05,0.29l0.09,0.16l0.5,0.5l0.21,0.09l0.56,0.0l0.13,0.13l-0.2,0.36l0.12,0.41l2.49,1.39l0.99,5.24l-0.69,1.68l-1.16,1.64l-0.6,1.18l-0.06,0.31l0.04,0.22l0.28,0.43l0.11,0.1l0.85,0.47l0.15,0.04l0.63,0.0l0.14,-0.04l2.87,-1.58l2.6,-0.49l3.28,-1.5l0.17,-0.23l0.04,-0.43l-0.23,-0.93l-0.24,-0.39l0.74,-0.32l4.7,-0.01l0.25,-0.13l0.77,-1.15l2.9,-2.41l1.04,-0.52l8.35,-0.02l0.28,-0.21l0.2,-0.6l0.7,-0.14l1.06,-0.48l0.13,-0.11l0.92,-1.49l0.75,-2.39l1.67,-2.08l0.59,0.6l0.3,0.07l1.52,-0.49l0.88,0.72l-0.0,4.14l0.08,0.2l1.6,1.72l0.31,0.72l-2.42,1.35l-2.55,1.05l-2.64,0.9l-0.14,0.11l-1.33,1.81l-0.44,0.7l-0.05,0.15l-0.03,1.6l0.03,0.14l0.83,1.59l0.24,0.16l0.78,0.06l-1.15,0.33l-1.25,-0.04l-1.83,0.52l-2.51,0.29l-2.17,0.88l-0.17,0.36l0.33,0.22l3.55,-0.54l0.15,0.11l-2.87,0.73l-1.19,0.0l-0.16,-0.33l-0.36,0.06l-0.76,0.82l0.17,0.5l0.42,0.08l-0.45,1.75l-1.4,1.74l-0.04,-0.17l-0.21,-0.22l-0.48,-0.13l-0.77,-0.69l-0.36,-0.03l-0.12,0.34l0.52,1.58l0.09,0.14l0.52,0.43l0.03,0.87l-0.74,1.05l-0.39,0.63l0.05,-0.12l-0.08,-0.34l-1.19,-1.03l-0.28,-2.31l-0.26,-0.26l-0.32,0.19l-0.48,1.27l-0.01,0.19l0.39,1.33l-1.14,-0.31l-0.36,0.18l0.14,0.38l1.57,0.85l0.1,2.58l0.22,0.28l0.55,0.15l0.21,0.81l0.33,2.72l-1.46,1.94l-2.5,0.81l-0.12,0.07l-1.58,1.58l-1.15,0.17l-0.15,0.06l-1.27,1.03l-0.09,0.13l-0.32,0.85l-2.71,1.79l-1.45,1.37l-1.18,1.64l-0.05,0.12l-0.39,1.96l0.0,0.13l0.44,1.91l0.85,2.37l1.1,1.91l0.03,1.2l1.16,3.07l-0.08,1.74l-0.1,0.99l-0.57,1.48l-0.54,0.24l-0.97,-0.26l-0.34,-1.02l-0.12,-0.16l-0.89,-0.58l-2.44,-4.28l-0.34,-0.94l0.49,-1.71l-0.02,-0.21l-0.7,-1.5l-2.0,-2.35l-0.11,-0.08l-0.98,-0.42l-0.25,0.01l-2.42,1.19l-0.26,-0.08l-1.26,-1.29l-1.57,-0.68l-0.16,-0.02l-2.79,0.34l-2.18,-0.3l-1.98,0.19l-1.12,0.45l-0.14,0.44l0.4,0.65l-0.04,1.02l0.09,0.22l0.29,0.3l-0.06,0.05l-0.77,-0.33l-0.26,0.01l-0.87,0.48l-1.64,-0.08l-1.79,-1.39l-0.23,-0.06l-2.11,0.33l-1.75,-0.61l-0.14,-0.01l-1.61,0.2l-2.11,0.64l-0.11,0.06l-2.25,1.99l-2.53,1.21l-1.43,1.38l-0.58,1.22l-0.03,0.12l-0.03,1.86l0.13,1.32l0.3,0.62l-0.46,0.04l-1.71,-0.57l-1.85,-0.79l-0.63,-1.14l-0.54,-1.85l-0.07,-0.12l-1.45,-1.51l-0.86,-1.58l-1.26,-1.87l-0.09,-0.09l-1.76,-1.09l-0.17,-0.04l-2.05,0.05l-0.23,0.12l-1.44,1.97l-1.84,-0.72l-1.19,-0.76l-0.6,-1.45l-0.9,-1.52l-1.49,-1.21l-1.27,-0.87l-0.89,-0.96l-0.22,-0.1l-4.34,-0.0l-0.3,0.3l-0.0,0.84l-6.62,0.02l-5.66,-1.93l-3.48,-1.24l0.11,-0.25l-0.3,-0.42l-3.18,0.3l-2.6,0.2l-0.35,-1.19l-0.08,-0.13l-1.62,-1.61l-0.13,-0.08l-1.02,-0.29l-0.22,-0.66l-0.25,-0.2l-1.31,-0.13l-0.82,-0.7l-0.16,-0.07l-2.25,-0.27l-0.48,-0.34l-0.28,-1.44l-0.07,-0.14l-2.41,-2.84l-2.03,-3.89l0.08,-0.58l-0.1,-0.27l-1.08,-0.94l-1.87,-2.36l-0.33,-2.31l-0.07,-0.15l-1.24,-1.5l0.52,-2.4l-0.09,-2.57l-0.78,-2.3l0.96,-2.83l0.61,-5.66l-0.46,-4.26l-0.79,-2.71l-0.68,-1.4l0.13,-0.26l3.24,0.97l1.28,2.88l0.52,0.06l0.62,-0.84l0.06,-0.22l-0.4,-2.61l-0.74,-2.29l68.9,-0.0l0.3,-0.3l0.01,-0.95l0.32,-0.01ZM32.5,67.43l1.75,1.99l0.41,0.04l1.02,-0.81l3.79,0.25l-0.1,0.72l0.24,0.34l3.83,0.77l2.6,-0.44l5.21,1.41l4.84,0.43l1.9,0.57l0.15,0.01l3.25,-0.71l3.72,1.32l2.52,0.58l-0.03,38.14l0.29,0.3l2.41,0.11l2.34,1.0l1.7,1.59l2.22,2.42l0.42,0.03l2.41,-2.04l2.25,-1.08l1.23,1.76l1.71,1.53l2.24,1.62l1.54,2.56l2.56,4.09l0.11,0.11l4.1,2.17l0.06,1.93l-1.12,1.35l-1.22,-1.14l-2.08,-1.05l-0.68,-2.94l-0.09,-0.16l-3.18,-2.84l-1.32,-3.35l-0.25,-0.19l-2.43,-0.24l-3.93,-0.09l-2.85,-1.02l-5.24,-3.85l-6.77,-2.04l-3.52,0.3l-4.84,-1.7l-2.96,-1.6l-0.23,-0.02l-2.78,0.8l-0.21,0.35l0.46,2.31l-1.11,0.19l-2.9,0.78l-2.24,1.26l-2.42,0.68l-0.29,-1.79l1.07,-3.49l2.54,-1.11l0.12,-0.45l-0.69,-0.96l-0.41,-0.07l-3.19,2.12l-1.76,2.54l-3.57,2.62l-0.03,0.46l1.63,1.59l-2.14,2.38l-2.64,1.49l-2.49,1.09l-0.16,0.17l-0.58,1.48l-3.8,1.79l-0.14,0.14l-0.75,1.57l-2.75,1.41l-1.62,-0.25l-0.16,0.02l-2.35,0.98l-2.54,1.19l-2.06,1.15l-4.05,0.93l-0.1,-0.15l2.45,-1.45l2.49,-1.1l2.61,-1.88l3.03,-0.39l0.19,-0.1l1.2,-1.41l3.43,-2.11l0.61,-0.75l1.81,-1.24l0.13,-0.2l0.42,-2.7l1.24,-2.12l-0.03,-0.35l-0.34,-0.09l-2.73,1.05l-0.67,-0.53l-0.39,0.02l-1.13,1.11l-1.43,-1.62l-0.49,0.06l-0.41,0.8l-0.67,-1.31l-0.42,-0.12l-2.43,1.43l-1.18,-0.0l-0.18,-1.86l0.43,-1.3l-0.09,-0.33l-1.61,-1.33l-0.26,-0.06l-3.11,0.68l-2.0,-1.66l-1.61,-0.85l-0.01,-1.97l-0.11,-0.23l-1.76,-1.48l0.86,-1.96l2.01,-2.13l0.88,-1.94l1.79,-0.25l1.65,0.6l0.31,-0.06l1.91,-1.8l1.67,0.31l0.22,-0.04l1.91,-1.23l0.13,-0.33l-0.47,-1.82l-0.15,-0.19l-1.0,-0.52l1.51,-1.27l0.09,-0.34l-0.29,-0.19l-1.62,0.06l-2.66,0.88l-0.13,0.09l-0.62,0.72l-1.77,-0.8l-0.16,-0.02l-3.48,0.44l-3.5,-0.92l-1.06,-1.61l-2.78,-2.09l3.07,-1.51l5.52,-2.01l1.65,0.0l-0.28,1.73l0.31,0.35l5.29,-0.16l0.23,-0.49l-2.03,-2.59l-0.1,-0.08l-3.03,-1.58l-1.79,-2.12l-2.4,-1.83l-3.18,-1.27l1.13,-1.84l4.28,-0.14l0.15,-0.05l3.16,-2.0l0.13,-0.17l0.57,-2.07l2.43,-2.02l2.42,-0.52l4.67,-1.98l2.22,0.29l0.2,-0.04l3.74,-2.37l3.57,0.91ZM37.66,123.49l-2.31,1.26l-1.04,-0.75l-0.31,-1.35l2.06,-1.16l1.24,-0.51l1.48,0.22l0.76,0.81l-1.89,1.49ZM30.89,233.84l1.2,0.57l0.35,0.3l0.48,0.69l-1.6,0.86l-0.3,0.31l-0.24,-0.14l0.05,-0.54l-0.02,-0.15l-0.36,-0.83l0.05,-0.12l0.39,-0.38l0.07,-0.31l-0.09,-0.27ZM29.06,231.89l0.5,0.14l0.31,0.19l-0.46,0.1l-0.34,-0.43ZM25.02,230.13l0.2,-0.11l0.4,0.47l-0.43,-0.05l-0.17,-0.31ZM21.29,228.68l0.1,-0.07l0.22,0.02l0.02,0.21l-0.02,0.02l-0.32,-0.18ZM6.0,113.33l-1.19,0.45l-1.5,-0.64l-0.94,-0.63l1.76,-0.46l1.71,0.29l0.16,0.98Z",
            name: "United States of America"
        },
        UY: {
            path: "M276.9,363.17l1.3,-0.23l2.4,2.04l0.22,0.07l0.82,-0.07l2.48,1.7l1.93,1.5l1.28,1.67l-0.95,1.14l-0.04,0.31l0.63,1.45l-0.96,1.57l-2.65,1.47l-1.73,-0.53l-0.15,-0.01l-1.25,0.28l-2.22,-1.16l-0.16,-0.03l-1.56,0.08l-1.33,-1.36l0.17,-1.58l0.48,-0.55l0.07,-0.2l-0.02,-2.74l0.66,-2.8l0.57,-2.02Z",
            name: "Uruguay"
        },
        LB: {
            path: "M510.44,198.11l-0.48,0.03l-0.26,0.17l-0.15,0.32l-0.21,-0.0l0.72,-1.85l1.19,-1.9l0.74,0.09l0.27,0.73l-1.19,0.93l-0.09,0.13l-0.54,1.36Z",
            name: "Lebanon"
        },
        LA: {
            path: "M684.87,248.8l0.61,-0.86l0.05,-0.16l0.11,-2.17l-0.08,-0.22l-1.96,-2.16l-0.15,-2.44l-0.08,-0.18l-1.9,-2.1l-0.19,-0.1l-1.89,-0.18l-0.29,0.15l-0.42,0.76l-1.21,0.06l-0.67,-0.41l-0.31,-0.0l-2.2,1.29l-0.05,-1.77l0.61,-2.7l-0.27,-0.37l-1.44,-0.1l-0.12,-1.31l-0.12,-0.21l-0.87,-0.65l0.38,-0.68l1.76,-1.41l0.08,0.22l0.27,0.2l1.33,0.07l0.31,-0.34l-0.35,-2.75l0.85,-0.25l1.32,1.88l1.11,2.36l0.27,0.17l2.89,0.02l0.78,1.82l-1.32,0.56l-0.12,0.09l-0.72,0.93l0.1,0.45l2.93,1.52l3.62,5.27l1.88,1.78l0.58,1.67l-0.38,2.11l-1.87,-0.79l-0.37,0.11l-0.99,1.54l-1.51,-0.73Z",
            name: "Laos"
        },
        TW: {
            path: "M725.6,222.5l-1.5,4.22l-0.82,1.65l-1.01,-1.7l-0.26,-1.8l1.4,-2.48l1.8,-1.81l0.76,0.53l-0.38,1.39Z",
            name: "Taiwan"
        },
        TT: {
            path: "M266.35,259.46l0.41,-0.39l0.09,-0.23l-0.04,-0.75l1.14,-0.26l0.2,0.03l-0.07,1.37l-1.73,0.23Z",
            name: "Trinidad and Tobago"
        },
        TR: {
            path: "M513.25,175.38l3.63,1.17l0.14,0.01l2.88,-0.45l2.11,0.26l0.18,-0.03l2.9,-1.53l2.51,-0.13l2.25,1.37l0.36,0.88l-0.23,1.36l0.19,0.33l1.81,0.72l0.61,0.53l-1.31,0.64l-0.16,0.34l0.76,3.24l-0.44,0.8l0.01,0.3l1.19,2.02l-0.71,0.29l-0.74,-0.62l-0.15,-0.07l-2.91,-0.37l-0.15,0.02l-1.04,0.43l-2.78,0.44l-1.44,-0.03l-2.83,1.06l-1.95,0.01l-1.28,-0.52l-0.2,-0.01l-2.62,0.76l-0.7,-0.48l-0.47,0.22l-0.13,1.49l-1.01,0.94l-0.58,-0.82l0.79,-0.9l0.04,-0.34l-0.31,-0.15l-1.46,0.23l-2.03,-0.64l-0.3,0.07l-1.65,1.58l-3.58,0.3l-1.94,-1.47l-0.17,-0.06l-2.7,-0.1l-0.28,0.17l-0.51,1.06l-1.47,0.29l-2.32,-1.46l-0.17,-0.05l-2.55,0.05l-1.4,-2.7l-1.72,-1.54l1.11,-2.06l-0.07,-0.37l-1.35,-1.19l2.47,-2.51l3.74,-0.11l0.26,-0.17l0.96,-2.07l4.56,0.38l0.19,-0.05l2.97,-1.92l2.84,-0.83l4.03,-0.06l4.31,2.08ZM488.85,176.8l-1.81,1.38l-0.57,-1.01l0.02,-0.36l0.45,-0.25l0.13,-0.15l0.78,-1.87l-0.11,-0.37l-0.72,-0.47l1.91,-0.71l1.89,0.35l0.25,0.97l0.17,0.2l1.87,0.83l-0.19,0.31l-2.82,0.16l-0.18,0.07l-1.06,0.91Z",
            name: "Turkey"
        },
        LK: {
            path: "M625.44,266.07l-0.35,2.4l-0.9,0.61l-1.91,0.5l-1.04,-1.75l-0.43,-3.5l1.0,-3.6l1.34,1.09l1.13,1.72l1.16,2.52Z",
            name: "Sri Lanka"
        },
        TN: {
            path: "M444.91,206.18l-0.99,-4.57l-0.12,-0.18l-1.43,-1.04l-0.02,-0.53l-0.11,-0.22l-1.95,-1.59l-0.19,-1.85l1.44,-1.47l0.08,-0.14l0.59,-2.34l-0.38,-2.77l0.44,-1.28l2.52,-1.08l1.41,0.28l-0.06,1.2l0.43,0.28l1.81,-0.9l0.02,0.06l-1.14,1.28l-0.08,0.2l-0.02,1.32l0.11,0.24l0.74,0.6l-0.29,2.18l-1.56,1.35l-0.09,0.32l0.48,1.54l0.28,0.21l1.11,0.04l0.55,1.17l0.15,0.14l0.76,0.35l-0.12,1.79l-1.1,0.72l-0.8,0.91l-1.68,1.04l-0.13,0.32l0.25,1.08l-0.18,0.96l-0.74,0.39Z",
            name: "Tunisia"
        },
        TL: {
            path: "M734.21,307.22l0.17,-0.34l1.99,-0.52l1.72,-0.08l0.78,-0.3l0.29,0.1l-0.43,0.32l-2.57,1.09l-1.71,0.59l-0.05,-0.49l-0.19,-0.36Z",
            name: "East Timor"
        },
        TM: {
            path: "M553.16,173.51l-0.12,1.0l-0.26,-0.65l0.38,-0.34ZM553.54,173.16l0.13,-0.12l0.43,-0.09l-0.56,0.21ZM555.68,172.6l0.65,-0.14l1.53,0.76l1.71,2.29l0.27,0.12l1.27,-0.14l2.81,-0.04l0.29,-0.38l-0.35,-1.27l1.98,-0.97l1.96,-1.63l3.05,1.44l0.25,2.23l0.14,0.22l0.96,0.61l0.18,0.05l2.61,-0.13l0.68,0.44l1.2,2.97l0.1,0.13l2.85,2.03l1.67,1.41l2.66,1.45l3.13,1.17l-0.05,1.23l-0.36,-0.04l-1.12,-0.73l-0.44,0.14l-0.34,0.89l-1.96,0.52l-0.22,0.23l-0.47,2.17l-1.26,0.78l-1.93,0.42l-0.21,0.18l-0.46,1.14l-1.64,0.33l-2.3,-0.97l-0.2,-2.23l-0.28,-0.27l-1.76,-0.1l-2.78,-2.48l-0.15,-0.07l-1.95,-0.31l-2.82,-1.48l-1.78,-0.27l-0.18,0.03l-1.03,0.51l-1.6,-0.08l-0.22,0.08l-1.72,1.6l-1.83,0.46l-0.39,-1.7l0.36,-3.0l-0.16,-0.3l-1.73,-0.88l0.57,-1.77l-0.25,-0.39l-1.33,-0.14l0.41,-1.85l2.05,0.63l0.21,-0.01l2.2,-0.95l0.09,-0.49l-1.78,-1.75l-0.69,-1.66l-0.07,-0.03Z",
            name: "Turkmenistan"
        },
        TJ: {
            path: "M597.99,178.71l-0.23,0.23l-2.57,-0.47l-0.35,0.25l-0.24,1.7l0.32,0.34l2.66,-0.22l3.15,0.95l4.47,-0.42l0.58,2.45l0.39,0.21l0.71,-0.25l1.22,0.53l-0.06,1.01l0.29,1.28l-2.19,-0.0l-1.71,-0.21l-0.23,0.07l-1.51,1.25l-1.05,0.27l-0.77,0.51l-0.71,-0.67l0.22,-2.28l-0.24,-0.32l-0.43,-0.08l0.17,-0.57l-0.16,-0.36l-1.36,-0.66l-0.34,0.05l-1.08,1.01l-0.09,0.15l-0.25,1.09l-0.24,0.26l-1.36,-0.05l-0.27,0.14l-0.65,1.06l-0.58,-0.39l-0.3,-0.02l-1.68,0.86l-0.36,-0.16l1.28,-2.65l0.02,-0.2l-0.54,-2.17l-0.18,-0.21l-1.53,-0.58l0.41,-0.82l1.89,0.13l0.26,-0.12l1.19,-1.63l0.77,-1.82l2.66,-0.55l-0.33,0.87l0.01,0.23l0.36,0.82l0.3,0.18l0.23,-0.02Z",
            name: "Tajikistan"
        },
        LS: {
            path: "M493.32,359.69l0.69,0.65l-0.65,1.12l-0.38,0.8l-1.27,0.39l-0.18,0.15l-0.4,0.77l-0.59,0.18l-1.59,-1.78l1.16,-1.5l1.3,-1.02l0.97,-0.46l0.94,0.72Z",
            name: "Lesotho"
        },
        TH: {
            path: "M677.42,253.68l-1.7,-0.88l-0.14,-0.03l-1.77,0.04l0.3,-1.64l-0.3,-0.35l-2.21,0.01l-0.3,0.28l-0.2,2.76l-2.15,5.9l-0.02,0.13l0.17,1.83l0.28,0.27l1.45,0.07l0.93,2.1l0.44,2.15l0.08,0.15l1.4,1.44l0.16,0.09l1.43,0.27l1.04,1.05l-0.58,0.73l-1.24,0.22l-0.15,-0.99l-0.15,-0.22l-2.04,-1.1l-0.36,0.06l-0.23,0.23l-0.72,-0.71l-0.41,-1.18l-0.06,-0.11l-1.33,-1.42l-1.22,-1.2l-0.5,0.13l-0.15,0.54l-0.14,-0.41l0.26,-1.48l0.73,-2.38l1.2,-2.57l1.37,-2.35l0.02,-0.27l-0.95,-2.26l0.03,-1.19l-0.29,-1.42l-0.06,-0.13l-1.65,-2.0l-0.46,-0.99l0.62,-0.34l0.13,-0.15l0.92,-2.23l-0.02,-0.27l-1.05,-1.74l-1.57,-1.86l-1.04,-1.96l0.76,-0.34l0.16,-0.16l1.07,-2.63l1.58,-0.1l0.16,-0.06l1.43,-1.11l1.24,-0.52l0.84,0.62l0.13,1.43l0.28,0.27l1.34,0.09l-0.54,2.39l0.05,2.39l0.45,0.25l2.48,-1.45l0.6,0.36l0.17,0.04l1.47,-0.07l0.25,-0.15l0.41,-0.73l1.58,0.15l1.76,1.93l0.15,2.44l0.08,0.18l1.94,2.15l-0.1,1.96l-0.66,0.93l-2.25,-0.34l-3.24,0.49l-0.19,0.12l-1.6,2.12l-0.06,0.24l0.48,2.46Z",
            name: "Thailand"
        },
        TF: {
            path: "M593.76,417.73l1.38,0.84l2.15,0.37l0.04,0.31l-0.59,1.24l-3.36,0.19l-0.05,-1.38l0.43,-1.56Z",
            name: "French Southern and Antarctic Lands"
        },
        TG: {
            path: "M425.23,269.29l-1.49,0.4l-0.43,-0.68l-0.64,-1.54l-0.18,-1.16l0.54,-2.21l-0.04,-0.24l-0.59,-0.86l-0.23,-1.9l0.0,-1.82l-0.07,-0.19l-0.95,-1.19l0.1,-0.41l1.58,0.04l-0.23,0.97l0.08,0.28l1.55,1.55l0.09,1.13l0.08,0.19l0.42,0.43l-0.11,5.66l0.52,1.53Z",
            name: "Togo"
        },
        TD: {
            path: "M457.57,252.46l0.23,-1.08l-0.28,-0.36l-1.32,-0.05l0.0,-1.35l-0.1,-0.22l-0.9,-0.82l0.99,-3.1l3.12,-2.37l0.12,-0.23l0.13,-3.33l0.95,-5.2l0.53,-1.09l-0.07,-0.36l-0.94,-0.81l-0.03,-0.7l-0.12,-0.23l-0.84,-0.61l-0.57,-3.76l2.21,-1.26l19.67,9.88l0.12,9.74l-1.83,-0.15l-0.28,0.14l-1.14,1.89l-0.68,1.62l0.05,0.31l0.33,0.38l-0.61,0.58l-0.08,0.3l0.25,0.93l-0.58,0.95l-0.29,1.01l0.34,0.37l0.67,-0.11l0.39,0.73l0.03,1.4l0.11,0.23l0.8,0.65l-0.01,0.24l-1.38,0.37l-0.11,0.06l-1.27,1.03l-1.83,2.76l-2.21,1.1l-2.34,-0.15l-0.82,0.25l-0.2,0.37l0.19,0.68l-1.16,0.79l-1.01,0.94l-2.92,0.89l-0.5,-0.46l-0.17,-0.08l-0.41,-0.05l-0.28,0.12l-0.38,0.54l-1.36,0.12l0.1,-0.18l0.01,-0.27l-0.78,-1.72l-0.35,-1.03l-0.17,-0.18l-1.03,-0.41l-1.29,-1.28l0.36,-0.78l0.9,0.2l0.14,-0.0l0.67,-0.17l1.36,0.02l0.26,-0.45l-1.32,-2.22l0.09,-1.64l-0.17,-1.68l-0.04,-0.13l-0.93,-1.53Z",
            name: "Chad"
        },
        LY: {
            path: "M457.99,226.38l-1.57,0.87l-1.25,-1.28l-0.13,-0.08l-3.85,-1.11l-1.04,-1.57l-0.09,-0.09l-1.98,-1.23l-0.27,-0.02l-0.93,0.39l-0.72,-1.2l-0.09,-1.07l-0.06,-0.16l-1.33,-1.75l0.83,-0.94l0.07,-0.24l-0.21,-1.64l0.31,-1.43l-0.17,-1.29l0.43,-2.26l-0.15,-1.33l-0.73,-2.18l0.99,-0.52l0.16,-0.21l0.22,-1.16l-0.22,-1.06l1.54,-0.95l0.81,-0.92l1.19,-0.78l0.14,-0.23l0.12,-1.76l2.57,0.84l0.16,0.01l0.99,-0.23l2.01,0.45l3.19,1.2l1.12,2.36l0.2,0.16l2.24,0.53l3.5,1.14l2.65,1.36l0.29,-0.01l1.22,-0.71l1.27,-1.32l0.07,-0.29l-0.55,-2.0l0.69,-1.19l1.7,-1.23l1.61,-0.35l3.2,0.54l0.78,1.14l0.24,0.13l0.85,0.01l0.84,0.47l2.35,0.31l0.42,0.63l-0.79,1.16l-0.04,0.26l0.35,1.08l-0.61,1.6l-0.0,0.2l0.73,2.16l0.0,24.24l-2.58,0.01l-0.3,0.29l-0.02,0.62l-19.55,-9.83l-0.28,0.01l-2.53,1.44Z",
            name: "Libya"
        },
        AE: {
            path: "M550.59,223.8l0.12,0.08l1.92,-0.41l3.54,0.15l0.23,-0.09l1.71,-1.79l1.86,-1.7l1.31,-1.36l0.26,0.5l0.28,1.72l-0.93,0.01l-0.3,0.26l-0.21,1.73l0.11,0.27l0.08,0.06l-0.7,0.32l-0.17,0.27l-0.01,0.99l-0.68,1.02l-0.05,0.15l-0.06,0.96l-0.32,0.36l-7.19,-1.27l-0.79,-2.22Z",
            name: "United Arab Emirates"
        },
        VE: {
            path: "M240.66,256.5l0.65,0.91l-0.03,1.13l-1.05,1.39l-0.03,0.31l0.95,2.0l0.32,0.17l1.08,-0.16l0.24,-0.21l0.56,-1.83l-0.06,-0.29l-0.71,-0.81l-0.1,-1.58l2.9,-0.96l0.19,-0.37l-0.29,-1.02l0.45,-0.41l0.72,1.43l0.26,0.16l1.65,0.04l1.46,1.27l0.08,0.72l0.3,0.27l2.28,0.02l2.55,-0.25l1.34,1.06l0.14,0.06l1.92,0.31l0.2,-0.03l1.4,-0.79l0.15,-0.25l0.02,-0.36l2.82,-0.14l1.17,-0.01l-0.41,0.14l-0.14,0.46l0.86,1.19l0.22,0.12l1.93,0.18l1.73,1.13l0.37,1.9l0.31,0.24l1.21,-0.05l0.52,0.32l-1.63,1.21l-0.11,0.17l-0.22,0.92l0.07,0.27l0.63,0.69l-0.31,0.24l-1.48,0.39l-0.22,0.3l0.04,1.03l-0.59,0.6l-0.01,0.41l1.67,1.87l0.23,0.48l-0.72,0.76l-2.71,0.91l-1.78,0.39l-0.13,0.06l-0.6,0.49l-1.84,-0.58l-1.89,-0.33l-0.18,0.03l-0.47,0.23l-0.02,0.53l0.96,0.56l-0.08,1.58l0.35,1.58l0.26,0.23l1.91,0.19l0.02,0.07l-1.54,0.62l-0.18,0.2l-0.25,0.92l-0.88,0.35l-1.85,0.58l-0.16,0.13l-0.4,0.64l-1.66,0.14l-1.22,-1.18l-0.79,-2.52l-0.67,-0.88l-0.66,-0.43l0.99,-0.98l0.09,-0.26l-0.09,-0.56l-0.08,-0.16l-0.66,-0.69l-0.47,-1.54l0.18,-1.67l0.55,-0.85l0.45,-1.35l-0.15,-0.36l-0.89,-0.43l-0.19,-0.02l-1.39,0.28l-1.76,-0.13l-0.92,0.23l-1.64,-2.01l-0.17,-0.1l-1.54,-0.33l-3.05,0.23l-0.5,-0.73l-0.15,-0.12l-0.45,-0.15l-0.05,-0.28l0.28,-0.86l0.01,-0.15l-0.2,-1.01l-0.08,-0.15l-0.5,-0.5l-0.3,-1.08l-0.25,-0.22l-0.89,-0.12l0.54,-1.18l0.29,-1.73l0.66,-0.85l0.94,-0.7l0.09,-0.11l0.3,-0.6Z",
            name: "Venezuela"
        },
        AF: {
            path: "M574.42,192.1l2.24,0.95l0.18,0.02l1.89,-0.38l0.22,-0.18l0.46,-1.14l1.82,-0.4l1.5,-0.91l0.14,-0.19l0.46,-2.12l1.93,-0.51l0.2,-0.18l0.26,-0.68l0.87,0.57l0.13,0.05l0.79,0.09l1.35,0.02l1.83,0.59l0.75,0.34l0.26,-0.01l1.66,-0.85l0.7,0.46l0.42,-0.09l0.72,-1.17l1.32,0.05l0.23,-0.1l0.39,-0.43l0.07,-0.14l0.24,-1.08l0.86,-0.81l0.94,0.46l-0.2,0.64l0.23,0.38l0.49,0.09l-0.21,2.15l0.09,0.25l0.99,0.94l0.38,0.03l0.83,-0.57l1.06,-0.27l0.12,-0.06l1.46,-1.21l1.63,0.2l2.4,0.0l0.17,0.32l-1.12,0.25l-1.23,0.52l-2.86,0.33l-2.69,0.6l-0.13,0.06l-1.46,1.25l-0.07,0.36l0.58,1.18l0.25,1.21l-1.13,1.08l-0.09,0.25l0.09,0.98l-0.53,0.79l-2.22,-0.08l-0.28,0.44l0.83,1.57l-1.3,0.58l-0.13,0.11l-1.06,1.69l-0.05,0.18l0.13,1.51l-0.73,0.58l-0.78,-0.22l-0.14,-0.01l-1.91,0.36l-0.23,0.19l-0.2,0.57l-1.65,-0.0l-0.22,0.1l-1.4,1.56l-0.08,0.19l-0.08,2.13l-2.99,1.05l-1.67,-0.23l-0.27,0.1l-0.39,0.46l-1.43,-0.31l-2.43,0.4l-3.69,-1.23l1.96,-2.15l0.08,-0.24l-0.21,-1.78l-0.23,-0.26l-1.69,-0.42l-0.19,-1.62l-0.77,-2.08l0.98,-1.41l-0.14,-0.45l-0.82,-0.31l0.6,-1.79l0.93,-3.21Z",
            name: "Afghanistan"
        },
        IQ: {
            path: "M534.42,190.89l0.13,0.14l1.5,0.78l0.15,1.34l-1.13,0.87l-0.11,0.16l-0.58,2.2l0.04,0.24l1.73,2.67l0.12,0.1l2.99,1.49l1.18,1.94l-0.39,1.89l0.29,0.36l0.5,-0.0l0.02,1.17l0.08,0.2l0.83,0.86l-2.36,-0.29l-0.29,0.13l-1.74,2.49l-4.4,-0.21l-7.03,-5.49l-3.73,-1.94l-2.92,-0.74l-0.89,-3.0l5.33,-2.81l0.15,-0.19l0.95,-3.43l-0.2,-2.0l1.19,-0.61l0.11,-0.09l1.23,-1.73l0.92,-0.38l2.75,0.35l0.81,0.68l0.31,0.05l0.94,-0.38l1.5,3.17Z",
            name: "Iraq"
        },
        IS: {
            path: "M384.26,87.96l-0.51,2.35l0.08,0.28l2.61,2.58l-2.99,2.83l-7.16,2.72l-2.08,0.7l-9.51,-1.71l1.89,-1.36l-0.07,-0.53l-4.4,-1.59l3.33,-0.59l0.25,-0.32l-0.11,-1.2l-0.25,-0.27l-4.82,-0.88l1.38,-2.2l3.54,-0.57l3.8,2.74l0.33,0.01l3.68,-2.18l3.02,1.12l0.25,-0.02l4.01,-2.18l3.72,0.27Z",
            name: "Iceland"
        },
        IR: {
            path: "M556.2,187.5l2.05,-0.52l0.13,-0.07l1.69,-1.57l1.55,0.08l0.15,-0.03l1.02,-0.5l1.64,0.25l2.82,1.48l1.91,0.3l2.8,2.49l0.18,0.08l1.61,0.09l0.19,2.09l-1.0,3.47l-0.69,2.04l0.18,0.38l0.73,0.28l-0.85,1.22l-0.04,0.28l0.81,2.19l0.19,1.72l0.23,0.26l1.69,0.42l0.17,1.43l-2.18,2.39l-0.01,0.4l1.22,1.42l1.0,1.62l0.12,0.11l2.23,1.11l0.06,2.2l0.2,0.27l1.03,0.38l0.14,0.83l-3.38,1.3l-0.18,0.19l-0.87,2.85l-4.44,-0.76l-2.75,-0.62l-2.64,-0.32l-1.01,-3.11l-0.17,-0.19l-1.2,-0.48l-0.18,-0.01l-1.99,0.51l-2.42,1.25l-2.89,-0.84l-2.48,-2.03l-2.41,-0.79l-1.61,-2.47l-1.84,-3.63l-0.36,-0.15l-1.22,0.4l-1.48,-0.84l-0.37,0.06l-0.72,0.82l-1.08,-1.12l-0.02,-1.35l-0.3,-0.29l-0.43,0.0l0.34,-1.64l-0.04,-0.22l-1.29,-2.11l-0.12,-0.11l-3.0,-1.49l-1.62,-2.49l0.52,-1.98l1.18,-0.92l0.11,-0.27l-0.19,-1.66l-0.16,-0.23l-1.55,-0.81l-1.58,-3.33l-1.3,-2.2l0.41,-0.75l0.03,-0.21l-0.73,-3.12l1.2,-0.59l0.35,0.9l1.26,1.35l0.15,0.09l1.81,0.39l0.91,-0.09l0.15,-0.06l2.9,-2.13l0.7,-0.16l0.48,0.56l-0.75,1.26l0.05,0.37l1.56,1.53l0.28,0.08l0.37,-0.09l0.7,1.89l0.21,0.19l2.31,0.59l1.69,1.4l0.15,0.07l3.66,0.49l3.91,-0.76l0.23,-0.19l0.19,-0.52Z",
            name: "Iran"
        },
        AM: {
            path: "M530.51,176.08l2.91,-0.39l0.41,0.63l0.11,0.1l0.66,0.36l-0.32,0.47l0.07,0.41l1.1,0.84l-0.53,0.7l0.06,0.42l1.06,0.8l1.01,0.44l0.04,1.56l-0.44,0.04l-0.88,-1.46l0.01,-0.37l-0.3,-0.31l-0.98,0.01l-0.65,-0.69l-0.26,-0.09l-0.38,0.06l-0.97,-0.82l-1.64,-0.65l0.2,-1.2l-0.02,-0.16l-0.28,-0.69Z",
            name: "Armenia"
        },
        IT: {
            path: "M451.68,158.58l0.2,0.16l3.3,0.75l-0.22,1.26l0.02,0.18l0.35,0.78l-1.4,-0.32l-0.21,0.03l-2.04,1.1l-0.16,0.29l0.13,1.47l-0.29,0.82l0.02,0.24l0.82,1.57l0.1,0.11l2.28,1.5l1.29,2.53l2.79,2.43l0.2,0.07l1.83,-0.02l0.31,0.34l-0.46,0.39l0.06,0.5l4.06,1.97l2.06,1.49l0.17,0.36l-0.24,0.53l-1.08,-1.07l-0.15,-0.08l-2.18,-0.49l-0.33,0.15l-1.05,1.91l0.11,0.4l1.63,0.98l-0.22,1.12l-0.84,0.14l-0.22,0.15l-1.27,2.38l-0.54,0.12l0.01,-0.47l0.48,-1.46l0.5,-0.58l0.03,-0.35l-0.97,-1.69l-0.76,-1.48l-0.17,-0.15l-0.94,-0.33l-0.68,-1.18l-0.16,-0.13l-1.53,-0.52l-1.03,-1.14l-0.19,-0.1l-1.78,-0.19l-1.88,-1.3l-2.27,-1.94l-1.64,-1.68l-0.76,-2.94l-0.21,-0.21l-1.22,-0.35l-2.01,-1.0l-0.24,-0.01l-1.15,0.42l-0.11,0.07l-1.38,1.36l-0.5,0.11l0.19,-0.87l-0.21,-0.35l-1.19,-0.34l-0.56,-2.06l0.76,-0.82l0.03,-0.36l-0.68,-1.08l0.04,-0.31l0.68,0.42l0.19,0.04l1.21,-0.15l0.14,-0.06l1.18,-0.89l0.25,0.29l0.25,0.1l1.19,-0.1l0.25,-0.18l0.45,-1.04l1.61,0.34l0.19,-0.02l1.1,-0.53l0.17,-0.22l0.15,-0.95l1.19,0.35l0.35,-0.16l0.23,-0.47l2.11,-0.47l0.45,0.89ZM459.35,184.63l-0.71,1.81l0.0,0.23l0.33,0.79l-0.37,1.03l-1.6,-0.91l-1.33,-0.34l-3.24,-1.36l0.23,-0.99l2.73,0.24l3.95,-0.5ZM443.95,175.91l1.26,1.77l-0.31,3.47l-0.82,-0.13l-0.26,0.08l-0.83,0.79l-0.64,-0.52l-0.1,-3.42l-0.44,-1.34l0.91,0.1l0.21,-0.06l1.01,-0.74Z",
            name: "Italy"
        },
        VN: {
            path: "M690.8,230.21l-2.86,1.93l-2.09,2.46l-0.06,0.11l-0.55,1.8l0.04,0.26l4.26,6.1l2.31,1.63l1.46,1.97l1.12,4.62l-0.32,4.3l-1.97,1.57l-2.85,1.62l-2.09,2.14l-2.83,2.13l-0.67,-1.19l0.65,-1.58l-0.09,-0.35l-1.47,-1.14l1.67,-0.79l2.57,-0.18l0.22,-0.47l-0.89,-1.24l3.88,-1.8l0.17,-0.24l0.31,-3.05l-0.01,-0.13l-0.56,-1.63l0.44,-2.48l-0.01,-0.15l-0.63,-1.81l-0.08,-0.12l-1.87,-1.77l-3.64,-5.3l-0.11,-0.1l-2.68,-1.39l0.45,-0.59l1.53,-0.65l0.16,-0.39l-0.97,-2.27l-0.27,-0.18l-2.89,-0.02l-1.04,-2.21l-1.28,-1.83l0.96,-0.46l1.97,0.01l2.43,-0.3l0.13,-0.05l1.95,-1.29l1.04,0.85l0.13,0.06l1.98,0.42l-0.32,1.21l0.09,0.3l1.19,1.07l0.12,0.07l1.88,0.51Z",
            name: "Vietnam"
        },
        AR: {
            path: "M258.11,341.34l1.4,1.81l0.51,-0.06l0.89,-1.94l2.51,0.1l0.36,0.49l4.6,4.31l0.15,0.08l1.99,0.39l3.01,1.93l2.5,1.01l0.28,0.91l-2.4,3.97l0.17,0.44l2.57,0.74l2.81,0.41l2.09,-0.44l0.14,-0.07l2.27,-2.06l0.09,-0.17l0.38,-2.2l0.88,-0.36l1.05,1.29l-0.04,1.88l-1.98,1.4l-1.72,1.13l-2.84,2.65l-3.34,3.73l-0.07,0.12l-0.63,2.22l-0.67,2.85l0.02,2.73l-0.47,0.54l-0.07,0.17l-0.36,3.28l0.12,0.27l3.03,2.32l-0.31,1.78l0.11,0.29l1.44,1.15l-0.11,1.17l-2.32,3.57l-3.59,1.51l-4.95,0.6l-2.72,-0.29l-0.32,0.38l0.5,1.67l-0.49,2.13l0.01,0.16l0.4,1.29l-1.27,0.88l-2.41,0.39l-2.33,-1.05l-0.31,0.04l-0.97,0.78l-0.11,0.27l0.35,2.98l0.16,0.23l1.69,0.91l0.31,-0.02l1.08,-0.75l0.46,0.96l-2.1,0.88l-2.01,1.89l-0.09,0.18l-0.36,3.05l-0.51,1.42l-2.16,0.01l-0.19,0.07l-1.96,1.59l-0.1,0.15l-0.72,2.34l0.08,0.31l2.46,2.31l0.13,0.07l2.09,0.56l-0.74,2.45l-2.86,1.75l-0.12,0.14l-1.59,3.71l-2.2,1.24l-0.1,0.09l-1.03,1.54l-0.04,0.23l0.81,3.45l0.06,0.13l1.13,1.32l-2.59,-0.57l-5.89,-0.44l-0.92,-1.73l0.05,-2.4l-0.34,-0.3l-1.49,0.19l-0.72,-0.98l-0.2,-3.21l1.79,-1.33l0.1,-0.13l0.79,-2.04l0.02,-0.16l-0.27,-1.52l1.31,-2.69l0.91,-4.15l-0.23,-1.72l0.91,-0.49l0.15,-0.33l-0.27,-1.16l-0.15,-0.2l-0.87,-0.46l0.65,-1.01l-0.04,-0.37l-1.06,-1.09l-0.54,-3.2l0.83,-0.51l0.14,-0.29l-0.42,-3.6l0.58,-2.98l0.64,-2.5l1.41,-1.0l0.12,-0.32l-0.75,-2.8l-0.01,-2.48l1.81,-1.78l0.09,-0.22l-0.06,-2.3l1.39,-2.69l0.03,-0.14l0.01,-2.58l-0.11,-0.24l-0.57,-0.45l-1.1,-4.59l1.49,-2.73l0.04,-0.17l-0.23,-2.59l0.86,-2.38l1.6,-2.48l1.74,-1.65l0.04,-0.39l-0.64,-0.89l0.42,-0.7l0.04,-0.16l-0.08,-4.26l2.55,-1.23l0.16,-0.18l0.86,-2.75l-0.01,-0.22l-0.22,-0.48l1.84,-2.1l3.0,0.59ZM256.77,438.98l-2.1,0.15l-1.18,-1.14l-0.19,-0.08l-1.53,-0.09l-2.38,-0.0l-0.0,-6.28l0.4,0.65l1.25,2.55l0.11,0.12l3.26,2.07l3.19,0.8l-0.82,1.26Z",
            name: "Argentina"
        },
        AU: {
            path: "M705.55,353.06l0.09,0.09l0.37,0.05l0.13,-0.35l-0.57,-1.69l0.48,0.3l0.71,0.99l0.34,0.11l0.2,-0.29l-0.04,-1.37l-0.04,-0.14l-1.22,-2.07l-0.28,-0.9l-0.51,-0.69l0.24,-1.33l0.52,-0.7l0.34,-1.32l0.01,-0.13l-0.25,-1.44l0.51,-0.94l0.1,1.03l0.23,0.26l0.32,-0.14l1.01,-1.72l1.94,-0.84l1.27,-1.14l1.84,-0.92l1.0,-0.18l0.6,0.28l0.26,-0.0l1.94,-0.96l1.48,-0.28l0.19,-0.13l0.32,-0.49l0.51,-0.18l1.42,0.05l2.63,-0.76l0.11,-0.06l1.36,-1.15l0.08,-0.1l0.61,-1.33l1.42,-1.27l0.1,-0.19l0.11,-1.03l0.06,-1.32l1.39,-1.74l0.85,1.79l0.4,0.14l1.07,-0.51l0.11,-0.45l-0.77,-1.05l0.53,-0.84l0.86,0.43l0.43,-0.22l0.29,-1.85l1.29,-1.19l0.6,-0.98l1.16,-0.4l0.2,-0.27l0.02,-0.34l0.74,0.2l0.38,-0.27l0.03,-0.44l1.98,-0.61l1.7,1.08l1.36,1.48l0.22,0.1l1.55,0.02l1.57,0.24l0.33,-0.4l-0.48,-1.27l1.09,-1.86l1.06,-0.63l0.1,-0.42l-0.28,-0.46l0.93,-1.24l1.36,-0.8l1.16,0.27l0.14,0.0l2.1,-0.48l0.23,-0.3l-0.05,-1.3l-0.18,-0.26l-1.08,-0.49l0.44,-0.12l1.52,0.58l1.39,1.06l2.11,0.65l0.19,-0.0l0.59,-0.21l1.44,0.72l0.27,0.0l1.37,-0.68l0.84,0.2l0.26,-0.06l0.37,-0.3l0.82,0.89l-0.56,1.14l-0.84,0.91l-0.75,0.07l-0.26,0.38l0.26,0.9l-0.67,1.15l-0.88,1.24l-0.05,0.25l0.18,0.72l0.12,0.17l1.99,1.42l1.96,0.84l1.25,0.86l1.8,1.51l0.19,0.07l0.63,-0.0l1.15,0.58l0.34,0.7l0.17,0.15l2.39,0.88l0.24,-0.02l1.65,-0.88l0.14,-0.16l0.49,-1.37l0.52,-1.19l0.31,-1.39l0.75,-2.02l0.01,-0.19l-0.33,-1.16l0.16,-0.67l0.0,-0.13l-0.28,-1.41l0.3,-1.78l0.42,-0.45l0.05,-0.33l-0.33,-0.73l0.56,-1.25l0.48,-1.39l0.07,-0.69l0.58,-0.59l0.48,0.84l0.17,1.53l0.17,0.24l0.47,0.23l0.09,0.9l0.05,0.14l0.87,1.23l0.17,1.33l-0.09,0.89l0.03,0.15l0.9,2.0l0.43,0.13l1.38,-0.83l0.71,0.92l1.06,0.88l-0.22,0.96l0.0,0.14l0.53,2.2l0.38,1.3l0.15,0.18l0.52,0.26l0.62,2.01l-0.23,1.27l0.02,0.18l0.81,1.76l0.14,0.14l2.69,1.35l3.21,2.21l-0.2,0.4l0.04,0.34l1.39,1.6l0.95,2.78l0.43,0.16l0.79,-0.46l0.85,0.96l0.39,0.05l0.22,-0.15l0.36,2.33l0.09,0.18l1.78,1.63l1.16,1.01l1.9,2.1l0.67,2.05l0.06,1.47l-0.17,1.64l0.03,0.17l1.16,2.22l-0.14,2.28l-0.43,1.24l-0.68,2.44l0.04,1.63l-0.48,1.92l-1.06,2.43l-1.79,1.32l-0.1,0.12l-0.91,2.15l-0.82,1.37l-0.76,2.47l-0.98,1.46l-0.63,2.14l-0.33,2.02l0.1,0.82l-1.21,0.85l-2.71,0.1l-0.13,0.03l-2.31,1.19l-1.21,1.17l-1.34,1.11l-1.89,-1.18l-1.33,-0.46l0.32,-1.24l-0.4,-0.35l-1.46,0.61l-2.06,1.98l-1.99,-0.73l-1.43,-0.46l-1.45,-0.22l-2.32,-0.81l-1.51,-1.67l-0.45,-2.11l-0.6,-1.5l-0.07,-0.11l-1.23,-1.16l-0.16,-0.08l-1.96,-0.28l0.59,-0.99l0.03,-0.24l-0.61,-2.1l-0.54,-0.08l-1.16,1.85l-1.23,0.29l0.73,-0.88l0.06,-0.12l0.37,-1.57l0.93,-1.33l0.05,-0.2l-0.2,-2.07l-0.53,-0.17l-2.01,2.35l-1.52,0.94l-0.12,0.14l-0.82,1.93l-1.5,-0.9l0.07,-1.32l-0.06,-0.2l-1.57,-2.04l-1.15,-0.92l0.3,-0.41l-0.1,-0.44l-3.21,-1.69l-0.13,-0.03l-1.69,-0.08l-2.35,-1.31l-0.16,-0.04l-4.55,0.27l-3.24,0.99l-2.8,0.91l-2.33,-0.18l-0.17,0.03l-2.63,1.41l-2.14,0.64l-0.2,0.19l-0.47,1.42l-0.8,0.99l-1.99,0.06l-1.55,0.24l-2.27,-0.5l-1.79,0.3l-1.71,0.13l-0.19,0.09l-1.38,1.39l-0.58,-0.1l-0.21,0.04l-1.26,0.8l-1.13,0.85l-1.72,-0.1l-1.6,-0.0l-2.58,-1.76l-1.21,-0.49l0.04,-1.19l1.04,-0.32l0.16,-0.12l0.42,-0.64l0.05,-0.19l-0.09,-0.97l0.3,-2.0l-0.28,-1.64l-1.34,-2.84l-0.39,-1.49l0.1,-1.51l-0.04,-0.17l-0.96,-1.72l-0.06,-0.73l-0.09,-0.19l-1.04,-1.01l-0.3,-2.02l-0.05,-0.12l-1.23,-1.83ZM784.95,393.35l2.39,1.01l0.2,0.01l3.26,-0.96l1.19,0.16l0.16,3.19l-0.78,0.95l-0.07,0.16l-0.19,1.83l-0.43,-0.41l-0.44,0.03l-1.61,1.96l-0.4,-0.12l-1.38,-0.09l-1.43,-2.42l-0.37,-2.03l-1.4,-2.53l0.04,-0.94l1.27,0.2Z",
            name: "Australia"
        },
        IL: {
            path: "M509.04,199.22l0.71,0.0l0.27,-0.17l0.15,-0.33l0.19,-0.01l0.02,0.73l-0.27,0.34l0.02,0.08l-0.32,0.62l-0.65,-0.27l-0.41,0.19l-0.52,1.85l0.16,0.35l0.14,0.07l-0.17,0.1l-0.14,0.21l-0.11,0.73l0.39,0.33l0.81,-0.26l0.03,0.64l-0.97,3.43l-1.28,-3.67l0.62,-0.78l-0.03,-0.41l0.58,-1.16l0.5,-2.07l0.27,-0.54Z",
            name: "Israel"
        },
        IN: {
            path: "M615.84,192.58l2.4,2.97l-0.24,2.17l0.05,0.2l0.94,1.35l-0.06,0.97l-1.46,-0.3l-0.35,0.36l0.7,3.06l0.12,0.18l2.46,1.75l3.11,1.72l-1.23,0.96l-0.1,0.13l-0.97,2.55l0.16,0.38l2.41,1.02l2.37,1.33l3.27,1.52l3.43,0.37l1.37,1.3l0.17,0.08l1.92,0.25l3.0,0.62l2.15,-0.04l0.28,-0.22l0.29,-1.06l0.0,-0.13l-0.32,-1.66l0.16,-0.94l1.0,-0.37l0.23,2.28l0.18,0.24l2.28,1.02l0.2,0.02l1.52,-0.41l2.06,0.18l2.08,-0.08l0.29,-0.27l0.18,-1.66l-0.1,-0.26l-0.53,-0.44l1.38,-0.23l0.15,-0.07l2.26,-2.0l2.75,-1.65l1.97,0.63l0.25,-0.03l1.54,-0.99l0.89,1.28l-0.72,0.97l0.2,0.48l2.49,0.37l0.11,0.61l-0.69,0.39l-0.15,0.3l0.15,1.22l-1.36,-0.37l-0.23,0.03l-3.24,1.86l-0.15,0.28l0.07,1.44l-1.33,2.16l-0.04,0.13l-0.12,1.24l-0.98,1.91l-1.72,-0.53l-0.39,0.28l-0.09,2.66l-0.52,0.83l-0.04,0.23l0.21,0.89l-0.71,0.36l-1.21,-3.85l-0.29,-0.21l-0.69,0.01l-0.29,0.23l-0.28,1.17l-0.84,-0.84l0.6,-1.17l0.97,-0.13l0.23,-0.16l1.15,-2.25l-0.18,-0.42l-1.54,-0.47l-2.3,0.04l-2.13,-0.33l-0.19,-1.63l-0.26,-0.26l-1.13,-0.13l-1.93,-1.13l-0.42,0.13l-0.88,1.82l0.08,0.37l1.47,1.15l-1.21,0.77l-0.1,0.1l-0.56,0.97l0.13,0.42l1.31,0.61l-0.36,1.35l0.01,0.2l0.85,1.95l0.37,2.05l-0.26,0.68l-1.55,-0.02l-3.09,0.54l-0.25,0.32l0.13,1.84l-1.21,1.4l-3.64,1.79l-2.79,3.04l-1.86,1.61l-2.48,1.68l-0.13,0.25l-0.0,1.0l-1.07,0.55l-2.21,0.9l-1.13,0.13l-0.25,0.19l-0.75,1.96l-0.02,0.15l0.52,3.31l0.13,2.03l-1.03,2.35l-0.03,0.12l-0.01,4.03l-1.02,0.1l-0.23,0.15l-1.14,1.93l0.04,0.36l0.44,0.48l-1.83,0.57l-0.18,0.15l-0.81,1.65l-0.74,0.53l-2.14,-2.12l-1.14,-3.47l-0.96,-2.57l-0.9,-1.26l-1.3,-2.38l-0.61,-3.14l-0.44,-1.62l-2.29,-3.56l-1.03,-4.94l-0.74,-3.29l0.01,-3.12l-0.49,-2.51l-0.41,-0.22l-3.56,1.53l-1.59,-0.28l-2.96,-2.87l0.94,-0.74l0.06,-0.41l-0.74,-1.03l-2.73,-2.1l1.35,-1.43l5.38,0.01l0.29,-0.36l-0.5,-2.29l-0.09,-0.15l-1.33,-1.28l-0.27,-1.96l-0.12,-0.2l-1.36,-1.0l2.42,-2.48l2.77,0.2l0.24,-0.1l2.62,-2.85l1.59,-2.8l2.41,-2.74l0.07,-0.2l-0.04,-1.82l2.01,-1.51l-0.01,-0.49l-1.95,-1.33l-0.83,-1.81l-0.82,-2.27l0.98,-0.97l3.64,0.66l2.89,-0.42l0.17,-0.08l2.18,-2.15Z",
            name: "India"
        },
        TZ: {
            path: "M505.77,287.58l0.36,0.23l8.95,5.03l0.15,1.3l0.13,0.21l3.4,2.37l-1.07,2.88l-0.02,0.14l0.15,1.42l0.15,0.23l1.47,0.84l0.05,0.42l-0.66,1.44l-0.02,0.18l0.13,0.72l-0.16,1.16l0.03,0.19l0.87,1.57l1.03,2.48l0.12,0.14l0.53,0.32l-1.59,1.18l-2.64,0.95l-1.45,-0.04l-0.2,0.07l-0.81,0.69l-1.64,0.06l-0.68,0.3l-2.9,-0.69l-1.71,0.17l-0.65,-3.18l-0.05,-0.12l-1.35,-1.88l-0.19,-0.12l-2.41,-0.46l-1.38,-0.74l-1.63,-0.44l-0.96,-0.41l-0.95,-0.58l-1.31,-3.09l-1.47,-1.46l-0.45,-1.31l0.24,-1.34l-0.39,-1.99l0.71,-0.08l0.18,-0.09l0.91,-0.91l0.98,-1.31l0.59,-0.5l0.11,-0.24l-0.02,-0.81l-0.08,-0.2l-0.47,-0.5l-0.1,-0.67l0.51,-0.23l0.18,-0.25l0.14,-1.47l-0.05,-0.2l-0.76,-1.09l0.45,-0.15l2.71,0.03l5.01,-0.19Z",
            name: "Tanzania"
        },
        AZ: {
            path: "M539.36,175.66l0.16,0.09l1.11,0.2l0.32,-0.15l0.4,-0.71l1.22,-0.99l1.11,1.33l1.26,2.09l0.22,0.14l1.06,0.13l0.28,0.29l-1.46,0.17l-0.26,0.24l-0.43,2.26l-0.39,0.92l-0.85,0.63l-0.12,0.25l0.06,1.2l-0.22,0.05l-1.28,-1.25l0.74,-1.25l-0.03,-0.35l-0.74,-0.86l-0.3,-0.1l-1.05,0.27l-2.49,1.82l-0.04,-1.46l-0.18,-0.27l-1.09,-0.47l-0.8,-0.6l0.53,-0.7l-0.06,-0.42l-1.11,-0.84l0.34,-0.51l-0.11,-0.43l-0.89,-0.48l-0.33,-0.49l0.25,-0.2l1.78,0.81l1.35,0.18l0.25,-0.09l0.34,-0.35l0.02,-0.39l-1.04,-1.36l0.28,-0.18l0.49,0.07l1.65,1.74ZM533.53,180.16l0.63,0.67l0.22,0.09l0.8,-0.0l0.04,0.31l0.66,1.09l-0.94,-0.21l-1.16,-1.24l-0.25,-0.71Z",
            name: "Azerbaijan"
        },
        IE: {
            path: "M405.17,135.35l0.36,2.16l-1.78,2.84l-4.28,1.91l-3.02,-0.43l1.81,-3.13l0.02,-0.26l-1.23,-3.26l3.24,-2.56l1.54,-1.32l0.37,1.33l-0.49,1.77l0.3,0.38l1.49,-0.05l1.68,0.63Z",
            name: "Ireland"
        },
        ID: {
            path: "M756.56,287.86l0.69,4.02l0.15,0.21l2.59,1.5l0.39,-0.07l2.05,-2.61l2.75,-1.45l2.09,-0.0l2.08,0.85l1.85,0.89l2.52,0.46l0.08,15.44l-1.72,-1.6l-0.15,-0.07l-2.54,-0.51l-0.29,0.1l-0.53,0.62l-2.53,0.06l0.78,-1.51l1.48,-0.66l0.17,-0.34l-0.65,-2.74l-1.23,-2.19l-0.14,-0.13l-4.85,-2.13l-2.09,-0.23l-3.7,-2.28l-0.41,0.1l-0.67,1.11l-0.63,0.14l-0.41,-0.67l-0.01,-1.01l-0.14,-0.25l-1.39,-0.89l2.05,-0.69l1.73,0.05l0.29,-0.39l-0.21,-0.66l-0.29,-0.21l-3.5,-0.0l-0.9,-1.36l-0.19,-0.13l-2.14,-0.44l-0.65,-0.76l2.86,-0.51l1.28,-0.79l3.75,0.96l0.32,0.76ZM758.01,300.37l-0.79,1.04l-0.14,-1.07l0.4,-0.81l0.29,-0.47l0.24,0.31l-0.0,1.0ZM747.45,292.9l0.48,1.02l-1.45,-0.69l-2.09,-0.21l-1.45,0.16l-1.28,-0.07l0.35,-0.81l2.86,-0.1l2.58,0.68ZM741.15,285.69l-0.16,-0.25l-0.72,-3.08l0.47,-1.86l0.35,-0.38l0.1,0.73l0.25,0.26l1.28,0.19l0.18,0.78l-0.11,1.8l-0.96,-0.18l-0.35,0.22l-0.38,1.52l0.05,0.24ZM741.19,285.75l0.76,0.97l-0.11,0.05l-0.65,-1.02ZM739.18,293.52l-0.61,0.54l-1.44,-0.38l-0.25,-0.55l1.93,-0.09l0.36,0.48ZM728.4,295.87l-0.27,-0.07l-2.26,0.89l-0.37,-0.41l0.27,-0.8l-0.09,-0.33l-1.68,-1.37l0.17,-2.29l-0.42,-0.3l-1.67,0.76l-0.17,0.29l0.21,2.92l0.09,3.34l-1.22,0.28l-0.78,-0.54l0.65,-2.1l0.01,-0.14l-0.39,-2.42l-0.29,-0.25l-0.86,-0.02l-0.63,-1.4l0.99,-1.61l0.35,-1.97l1.24,-3.73l0.49,-0.96l1.95,-1.7l1.86,0.69l3.16,0.35l2.92,-0.1l0.17,-0.06l2.24,-1.65l0.11,0.14l-1.8,2.22l-1.72,0.44l-2.41,-0.48l-4.21,0.13l-2.19,0.36l-0.25,0.24l-0.36,1.9l0.08,0.27l2.24,2.23l0.4,0.02l1.29,-1.08l3.19,-0.58l-0.19,0.06l-1.04,1.4l-2.13,0.94l-0.12,0.45l2.26,3.06l-0.37,0.69l0.03,0.32l1.51,1.95ZM728.48,295.97l0.59,0.76l-0.02,1.37l-1.0,0.55l-0.64,-0.58l1.09,-1.84l-0.02,-0.26ZM728.64,286.95l0.79,-0.14l-0.07,0.39l-0.72,-0.24ZM732.38,310.1l-1.89,0.49l-0.06,-0.06l0.17,-0.64l1.0,-1.42l2.14,-0.87l0.1,0.2l0.04,0.58l-1.49,1.72ZM728.26,305.71l-0.17,0.63l-3.53,0.67l-3.02,-0.28l-0.0,-0.42l1.66,-0.44l1.47,0.71l0.16,0.03l1.75,-0.21l1.69,-0.69ZM722.98,310.33l-0.74,0.03l-2.52,-1.35l1.42,-0.3l1.19,0.7l0.72,0.63l-0.06,0.28ZM716.24,305.63l0.66,0.49l0.22,0.06l1.35,-0.18l0.31,0.53l-4.18,0.77l-0.8,-0.01l0.51,-0.86l1.2,-0.02l0.24,-0.12l0.49,-0.65ZM715.84,280.21l0.09,0.34l2.25,1.86l-2.25,0.22l-0.24,0.17l-0.84,1.71l-0.03,0.15l0.1,2.11l-2.27,1.62l-0.13,0.24l-0.06,2.46l-0.74,2.92l-0.02,-0.05l-0.39,-0.16l-2.62,1.04l-0.86,-1.33l-0.23,-0.14l-1.71,-0.14l-1.19,-0.76l-0.25,-0.03l-2.78,0.84l-0.79,-1.05l-0.26,-0.12l-1.61,0.13l-1.8,-0.25l-0.36,-3.13l-0.15,-0.23l-1.18,-0.65l-1.13,-2.02l-0.33,-2.1l0.27,-2.19l1.05,-1.17l0.28,1.12l0.1,0.16l1.71,1.41l0.28,0.05l1.55,-0.49l1.54,0.17l0.23,-0.07l1.4,-1.21l1.05,-0.19l2.3,0.68l0.16,0.0l2.04,-0.53l0.21,-0.19l1.26,-3.41l0.91,-0.82l0.09,-0.14l0.8,-2.64l2.63,0.0l1.71,0.33l-1.19,1.89l0.02,0.34l1.74,2.24l-0.37,1.0ZM692.67,302.0l0.26,0.19l4.8,0.25l0.28,-0.16l0.44,-0.83l4.29,1.12l0.85,1.52l0.23,0.15l3.71,0.45l2.37,1.15l-2.06,0.69l-2.77,-1.0l-2.25,0.07l-2.57,-0.18l-2.31,-0.45l-2.94,-0.97l-1.84,-0.25l-0.13,0.01l-0.97,0.29l-4.34,-0.98l-0.38,-0.94l-0.25,-0.19l-1.76,-0.14l1.31,-1.84l2.81,0.14l1.97,0.96l0.95,0.19l0.28,0.74ZM685.63,299.27l-2.36,0.04l-2.07,-2.05l-3.17,-2.02l-1.06,-1.5l-1.88,-2.02l-1.22,-1.85l-1.9,-3.49l-2.2,-2.11l-0.71,-2.08l-0.94,-1.99l-0.1,-0.12l-2.21,-1.54l-1.35,-2.17l-1.86,-1.39l-2.53,-2.68l-0.14,-0.81l1.22,0.08l3.76,0.47l2.16,2.4l1.94,1.7l1.37,1.04l2.35,2.67l0.22,0.1l2.44,0.04l1.99,1.62l1.42,2.06l0.09,0.09l1.67,1.0l-0.88,1.8l0.11,0.39l1.44,0.87l0.13,0.04l0.68,0.05l0.41,1.62l0.87,1.4l0.22,0.14l1.71,0.21l1.06,1.38l-0.61,3.04l-0.09,3.6Z",
            name: "Indonesia"
        },
        UA: {
            path: "M500.54,141.42l0.9,0.13l0.27,-0.11l0.52,-0.62l0.68,0.13l2.43,-0.3l1.32,1.57l-0.45,0.48l-0.07,0.26l0.21,1.03l0.27,0.24l1.85,0.15l0.76,1.22l-0.05,0.55l0.2,0.31l3.18,1.15l0.18,0.01l1.75,-0.47l1.42,1.41l0.22,0.09l1.42,-0.03l3.44,0.99l0.02,0.65l-0.97,1.62l-0.03,0.24l0.52,1.67l-0.29,0.79l-2.24,0.22l-0.14,0.05l-1.29,0.89l-0.13,0.23l-0.07,1.16l-1.75,0.22l-0.12,0.04l-1.6,0.98l-2.27,0.16l-0.12,0.04l-2.16,1.17l-0.16,0.29l0.15,1.94l0.14,0.23l1.23,0.75l0.18,0.04l2.06,-0.15l-0.22,0.51l-2.67,0.54l-3.27,1.72l-1.0,-0.45l0.45,-1.19l-0.19,-0.39l-2.34,-0.78l0.15,-0.2l2.32,-1.0l0.09,-0.49l-0.73,-0.72l-0.15,-0.08l-3.69,-0.75l-0.14,-0.96l-0.35,-0.25l-2.32,0.39l-0.21,0.15l-0.91,1.7l-1.77,2.1l-0.93,-0.44l-0.24,-0.0l-1.05,0.45l-0.48,-0.25l0.13,-0.07l0.14,-0.15l0.43,-1.04l0.67,-0.97l0.04,-0.26l-0.1,-0.31l0.04,-0.02l0.11,0.19l0.24,0.15l1.48,0.09l0.78,-0.25l0.07,-0.53l-0.27,-0.19l0.09,-0.25l-0.08,-0.33l-0.81,-0.74l-0.34,-1.24l-0.14,-0.18l-0.73,-0.42l0.15,-0.87l-0.11,-0.29l-1.13,-0.86l-0.15,-0.06l-0.97,-0.11l-1.79,-0.97l-0.2,-0.03l-1.66,0.32l-0.13,0.06l-0.52,0.41l-0.95,-0.0l-0.23,0.11l-0.56,0.66l-1.74,0.29l-0.79,0.43l-1.01,-0.68l-0.16,-0.05l-1.57,-0.01l-1.52,-0.35l-0.23,0.04l-0.71,0.45l-0.09,-0.43l-0.13,-0.19l-1.18,-0.74l0.38,-1.02l0.53,-0.64l0.35,0.12l0.37,-0.41l-0.57,-1.29l2.1,-2.5l1.16,-0.36l0.2,-0.2l0.27,-0.92l-0.01,-0.2l-1.1,-2.52l0.79,-0.09l0.13,-0.05l1.3,-0.86l1.83,-0.07l2.48,0.26l2.84,0.8l1.91,0.06l0.88,0.45l0.29,-0.01l0.72,-0.44l0.49,0.58l0.25,0.11l2.2,-0.16l0.94,0.3l0.39,-0.26l0.15,-1.57l0.61,-0.59l2.01,-0.19Z",
            name: "Ukraine"
        },
        QA: {
            path: "M548.47,221.47l-0.15,-1.72l0.59,-1.23l0.38,-0.16l0.54,0.6l0.04,1.4l-0.47,1.37l-0.41,0.11l-0.53,-0.37Z",
            name: "Qatar"
        },
        MZ: {
            path: "M507.71,314.14l1.65,-0.18l2.96,0.7l0.2,-0.02l0.6,-0.29l1.68,-0.06l0.18,-0.07l0.8,-0.69l1.5,0.02l2.74,-0.98l1.74,-1.27l0.25,0.7l-0.1,2.47l0.31,2.27l0.1,3.97l0.42,1.24l-0.7,1.71l-0.94,1.73l-1.52,1.52l-5.06,2.21l-2.88,2.8l-1.01,0.51l-1.72,1.81l-0.99,0.58l-0.15,0.23l-0.21,1.86l0.04,0.19l1.17,1.95l0.47,1.47l0.03,0.74l0.39,0.28l0.05,-0.01l-0.06,2.13l-0.39,1.19l0.1,0.33l0.42,0.32l-0.28,0.83l-0.95,0.86l-2.03,0.88l-3.08,1.49l-1.1,0.99l-0.09,0.28l0.21,1.13l0.21,0.23l0.38,0.11l-0.14,0.89l-1.39,-0.02l-0.17,-0.94l-0.38,-1.23l-0.2,-0.89l0.44,-2.91l-0.01,-0.14l-0.65,-1.88l-1.15,-3.55l2.52,-2.85l0.68,-1.89l0.29,-0.18l0.14,-0.2l0.28,-1.53l-0.03,-0.19l-0.36,-0.7l0.1,-1.83l0.49,-1.84l-0.01,-3.26l-0.14,-0.25l-1.3,-0.83l-0.11,-0.04l-1.08,-0.17l-0.47,-0.55l-0.1,-0.08l-1.16,-0.54l-0.13,-0.03l-1.83,0.04l-0.32,-2.25l7.19,-1.99l1.32,1.12l0.29,0.06l0.55,-0.19l0.75,0.49l0.11,0.81l-0.49,1.11l-0.02,0.15l0.19,1.81l0.09,0.18l1.63,1.59l0.48,-0.1l0.72,-1.68l0.99,-0.49l0.17,-0.29l-0.21,-3.29l-0.04,-0.13l-1.11,-1.92l-0.9,-0.82l-0.21,-0.08l-0.62,0.03l-0.63,-2.98l0.61,-1.67Z",
            name: "Mozambique"
        }
    },
    height: 440.7063107441331,
    projection: {
        type: "mill",
        centralMeridian: 11.5
    },
    width: 900
}), $.fn.vectorMap("addMap", "us_aea_en", {
    insets: [ {
        width: 220,
        top: 440,
        height: 146.9158157558812,
        bbox: [ {
            y: -8441281.712315228,
            x: -5263934.893342895
        }, {
            y: -6227992.545028123,
            x: -1949631.2950683108
        } ],
        left: 0
    }, {
        width: 80,
        top: 460,
        height: 129.05725678001465,
        bbox: [ {
            y: -4207380.690946597,
            x: -5958501.652314129
        }, {
            y: -3658201.4570359783,
            x: -5618076.48127754
        } ],
        left: 245
    }, {
        width: 900,
        top: 0,
        height: 550.2150229714246,
        bbox: [ {
            y: -5490839.2352678,
            x: -2029243.6460439637
        }, {
            y: -2690044.485299302,
            x: 2552083.9617675776
        } ],
        left: 0
    } ],
    paths: {
        "US-VA": {
            path: "M682.42,290.04l1.61,-0.93l1.65,-0.48l1.12,-0.95l3.57,-1.69l0.74,-2.33l0.82,-0.19l2.32,-1.54l0.05,-1.81l2.04,-1.86l-0.13,-1.58l0.26,-0.42l5.0,-4.09l4.76,-6.0l0.09,0.63l0.96,0.54l0.33,1.37l1.32,0.74l0.71,0.81l1.46,0.09l0.79,0.65l1.3,0.48l1.41,-0.09l0.79,-0.41l0.76,-1.22l1.17,-0.57l0.53,-1.38l2.72,1.49l1.42,-1.1l2.25,-0.99l0.76,0.06l1.08,-0.97l0.33,-0.82l-0.48,-0.96l0.23,-0.42l1.9,0.58l3.26,-2.62l0.3,-0.1l0.51,0.73l0.66,-0.07l2.38,-2.34l0.17,-0.85l-0.49,-0.51l0.99,-1.12l0.1,-0.6l-0.28,-0.51l-1.0,-0.46l0.71,-3.03l2.6,-4.8l0.55,-2.15l-0.01,-1.91l1.61,-2.55l-0.22,-0.94l0.24,-0.84l0.5,-0.48l0.39,-1.7l-0.0,-3.18l1.23,0.19l1.18,1.73l3.8,0.43l0.59,-0.28l1.05,-2.52l0.2,-2.36l0.71,-1.05l-0.04,-1.61l0.76,-2.31l1.78,0.75l0.65,-0.17l1.3,-3.3l0.57,0.05l0.59,-0.39l0.52,-1.2l0.81,-0.68l0.44,-1.8l1.38,-2.43l-0.35,-2.57l0.54,-1.76l-0.3,-2.01l9.18,4.58l0.59,-0.29l0.63,-4.0l2.6,-0.07l0.63,0.57l1.05,0.23l-0.5,1.74l0.6,0.88l1.61,0.85l2.52,-0.04l1.03,1.18l1.64,0.12l1.94,1.52l0.57,2.53l-0.94,0.78l-0.45,0.02l-0.3,0.43l0.13,0.71l-0.61,-0.05l-0.49,0.59l-0.37,2.5l0.07,2.29l-0.43,0.25l0.01,0.6l1.05,0.77l-0.36,0.14l-0.17,0.6l0.44,0.3l1.64,-0.08l1.38,-0.61l1.77,-1.61l0.39,0.58l-0.58,0.35l0.02,0.58l1.9,1.07l0.64,1.08l1.69,0.35l1.37,-0.11l0.95,0.49l0.82,-0.65l1.05,-0.08l0.33,0.56l1.26,0.63l-0.1,0.55l0.36,0.55l0.94,-0.23l0.41,0.56l3.96,0.88l0.25,1.12l-0.85,-0.41l-0.57,0.44l0.89,1.74l-0.35,0.57l0.62,0.78l-0.44,0.89l0.24,0.59l-1.36,-0.36l-0.59,-0.72l-0.67,0.18l-0.1,0.43l-2.44,-2.3l-0.56,0.05l-0.38,-0.56l-0.52,0.32l-1.36,-1.51l-1.23,-0.43l-2.86,-2.72l-1.34,-0.12l-1.11,-0.81l-1.17,0.05l-0.39,0.52l0.47,0.71l1.1,-0.01l0.63,0.68l1.33,0.07l0.6,0.43l0.62,1.4l1.46,1.11l1.13,0.34l1.53,1.8l2.55,0.94l1.4,1.89l2.14,-0.02l0.56,0.41l0.72,0.06l-0.61,0.7l0.3,0.49l2.03,0.34l0.26,0.72l0.55,0.1l0.13,1.67l-1.0,-0.75l-0.39,0.21l-1.13,-1.0l-0.58,0.29l0.1,0.82l-0.31,0.68l0.7,0.7l-0.18,0.6l1.12,0.32l-0.86,0.44l-2.12,-0.73l-1.39,-1.38l-0.83,-0.32l-2.23,-1.87l-0.58,0.11l-0.22,0.53l0.26,0.81l0.64,0.21l3.81,3.15l2.69,1.12l1.28,-0.33l0.45,1.07l1.27,0.26l-0.44,0.67l0.3,0.56l0.93,-0.19l0.0,1.24l-0.92,0.41l-0.57,0.73l-0.71,-0.93l-3.2,-1.58l-0.29,-1.16l-0.59,-0.59l-0.87,-0.11l-1.2,0.67l-1.71,-0.44l-0.36,-1.15l-0.71,-0.05l-0.05,1.32l-0.33,0.41l-1.43,-1.32l-0.51,0.09l-0.48,0.57l-0.65,-0.4l-0.99,0.45l-2.23,-0.1l-0.37,0.94l0.34,0.46l1.9,0.22l1.4,-0.31l0.85,0.24l0.56,-0.69l0.63,0.88l1.34,0.43l1.95,-0.31l1.5,0.71l0.67,-0.63l0.94,2.47l3.16,1.23l0.37,0.91l-0.57,1.03l0.56,0.44l1.72,-1.32l0.88,-0.02l0.83,0.65l0.8,-0.26l-0.61,-0.9l-0.2,-1.17l3.78,0.08l1.13,-0.44l1.89,3.23l-0.46,0.71l0.65,3.09l-1.19,-0.58l-0.02,0.88l-30.95,7.83l-37.19,8.41l-19.52,3.35l-7.08,0.85l-0.46,-0.26l-4.24,0.64l-0.82,0.62l-28.2,5.01ZM781.15,223.32l0.14,0.09l-0.06,0.07l-0.01,-0.03l-0.07,-0.12ZM808.05,244.59l0.53,-1.14l-0.26,-0.54l-0.36,-0.08l0.58,-0.98l-0.39,-0.71l-0.03,-0.49l0.44,-0.35l-0.17,-0.73l0.62,-0.3l0.23,-0.6l0.14,-2.33l1.01,-0.39l-0.12,-0.9l0.48,-0.14l-0.26,-1.53l-0.79,-0.4l0.87,-0.57l0.1,-1.03l2.69,-1.11l0.36,2.48l-1.08,4.2l-0.22,2.38l0.33,1.09l-0.34,0.97l-0.6,-0.79l-0.81,0.15l-0.39,0.95l0.27,0.37l-0.65,0.46l-0.3,0.85l0.17,1.05l-0.31,1.46l0.38,2.47l-0.6,0.6l0.07,1.33l-1.37,-1.9l0.23,-0.94l-0.33,-1.57l0.28,-0.97l-0.38,-0.3Z",
            name: "Virginia"
        },
        "US-PA": {
            path: "M716.46,159.99l0.63,-0.19l4.3,-3.73l1.13,5.2l0.48,0.31l34.84,-7.93l34.28,-8.64l1.42,0.58l0.71,1.39l0.64,0.13l0.77,-0.33l1.24,0.59l0.14,0.85l0.81,0.41l-0.16,0.58l0.89,2.69l1.9,2.07l2.12,0.75l2.21,-0.2l0.72,0.79l-0.89,0.87l-0.73,1.49l-0.17,2.25l-1.41,3.35l-1.37,1.58l0.04,0.79l1.79,1.72l-0.31,1.65l-0.84,0.43l-0.22,0.66l0.14,1.48l1.04,2.87l0.52,0.25l1.2,-0.18l1.18,2.39l0.95,0.58l0.66,-0.26l0.6,0.9l4.23,2.75l0.12,0.41l-1.29,0.93l-3.71,4.22l-0.23,0.76l0.17,0.9l-1.36,1.13l-0.84,0.15l-1.33,1.08l-0.33,0.66l-1.72,-0.12l-2.03,0.84l-1.15,1.37l-0.41,1.39l-37.23,9.21l-39.1,8.66l-10.03,-48.21l1.92,-1.22l3.08,-3.04Z",
            name: "Pennsylvania"
        },
        "US-TN": {
            path: "M571.72,341.09l0.86,-0.84l0.29,-1.37l1.0,0.04l0.65,-0.79l-0.99,-4.89l1.41,-1.93l0.06,-1.32l1.18,-0.46l0.36,-0.48l-0.63,-1.31l0.53,-0.65l0.05,-0.56l-0.89,-1.33l2.55,-1.57l1.09,-1.13l-0.14,-0.84l-0.85,-0.53l0.14,-0.19l0.34,-0.16l0.85,0.37l0.46,-0.33l-0.27,-1.31l-0.85,-0.9l0.06,-0.71l0.51,-1.43l1.0,-1.11l-1.35,-2.06l1.37,-0.21l0.61,-0.55l-0.13,-0.64l-1.17,-0.82l0.82,-0.15l0.58,-0.54l0.13,-0.69l-0.59,-1.38l0.02,-0.36l0.37,0.53l0.47,0.08l0.58,-0.29l0.6,-0.86l23.67,-2.81l0.35,-0.41l-0.1,-1.35l-0.84,-2.39l2.98,-0.08l0.82,0.58l22.79,-3.55l7.64,-0.46l7.5,-0.86l8.82,-1.42l24.01,-3.1l1.11,-0.6l29.3,-5.2l0.73,-0.6l3.56,-0.54l-0.4,1.44l0.43,0.85l-0.4,2.0l0.36,0.82l-1.15,-0.03l-1.71,1.79l-1.21,3.89l-0.55,0.7l-0.56,0.08l-0.63,-0.74l-1.44,-0.02l-2.66,1.73l-1.42,2.73l-0.96,0.89l-0.34,-0.34l-0.13,-1.05l-0.73,-0.54l-0.53,0.15l-2.3,1.81l-0.29,1.32l-0.93,-0.24l-0.9,0.48l-0.16,0.77l0.32,0.73l-0.85,2.18l-1.29,0.06l-1.75,1.14l-1.28,1.24l-0.61,1.06l-0.78,0.27l-2.28,2.46l-4.04,0.78l-2.58,1.7l-0.49,1.09l-0.88,0.55l-0.55,0.81l-0.18,2.88l-0.35,0.6l-1.65,0.52l-0.89,-0.16l-1.06,1.14l0.21,5.24l-20.21,3.32l-21.62,3.04l-25.56,2.95l-0.34,0.31l-7.39,0.9l-28.73,3.17Z",
            name: "Tennessee"
        },
        "US-ID": {
            path: "M132.38,121.39l-0.34,-0.44l0.08,-1.99l0.53,-1.74l1.42,-1.22l2.11,-3.59l1.68,-0.92l1.39,-1.53l1.08,-2.15l0.05,-1.22l2.21,-2.41l1.43,-2.7l0.37,-1.37l2.04,-2.26l1.89,-2.81l0.03,-1.01l-0.79,-2.95l-2.13,-1.94l-0.87,-0.36l-0.85,-1.61l-0.41,-3.02l-0.59,-1.19l0.94,-1.19l-0.12,-2.35l-1.04,-2.69l0.46,-0.98l9.67,-54.45l13.39,2.35l-3.54,20.72l1.29,2.89l1.0,1.27l0.27,1.55l1.17,1.76l-0.12,0.83l0.39,1.14l-0.99,0.95l0.83,1.76l-0.83,0.11l-0.28,0.71l1.93,1.68l1.03,2.04l2.24,1.22l0.54,1.58l1.09,1.33l1.49,2.79l0.08,0.68l1.64,1.81l0.01,1.88l1.79,1.71l-0.07,1.35l0.74,0.19l0.9,-0.58l0.36,0.46l-0.36,0.55l0.07,0.54l1.11,0.96l1.61,0.15l1.81,-0.36l-0.63,2.61l-0.99,0.54l0.25,1.14l-1.83,3.73l0.06,1.72l-0.81,0.07l-0.37,0.54l0.6,1.33l-0.62,0.9l-0.03,1.16l0.97,0.93l-0.37,0.81l0.28,1.01l-1.57,0.43l-1.21,1.41l0.1,1.11l0.46,0.77l-0.13,0.74l-0.83,0.77l-0.2,1.52l1.48,0.63l1.38,1.79l0.78,0.27l1.08,-0.35l0.56,-0.8l1.85,-0.41l1.21,-1.28l0.81,-0.29l0.15,-0.76l0.78,0.81l0.23,0.71l1.06,0.64l-0.42,1.23l0.73,0.95l-0.34,1.38l0.57,1.34l-0.21,1.61l1.54,2.64l0.31,1.73l0.82,0.37l0.67,2.08l-0.18,0.98l-0.76,0.64l0.51,1.9l1.24,1.16l0.3,0.79l0.81,0.08l0.86,-0.37l1.04,0.93l1.06,2.79l-0.5,0.81l0.89,1.83l-0.28,0.6l0.11,0.98l2.29,2.41l0.97,-0.14l-0.01,-1.14l1.07,-0.89l0.93,-0.22l4.53,1.62l0.69,-0.32l0.67,-1.35l1.19,-0.39l2.25,0.93l3.3,-0.1l0.96,0.88l2.29,-0.58l3.23,0.78l0.45,-0.49l-0.67,-0.76l0.26,-1.06l0.74,-0.48l-0.07,-0.96l1.23,-0.51l0.48,0.37l1.07,2.11l0.12,1.11l1.36,1.95l0.73,0.45l-6.27,53.86l-47.48,-6.32l-46.97,-7.73l6.88,-39.17l1.12,-1.18l1.07,-2.67l-0.21,-1.75l0.74,-0.15l0.77,-1.62l-0.9,-1.27l-0.18,-1.2l-1.24,-0.08l-0.64,-0.81l-0.88,0.29Z",
            name: "Idaho"
        },
        "US-NV": {
            path: "M139.36,329.2l-12.7,-16.93l-36.59,-51.1l-25.35,-34.52l13.7,-64.19l46.89,9.24l46.99,7.74l-18.72,125.83l-0.9,1.16l-0.99,2.19l-0.44,0.17l-1.34,-0.22l-0.98,-2.24l-0.7,-0.63l-1.41,0.22l-1.95,-1.02l-1.6,0.23l-1.78,0.96l-0.76,2.48l0.88,2.59l-0.6,0.97l-0.24,1.31l0.38,3.12l-0.76,2.54l0.77,3.71l-0.13,3.07l-0.3,1.07l-1.04,0.31l-0.12,0.51l0.32,0.8l-0.52,0.62Z",
            name: "Nevada"
        },
        "US-TX": {
            path: "M276.16,412.59l33.07,1.99l32.79,1.35l0.41,-0.39l3.6,-98.71l25.86,0.61l26.29,0.22l0.05,42.09l0.44,0.4l1.02,-0.13l0.78,0.28l3.74,3.82l1.66,0.21l0.88,-0.58l2.49,0.64l0.6,-0.68l0.11,-1.05l0.6,0.76l0.92,0.22l0.38,0.93l0.77,0.78l-0.01,1.64l0.52,0.83l2.85,0.42l1.25,-0.2l1.38,0.89l2.78,0.69l1.82,-0.56l0.63,0.1l1.89,1.8l1.4,-0.11l1.25,-1.43l2.43,0.26l1.67,-0.46l0.1,2.28l0.91,0.67l1.62,0.4l-0.04,2.09l1.56,0.79l1.82,-0.66l1.57,-1.68l1.02,-0.65l0.41,0.19l0.45,1.64l2.01,0.2l0.24,1.05l0.72,0.48l1.47,-0.21l0.88,-0.93l0.39,0.33l0.59,-0.08l0.61,-0.99l0.26,0.41l-0.45,1.23l0.14,0.76l0.67,1.14l0.78,0.42l0.57,-0.04l0.6,-0.5l0.68,-2.36l0.91,-0.65l0.35,-1.54l0.57,-0.14l0.4,0.14l0.29,0.99l0.57,0.64l1.21,0.02l0.83,0.5l1.26,-0.2l0.68,-1.34l0.48,0.15l-0.13,0.7l0.49,0.69l1.21,0.45l0.49,0.72l1.52,-0.05l1.49,1.74l0.52,0.02l0.63,-0.62l0.08,-0.71l1.49,-0.1l0.93,-1.43l1.88,-0.41l1.66,-1.13l1.52,0.83l1.51,-0.22l0.29,-0.83l2.29,-0.73l0.53,-0.55l0.5,0.32l0.38,0.88l1.82,0.42l1.69,-0.06l1.86,-1.14l0.41,-1.05l1.06,0.31l2.24,1.56l1.16,0.17l1.79,2.08l2.14,0.41l1.04,0.92l0.76,-0.11l2.48,0.85l1.04,0.04l0.37,0.79l1.38,0.97l1.45,-0.12l0.39,-0.72l0.8,0.36l0.88,-0.4l0.92,0.35l0.76,-0.15l0.64,0.36l2.23,34.03l1.51,1.67l1.3,0.82l1.25,1.87l0.57,1.63l-0.1,2.64l1.0,1.21l0.85,0.4l-0.12,0.85l0.75,0.54l0.28,0.87l0.65,0.7l-0.19,1.17l1.0,1.02l0.59,1.63l0.5,0.34l0.55,-0.1l-0.16,1.71l0.81,1.22l-0.64,0.25l-0.35,0.68l0.77,1.27l-0.55,0.89l0.19,1.39l-0.75,2.69l-0.74,0.85l-0.36,1.54l-0.79,1.13l0.64,2.0l-0.83,2.28l0.17,1.07l0.83,1.2l-0.19,1.01l0.49,1.6l-0.24,1.41l-1.13,1.67l-1.02,0.2l-1.76,3.37l-0.04,1.06l1.79,2.37l-3.43,0.08l-7.37,3.78l-0.02,-0.43l-2.19,-0.46l-3.24,1.07l1.09,-3.51l-0.3,-1.21l-0.8,-0.76l-0.62,-0.07l-1.52,0.85l-0.99,2.0l-1.56,-0.96l-1.64,0.12l-0.07,0.63l0.89,0.62l0.0,1.06l0.56,0.39l-0.47,0.69l0.07,1.02l1.63,0.64l-0.62,0.71l0.49,0.97l0.91,0.23l0.28,0.37l-0.4,1.25l-0.45,-0.12l-0.97,0.81l-1.72,2.25l-1.18,-0.4l-0.49,0.12l0.32,1.0l0.08,2.55l-1.85,1.49l-1.91,2.11l-0.96,0.37l-4.1,2.9l-3.3,0.45l-2.54,1.06l-0.2,1.12l-0.75,-0.34l-2.04,0.89l-0.33,-0.34l-1.11,0.18l0.43,-0.87l-0.52,-0.6l-1.43,0.22l-1.22,1.08l-0.6,-0.62l-0.11,-1.2l-1.38,-0.81l-0.5,0.44l0.65,1.44l0.01,1.12l-0.71,0.09l-0.54,-0.44l-0.75,-0.0l-0.55,-1.34l-1.46,-0.37l-0.58,0.39l0.04,0.54l0.94,1.7l0.03,1.24l0.58,0.37l0.36,-0.16l1.13,0.78l-0.75,0.37l-0.27,0.54l0.15,0.36l0.7,0.23l1.08,-0.54l0.96,0.6l-4.27,2.42l-0.57,-0.13l-0.37,-1.44l-0.5,-0.18l-1.13,-1.46l-0.49,-0.03l-0.48,0.51l0.1,0.63l-0.62,0.34l-0.05,0.51l1.18,1.61l-0.31,1.04l0.33,0.85l-1.66,1.79l-0.37,0.2l0.37,-0.64l-0.18,-0.72l0.25,-0.73l-0.46,-0.67l-0.52,0.17l-0.71,1.1l0.26,0.72l-0.39,0.95l-0.07,-1.13l-0.52,-0.55l-1.95,1.29l-0.78,-0.33l-0.7,0.52l0.07,0.75l-0.81,0.99l0.02,0.49l1.25,0.64l0.03,0.56l0.78,0.28l0.7,-1.41l0.86,-0.41l0.01,0.62l-2.82,4.36l-1.23,-1.0l-1.36,0.38l-0.32,-0.34l-2.4,0.39l-0.46,-0.31l-0.65,0.16l-0.18,0.58l0.41,0.61l0.55,0.38l1.53,0.03l-0.01,0.91l0.55,0.64l2.07,1.03l-2.7,7.63l-0.2,0.1l-0.38,-0.54l-0.34,0.1l0.18,-0.76l-0.57,-0.43l-2.35,1.95l-1.72,-2.36l-1.19,-0.91l-0.61,0.4l0.09,0.52l1.44,2.0l-0.11,0.82l-0.93,-0.09l-0.33,0.63l0.51,0.56l1.88,0.07l2.14,0.72l2.08,-0.72l-0.43,1.75l0.24,0.77l-0.98,0.7l0.37,1.59l-1.12,0.14l-0.43,0.41l0.4,2.11l-0.33,1.6l0.45,0.64l0.84,0.24l0.87,2.86l0.71,2.81l-0.91,0.82l0.62,0.49l-0.08,1.28l0.72,0.3l0.18,0.61l0.58,0.29l0.4,1.79l0.68,0.31l0.45,3.22l1.46,0.62l-0.52,1.1l0.31,1.07l-0.63,0.77l-0.84,-0.05l-0.53,0.44l0.08,1.31l-0.49,-0.33l-0.49,0.25l-0.39,-0.67l-1.49,-0.45l-2.92,-2.53l-2.2,-0.18l-0.81,-0.51l-4.2,0.09l-0.9,0.42l-0.78,-0.63l-1.06,0.25l-1.25,-0.2l-1.45,-0.7l-0.72,-0.97l-0.6,-0.14l-0.21,-0.72l-1.17,-0.49l-0.99,-0.02l-1.98,-0.87l-1.45,0.39l-0.83,-1.09l-0.6,-0.21l-1.43,-1.38l-1.96,0.01l-1.47,-0.64l-0.86,0.12l-1.62,-0.41l0.28,-1.26l-0.54,-1.01l-0.96,-0.35l-1.65,-6.03l-2.77,-3.02l-0.29,-1.12l-1.08,-0.75l0.35,-0.77l-0.24,-0.76l0.34,-2.18l-0.45,-0.96l-1.04,-1.01l0.65,-1.99l0.05,-1.19l-0.18,-0.7l-0.54,-0.33l-0.15,-1.81l-1.85,-1.44l-0.85,0.21l-0.29,-0.41l-0.81,-0.11l-0.74,-1.31l-2.22,-1.71l0.01,-0.69l-0.51,-0.58l0.12,-0.86l-0.97,-0.92l-0.08,-0.75l-1.12,-0.61l-1.3,-2.88l-2.66,-1.48l-0.38,-0.91l-1.13,-0.59l-0.06,-1.16l-0.82,-1.19l-0.59,-1.95l0.41,-0.22l-0.04,-0.73l-1.03,-0.49l-0.26,-1.29l-0.81,-0.57l-0.94,-1.74l-0.61,-2.38l-1.85,-2.36l-0.87,-4.24l-1.81,-1.34l0.05,-0.7l-0.75,-1.21l-3.96,-2.67l-0.71,-1.86l-1.82,-0.62l-1.44,-0.99l-0.01,-1.63l-0.6,-0.39l-0.88,0.24l-0.12,-0.77l-0.98,-0.33l-0.8,-2.08l-0.57,-0.47l-0.46,0.12l-0.46,-0.44l-0.86,0.27l-0.14,-0.6l-0.44,-0.31l-0.47,0.15l-0.25,0.61l-1.05,0.16l-2.89,-0.47l-0.39,-0.38l-1.48,-0.03l-0.79,0.29l-0.77,-0.44l-2.67,0.27l-3.92,-2.08l-1.35,0.86l-0.64,1.61l-1.98,-0.17l-0.52,0.44l-0.49,-0.17l-1.05,0.49l-1.33,0.14l-3.22,6.4l-0.18,1.77l-0.76,0.67l-0.38,1.8l0.35,0.59l-1.99,1.01l-0.72,1.3l-1.11,0.65l-1.12,2.0l-2.67,-0.46l-1.04,-0.87l-0.55,0.3l-1.69,-1.21l-1.31,-1.63l-2.9,-0.85l-1.15,-0.95l-0.02,-0.67l-0.42,-0.41l-2.75,-0.51l-2.28,-1.03l-1.89,-1.75l-0.91,-1.53l-0.96,-0.91l-1.53,-0.29l-1.77,-1.26l-0.22,-0.56l-1.31,-1.18l-0.65,-2.68l-0.86,-1.01l-0.24,-1.1l-0.76,-1.28l-0.26,-2.34l0.52,-3.05l-3.01,-5.07l-0.06,-1.94l-1.26,-2.51l-0.99,-0.44l-0.43,-1.24l-1.43,-0.81l-2.15,-2.18l-1.02,-0.1l-2.01,-1.25l-3.18,-3.35l-0.59,-1.55l-3.13,-2.55l-1.59,-2.45l-1.19,-0.95l-0.61,-1.05l-4.42,-2.6l-1.19,-2.19l-1.21,-3.23l-1.37,-1.08l-1.12,-0.08l-1.75,-1.67l-0.79,-3.05ZM502.09,468.18l-0.33,0.17l0.18,-0.16l0.15,-0.02ZM498.69,470.85l-0.09,0.12l-0.04,0.02l0.13,-0.14ZM497.79,472.33l0.15,0.05l-0.2,0.18l0.04,-0.11l0.01,-0.12ZM497.02,473.23l-0.13,0.12l0.03,-0.09l0.09,-0.03ZM467.54,489.19l0.03,0.02l-0.02,0.01l-0.0,-0.03ZM453.94,547.19l0.75,-0.5l0.25,-0.68l0.11,1.08l-1.1,0.1ZM460.89,499.8l-0.14,-0.59l1.22,-0.36l-0.28,0.33l-0.79,0.63ZM463.51,497.84l0.1,-0.23l1.27,-0.88l-0.92,0.85l-0.45,0.26ZM465.8,496.12l0.28,-0.24l0.47,-0.04l-0.25,0.13l-0.5,0.15ZM457.96,502.92l0.71,-1.64l0.64,-0.71l-0.02,0.75l-1.33,1.6ZM451.06,515.13l0.06,-0.22l0.07,-0.15l-0.13,0.37ZM451.5,513.91l0.16,-0.35l0.02,-0.02l-0.18,0.37ZM452.44,511.95l-0.01,-0.04l0.05,-0.04l-0.04,0.08Z",
            name: "Texas"
        },
        "US-NH": {
            path: "M829.94,105.42l0.2,-1.33l-1.43,-5.38l0.53,-1.45l-0.28,-2.22l1.0,-1.86l-0.13,-2.3l0.64,-2.28l-0.44,-0.62l0.29,-2.31l-0.93,-3.8l0.08,-0.7l0.3,-0.45l1.83,-0.8l0.7,-1.39l1.43,-1.62l0.74,-1.8l-0.25,-1.13l0.52,-0.62l-2.34,-3.49l0.87,-3.26l-0.11,-0.78l-0.81,-1.29l0.27,-0.59l-0.23,-0.7l0.48,-3.2l-0.36,-0.82l0.91,-1.49l2.44,0.33l0.65,-0.88l13.0,34.89l0.84,3.65l2.6,2.21l0.88,0.34l0.36,1.6l1.72,1.31l0.0,0.35l0.77,0.23l-0.06,0.58l-0.46,3.09l-1.57,0.24l-1.32,1.19l-0.51,0.94l-0.96,0.37l-0.5,1.68l-1.1,1.44l-17.61,4.74l-1.7,-1.43l-0.41,-0.89l-0.1,-2.0l0.54,-0.59l0.03,-0.52l-1.02,-5.18Z",
            name: "New Hampshire"
        },
        "US-NY": {
            path: "M821.38,166.44l0.69,-2.05l0.62,-0.02l0.55,-0.75l0.76,0.15l0.54,-0.41l-0.04,-0.31l0.57,-0.03l0.28,-0.66l0.66,-0.02l0.2,-0.55l-0.42,-0.83l0.22,-0.53l0.61,-0.37l1.34,0.22l0.54,-0.59l1.45,-0.18l0.21,-0.8l1.85,0.02l1.08,-0.91l0.11,-0.78l0.62,0.24l0.43,-0.61l4.83,-1.29l2.26,-1.3l1.99,-2.91l-0.2,1.16l-0.98,0.86l-1.22,2.31l0.55,0.46l1.6,-0.35l0.28,0.63l-0.43,0.49l-1.37,0.87l-0.51,-0.07l-2.26,0.92l-0.08,0.93l-0.87,-0.0l-2.73,1.72l-1.01,0.15l-0.17,0.8l-1.24,0.09l-2.24,1.91l-4.44,2.17l-0.2,0.71l-0.29,0.08l-0.45,-0.83l-1.41,-0.06l-0.73,0.42l-0.42,0.8l0.23,0.32l-0.92,0.69l-0.76,-0.84l0.32,-1.05ZM828.05,159.06l-0.02,-0.01l0.02,-0.06l-0.01,0.08ZM845.16,149.05l0.06,-0.06l0.18,-0.06l-0.11,0.19l-0.13,-0.07ZM844.3,154.94l0.1,-0.89l0.74,-1.16l1.65,-1.52l1.01,0.31l0.05,-0.82l0.79,0.67l-3.36,3.21l-0.67,0.45l-0.31,-0.25ZM850.39,150.14l0.02,-0.03l0.07,-0.07l-0.09,0.1ZM722.09,155.56l3.76,-3.85l1.27,-2.19l1.76,-1.86l1.16,-0.78l1.28,-3.35l1.56,-1.3l0.53,-0.83l-0.21,-1.83l-1.61,-2.42l0.43,-1.13l-0.17,-0.78l-0.83,-0.53l-2.11,-0.0l0.04,-0.99l-0.57,-2.22l4.99,-2.94l4.49,-1.8l2.38,-0.19l1.84,-0.74l5.64,-0.24l3.13,1.25l3.16,-1.68l5.49,-1.06l0.58,0.45l0.68,-0.2l0.12,-0.98l1.45,-0.72l1.03,-0.93l0.75,-0.2l0.69,-2.05l1.87,-1.76l0.79,-1.26l1.12,0.03l1.13,-0.52l1.07,-1.63l-0.46,-0.7l0.36,-1.2l-0.25,-0.51l-0.64,0.02l-0.17,-1.17l-0.94,-1.59l-1.01,-0.62l0.12,-0.18l0.59,0.39l0.53,-0.27l0.75,-1.44l-0.01,-0.91l0.81,-0.65l-0.01,-0.97l-0.93,-0.19l-0.6,0.7l-0.28,0.12l0.56,-1.3l-0.81,-0.62l-1.26,0.05l-0.87,0.77l-0.92,-0.41l-0.06,-0.29l2.05,-2.5l1.78,-1.47l1.67,-2.64l0.7,-0.56l0.11,-0.59l0.78,-0.95l0.07,-0.56l-0.5,-0.95l0.78,-1.89l4.82,-7.61l4.77,-4.5l2.84,-0.51l19.67,-5.66l0.41,0.88l-0.08,2.01l1.02,1.22l0.43,3.8l2.29,3.25l-0.09,1.89l0.85,2.42l-0.59,1.07l-0.0,3.41l0.71,0.9l1.32,2.76l0.19,1.09l0.62,0.84l0.12,3.92l0.55,0.85l0.54,0.07l0.53,-0.61l0.06,-0.87l0.33,-0.07l1.05,1.12l3.97,15.58l0.74,1.2l0.22,15.32l0.6,0.62l3.57,16.23l1.26,1.34l-2.82,3.18l0.03,0.54l1.52,1.31l0.19,0.6l-0.78,0.88l-0.64,1.8l-0.41,0.39l0.15,0.69l-1.25,0.64l0.04,-4.02l-0.57,-2.28l-0.74,-1.62l-1.46,-1.1l-0.17,-1.13l-0.7,-0.1l-0.42,1.33l0.68,1.27l1.05,0.83l0.97,2.85l-13.75,-4.06l-1.28,-1.47l-2.39,0.24l-0.63,-0.43l-1.06,-0.15l-1.74,-1.91l-0.75,-2.33l0.12,-0.72l-0.36,-0.63l-0.56,-0.21l0.09,-0.46l-0.35,-0.42l-1.64,-0.68l-1.08,0.32l-0.53,-1.22l-1.92,-0.93l-34.6,8.73l-34.44,7.84l-1.11,-5.15ZM818.84,168.69l1.08,-0.48l0.14,0.63l-1.17,1.53l-0.05,-1.68ZM730.07,136.63l0.03,-0.69l0.78,-0.07l-0.38,1.09l-0.43,-0.33Z",
            name: "New York"
        },
        "US-HI": {
            path: "M295.5,583.17l0.06,-1.75l4.12,-4.97l1.03,-3.4l-0.33,-0.64l0.94,-2.43l-0.05,-3.52l0.39,-0.78l2.47,-0.7l1.55,0.23l4.45,-1.4l0.51,-0.7l-0.17,-2.69l0.4,-1.66l1.78,-1.16l1.74,2.15l-0.15,0.94l1.88,3.6l0.94,0.35l5.13,7.65l0.86,3.93l-1.52,3.14l0.22,0.58l1.47,0.95l-0.68,2.07l0.35,1.51l1.6,3.0l-1.39,0.86l-2.28,-0.2l-3.27,0.51l-4.56,-1.32l-2.15,-1.34l-6.66,-0.15l-1.59,0.26l-1.56,1.19l-1.63,0.58l-1.14,0.02l-0.7,-2.54l-2.09,-2.18ZM306.33,530.7l1.6,0.08l0.51,2.07l-0.3,2.25l0.37,0.59l2.33,0.88l1.38,0.1l1.55,1.39l0.27,1.55l0.93,0.97l-0.13,1.05l1.83,2.52l-0.13,0.66l-0.61,0.48l-1.82,0.38l-1.84,-0.18l-1.47,-1.19l-2.21,-0.24l-2.69,-1.48l0.01,-1.23l1.15,-1.86l0.41,-2.07l-1.76,-1.28l-1.08,-1.75l-0.1,-2.61l1.79,-1.08ZM297.2,518.01l0.71,0.31l0.38,1.05l2.64,2.0l0.9,1.11l0.92,0.08l0.8,1.67l1.56,1.05l0.72,0.06l1.07,1.11l-1.31,0.41l-2.75,-0.66l-3.23,-3.93l-3.16,-2.01l-1.39,-0.44l-0.05,-0.7l1.58,-0.43l0.62,-0.67ZM301.59,541.55l-2.09,-0.98l-0.28,-0.51l2.92,0.34l-0.56,1.15ZM298.23,532.36l-0.92,-0.29l-0.72,-0.89l0.92,-2.06l-0.49,-1.73l2.6,1.38l0.61,2.08l0.14,1.06l-2.15,0.45ZM281.13,503.64l0.57,-1.85l-0.38,-0.9l-0.16,-2.84l0.75,-0.92l-0.12,-1.22l2.74,1.9l2.9,-0.62l1.56,0.15l0.38,1.01l-0.33,2.17l0.29,1.5l-0.69,0.6l-0.19,1.55l0.38,1.54l0.86,0.51l0.29,1.07l-0.52,1.14l0.53,1.28l-1.18,-0.0l-0.2,-0.48l-2.04,-0.86l-0.77,-2.83l-1.27,-0.38l0.8,-0.11l0.32,-0.46l-0.08,-0.66l-0.63,-0.68l-1.75,-0.32l0.23,1.82l-2.28,-1.1ZM259.66,469.47l-0.24,-2.03l-0.91,-0.69l-0.68,-1.23l0.08,-1.2l0.08,-0.34l2.39,-0.81l4.6,0.53l0.67,1.04l2.51,1.09l0.69,1.25l-0.15,1.9l-2.3,1.32l-0.74,1.3l-0.79,0.34l-2.78,0.09l-0.92,-1.53l-1.52,-1.0ZM245.78,462.61l-0.23,-0.74l1.03,-0.75l4.32,-0.72l0.43,0.3l-0.92,0.4l-0.68,0.94l-1.66,-0.5l-1.36,0.34l-0.94,0.72Z",
            name: "Hawaii"
        },
        "US-VT": {
            path: "M805.56,72.69l26.03,-7.97l0.89,1.85l-0.74,2.37l-0.03,1.54l2.22,2.75l-0.51,0.58l0.26,1.13l-0.67,1.6l-1.35,1.49l-0.64,1.32l-1.72,0.7l-0.62,0.92l-0.1,0.98l0.93,3.74l-0.29,2.44l0.4,0.54l-0.6,2.11l0.15,2.19l-1.0,1.87l0.27,2.36l-0.53,1.54l1.43,5.44l-0.22,1.22l1.05,5.3l-0.58,0.85l0.11,2.31l0.6,1.26l1.51,1.1l-11.44,2.89l-0.57,-0.85l-4.02,-15.75l-1.72,-1.59l-0.91,0.25l-0.3,1.19l-0.12,-0.26l-0.11,-3.91l-0.68,-1.0l-0.14,-0.98l-1.37,-2.85l-0.63,-0.68l0.01,-3.15l0.6,-1.15l-0.86,-2.57l0.08,-1.93l-0.39,-0.91l-1.55,-1.63l-0.38,-0.81l-0.41,-3.71l-1.03,-1.27l0.11,-1.87l-0.43,-1.01Z",
            name: "Vermont"
        },
        "US-NM": {
            path: "M230.86,422.88l11.82,-123.66l25.67,2.24l26.1,1.86l26.12,1.45l25.74,1.02l-0.31,10.24l-0.74,0.39l-3.59,98.69l-32.38,-1.34l-33.53,-2.02l-0.44,0.76l0.54,2.31l0.44,1.26l0.99,0.76l-30.55,-2.46l-0.43,0.36l-0.82,9.46l-14.63,-1.33Z",
            name: "New Mexico"
        },
        "US-NC": {
            path: "M826.87,289.49l0.07,-0.05l-0.02,0.03l-0.04,0.02ZM819.58,272.4l0.2,0.23l-0.05,0.01l-0.16,-0.24ZM821.84,276.68l0.19,0.15l-0.02,0.18l-0.05,-0.08l-0.12,-0.25ZM676.72,321.77l0.92,0.17l1.52,-0.39l0.42,-0.39l0.52,-0.97l0.13,-2.7l1.34,-1.19l0.47,-1.05l2.24,-1.47l2.12,-0.52l0.76,0.18l1.32,-0.52l2.36,-2.52l0.78,-0.25l1.84,-2.29l1.48,-1.0l1.55,-0.19l1.15,-2.65l-0.28,-1.22l1.66,0.06l0.51,-1.65l0.93,-0.77l1.08,-0.77l0.51,1.52l1.07,0.33l1.34,-1.17l1.35,-2.64l2.49,-1.59l0.79,0.08l0.82,0.8l1.06,-0.21l0.84,-1.07l1.47,-4.18l1.08,-1.1l1.47,0.09l0.44,-0.31l-0.69,-1.26l0.4,-2.0l-0.42,-0.9l0.38,-1.25l7.42,-0.86l19.54,-3.36l37.22,-8.42l31.12,-7.87l0.4,1.21l3.54,3.24l1.0,1.53l-1.21,-1.0l-0.16,-0.63l-0.92,-0.4l-0.52,0.05l-0.24,0.65l0.66,0.54l0.59,1.56l-0.53,0.01l-0.91,-0.75l-2.31,-0.8l-0.4,-0.48l-0.55,0.13l-0.31,0.69l0.14,0.64l1.37,0.44l1.69,1.38l-1.11,0.66l-2.48,-1.2l-0.36,0.51l0.14,0.42l1.6,1.18l-1.84,-0.33l-2.23,-0.87l-0.46,0.14l0.01,0.48l0.6,0.7l1.71,0.83l-0.97,0.58l0.0,0.6l-0.43,0.53l-1.48,0.74l-0.89,-0.77l-0.61,0.22l-0.1,0.35l-0.2,-0.13l-1.32,-2.32l0.21,-2.63l-0.42,-0.48l-0.89,-0.22l-0.37,0.64l0.62,0.71l-0.43,0.99l-0.02,1.04l0.49,1.73l1.6,2.2l-0.31,1.28l0.48,0.29l2.97,-0.59l2.1,-1.49l0.27,0.01l0.37,0.79l0.76,-0.34l1.56,0.05l0.16,-0.71l-0.57,-0.32l1.29,-0.76l2.04,-0.46l-0.1,1.19l0.64,0.29l-0.6,0.88l0.89,1.19l-0.84,0.1l-0.19,0.66l1.38,0.46l0.26,0.94l-1.21,0.05l-0.19,0.66l0.66,0.59l1.25,-0.16l0.52,0.26l0.4,-0.38l0.18,-1.95l-0.75,-3.33l0.41,-0.48l0.56,0.43l0.94,0.06l0.28,-0.57l-0.29,-0.44l0.48,-0.57l1.71,1.84l-0.0,1.41l0.62,0.9l-0.53,0.18l-0.25,0.47l0.9,1.14l-0.08,0.37l-0.42,0.55l-0.78,0.09l-0.91,-0.86l-0.32,0.33l0.13,1.26l-1.08,1.61l0.2,0.57l-0.32,0.22l-0.15,0.98l-0.74,0.55l0.1,0.91l-0.9,0.96l-1.06,0.21l-0.59,-0.37l-0.52,0.52l-0.93,-0.81l-0.86,0.1l-0.4,-0.82l-0.59,-0.21l-0.52,0.38l0.08,0.94l-0.52,0.22l-1.42,-1.25l1.31,-0.4l0.23,-0.88l-0.57,-0.42l-2.02,0.31l-1.14,1.01l0.29,0.67l0.44,0.16l0.09,0.82l0.35,0.25l-0.03,0.12l-0.57,-0.34l-1.69,0.83l-1.12,-0.43l-1.45,0.06l-3.32,-0.7l0.42,1.08l0.97,0.45l0.36,0.64l0.63,0.11l0.87,-0.32l1.68,0.63l2.35,0.39l3.51,0.11l0.47,0.42l-0.06,0.52l-0.99,0.05l-0.38,0.5l0.13,0.23l-1.62,1.44l0.32,0.58l1.85,0.01l-2.55,3.5l-1.67,0.04l-1.59,-0.98l-0.9,-0.19l-1.21,-1.02l-1.12,0.07l0.07,0.47l1.04,1.14l2.32,2.09l2.68,0.26l1.31,0.49l1.71,-2.16l0.51,0.47l1.17,0.33l0.4,-0.57l-0.55,-0.9l0.87,0.16l0.19,0.57l0.66,0.24l1.63,-1.2l-0.18,0.61l0.29,0.57l-0.29,0.38l-0.43,-0.2l-0.41,0.37l0.03,0.9l-0.97,1.72l0.01,0.78l-0.71,-0.07l-0.06,-0.74l-1.12,-0.61l-0.42,0.47l0.27,1.45l-0.52,-1.1l-0.65,-0.16l-1.22,1.08l-0.21,0.52l0.25,0.27l-2.03,0.32l-2.75,1.84l-0.67,-1.04l-0.75,-0.29l-0.37,0.49l0.43,1.26l-0.57,-0.01l-0.09,0.82l-0.94,1.73l-0.91,0.85l-0.59,-0.26l0.49,-0.69l-0.02,-0.77l-1.06,-0.93l-0.08,-0.52l-1.69,-0.41l-0.16,0.47l0.43,1.16l0.2,0.33l0.58,0.07l0.3,0.61l-0.88,0.37l-0.08,0.71l0.65,0.64l0.77,0.18l-0.01,0.37l-2.12,1.67l-1.92,2.65l-2.0,4.31l-0.34,2.13l0.12,1.34l-0.15,-1.03l-1.01,-1.59l-0.55,-0.17l-0.3,0.48l1.17,3.95l-0.63,2.27l-3.9,0.19l-1.43,0.65l-0.35,-0.52l-0.58,-0.18l-0.54,1.07l-1.9,1.14l-0.61,-0.02l-23.25,-15.36l-1.05,-0.02l-18.68,3.49l-0.65,-2.77l-3.25,-2.84l-0.47,0.08l-1.23,1.31l-0.01,-1.29l-0.82,-0.54l-22.82,3.35l-0.64,-0.27l-0.62,0.46l-0.25,0.65l-3.98,1.93l-0.89,1.23l-1.01,0.08l-4.78,2.66l-20.95,3.93l-0.34,-4.55l0.7,-0.95ZM817.0,271.48l0.19,0.35l0.24,0.39l-0.45,-0.41l0.02,-0.32ZM807.53,290.29l0.2,0.32l-0.16,-0.09l-0.03,-0.23ZM815.31,299.15l0.16,-0.36l0.16,0.07l-0.13,0.29l-0.19,0.01ZM812.76,299.11l-0.06,-0.28l-0.03,-0.11l0.3,0.26l-0.21,0.13ZM812.97,264.02l0.37,-0.24l0.15,0.42l-0.42,0.07l-0.1,-0.25ZM791.92,329.4l0.04,-0.08l0.22,0.03l-0.0,0.09l-0.26,-0.05Z",
            name: "North Carolina"
        },
        "US-ND": {
            path: "M438.54,42.78l2.06,6.9l-0.73,2.53l0.57,2.36l-0.27,1.17l0.47,1.99l0.01,3.26l1.42,3.95l0.45,0.54l-0.08,0.97l0.39,1.52l0.62,0.74l1.48,3.74l-0.06,3.9l0.42,0.7l0.5,8.35l0.51,1.54l0.51,0.25l-0.47,2.64l0.36,1.63l-0.14,1.75l0.69,1.1l0.2,2.16l0.49,1.13l1.8,2.56l0.15,2.2l0.51,1.08l0.17,1.39l-0.24,1.36l0.28,1.74l-27.89,0.73l-28.38,0.19l-28.38,-0.37l-28.49,-0.93l2.75,-65.47l23.08,0.78l25.57,0.42l25.57,-0.06l24.11,-0.49Z",
            name: "North Dakota"
        },
        "US-NE": {
            path: "M422.58,174.02l3.92,2.71l3.93,1.9l1.34,-0.22l0.51,-0.47l0.36,-1.08l0.48,-0.2l2.49,0.34l1.32,-0.47l1.58,0.25l3.45,-0.65l2.37,1.98l1.4,0.14l1.55,0.77l1.45,0.08l0.88,1.1l1.49,0.17l-0.06,0.98l1.68,2.08l3.32,0.6l0.19,0.68l-0.22,1.87l1.13,1.94l0.01,2.29l1.15,1.08l0.34,1.72l1.73,1.46l0.07,1.88l1.5,2.11l-0.49,2.33l0.44,3.09l0.52,0.54l0.94,-0.2l-0.04,1.25l1.21,0.5l-0.41,2.36l0.21,0.44l1.12,0.4l-0.6,0.77l-0.09,1.01l0.13,0.59l0.82,0.5l0.16,1.45l-0.26,0.92l0.26,1.27l0.55,0.61l0.3,1.93l-0.22,1.33l0.23,0.72l-0.57,0.92l0.02,0.79l0.45,0.88l1.23,0.63l0.25,2.5l1.1,0.51l0.03,0.79l1.18,2.75l-0.23,0.96l1.16,0.21l0.8,0.99l1.1,0.24l-0.15,0.96l1.31,1.68l-0.21,1.12l0.51,0.91l-26.15,1.05l-27.83,0.63l-27.84,0.14l-27.89,-0.35l0.46,-21.66l-0.39,-0.41l-32.36,-1.04l1.85,-43.24l43.36,1.22l44.67,-0.04Z",
            name: "Nebraska"
        },
        "US-LA": {
            path: "M508.97,412.97l-1.33,-21.76l51.44,-4.07l0.34,0.83l1.48,0.66l-0.92,1.35l-0.25,2.13l0.49,0.72l1.18,0.31l-1.21,0.47l-0.45,0.78l0.45,1.36l1.05,0.84l0.08,2.15l0.46,0.54l1.51,0.74l0.45,1.05l1.42,0.44l-0.87,1.22l-0.85,2.34l-0.75,0.04l-0.52,0.51l-0.02,0.73l0.63,0.72l-0.22,1.16l-1.35,0.96l-1.08,1.89l-1.37,0.67l-0.68,0.83l-0.79,2.42l-0.25,3.52l-1.55,1.74l0.13,1.21l0.62,0.96l-0.35,2.38l-1.61,0.29l-0.6,0.57l0.28,0.97l0.64,0.59l-0.26,1.41l0.98,1.51l-1.18,1.18l-0.08,0.45l0.4,0.23l6.18,-0.55l29.23,-2.92l-0.68,3.47l-0.52,1.02l-0.2,2.24l0.69,0.98l-0.09,0.66l0.6,1.0l1.31,0.7l1.22,1.42l0.14,0.88l0.89,1.39l0.14,1.05l1.11,1.84l-1.85,0.39l-0.38,-0.08l-0.01,-0.56l-0.53,-0.57l-1.28,0.28l-1.18,-0.59l-1.51,0.17l-0.61,-0.98l-1.24,-0.86l-2.84,-0.47l-1.24,0.63l-1.39,2.3l-1.3,1.42l-0.42,0.91l0.07,1.2l0.55,0.89l0.82,0.57l4.25,0.82l3.35,-1.0l1.32,-1.19l0.68,-1.19l0.34,0.59l1.08,0.43l0.59,-0.4l0.81,0.03l0.51,-0.46l-0.76,1.21l-1.12,-0.12l-0.57,0.32l-0.38,0.62l0.0,0.83l0.77,1.22l1.48,-0.02l0.65,0.89l1.1,0.48l0.94,-0.21l0.51,-0.45l0.46,-1.11l-0.02,-1.37l0.93,-0.58l0.42,-0.99l0.23,0.05l0.1,1.16l-0.24,0.25l0.18,0.57l0.43,0.15l-0.07,0.75l1.34,1.08l0.34,-0.16l-0.48,0.59l0.18,0.63l-0.35,0.13l-0.52,-0.57l-0.92,-0.19l-1.0,1.89l-0.85,0.14l-0.46,0.53l0.16,1.19l-1.6,-0.61l-0.43,0.19l0.04,0.46l1.14,1.06l-1.17,-0.14l-0.92,0.61l0.68,0.43l1.26,2.04l2.74,0.97l-0.08,1.2l0.34,0.41l2.07,-0.32l0.77,0.17l0.17,0.53l0.73,0.32l1.35,-0.34l0.53,0.78l1.08,-0.46l1.13,0.74l0.14,0.3l-0.4,0.62l1.54,0.86l-0.39,0.65l0.39,0.58l-0.18,0.62l-0.95,1.49l-1.3,-1.56l-0.68,0.34l0.1,0.66l-0.38,0.12l0.41,-1.88l-1.33,-0.76l-0.5,0.5l0.2,1.18l-0.54,0.45l-0.27,-1.02l-0.57,-0.25l-0.89,-1.27l0.03,-0.77l-0.96,-0.14l-0.47,0.5l-1.41,-0.17l-0.41,-0.61l0.14,-0.63l-0.39,-0.46l-0.45,-0.02l-0.81,0.73l-1.18,0.02l0.12,-1.23l-0.46,-0.88l-0.91,0.04l0.09,-0.96l-0.37,-0.36l-0.91,-0.03l-0.22,0.58l-0.85,-0.38l-0.48,0.27l-2.61,-1.26l-1.24,-0.03l-0.67,-0.64l-0.61,0.19l-0.3,0.56l-0.05,1.25l1.72,0.94l1.67,0.35l-0.16,0.92l0.28,0.39l-0.34,0.35l0.23,0.68l-0.76,0.95l-0.02,0.66l0.81,0.97l-0.95,1.43l-1.33,0.94l-0.76,-1.15l0.22,-1.5l-0.35,-0.92l-0.49,-0.18l-0.4,0.36l-1.15,-1.08l-0.59,0.42l-0.76,-1.05l-0.62,-0.2l-0.64,1.33l-0.85,0.26l-0.88,-0.53l-0.86,0.53l-0.1,0.62l0.48,0.41l-0.68,0.56l-0.13,1.44l-0.46,0.13l-0.39,0.83l-0.92,0.08l-0.11,-0.68l-1.6,-0.4l-0.77,0.97l-1.92,-0.93l-0.3,-0.54l-0.99,0.01l-0.35,0.6l-1.16,-0.51l0.42,-0.4l0.01,-1.46l-0.38,-0.57l-1.9,-1.19l-0.08,-0.54l-0.83,-0.72l-0.09,-0.91l0.73,-1.15l-0.34,-1.14l-0.87,-0.19l-0.34,0.57l0.16,0.43l-0.59,0.81l0.04,0.91l-1.8,-0.4l0.07,-0.39l-0.47,-0.54l-1.97,0.76l-0.7,-2.22l-1.32,0.23l-0.18,-2.12l-1.31,-0.35l-1.89,0.3l-1.09,0.65l-0.21,-0.71l0.84,-0.26l-0.05,-0.8l-0.6,-0.58l-1.03,-0.1l-0.85,0.42l-0.95,-0.15l-0.4,0.8l-2.0,1.11l-0.63,-0.31l-1.29,0.71l0.54,1.37l0.8,0.31l0.97,1.51l-1.39,0.19l-1.83,1.03l-3.69,-0.4l-1.24,0.21l-3.09,-0.45l-1.99,-0.68l-1.81,-1.07l-3.7,-1.1l-3.19,-0.48l-2.53,0.58l-5.62,0.45l-1.0,0.26l-1.82,1.25l-0.59,-0.63l-0.26,-1.08l1.59,-0.47l0.7,-1.76l-0.02,-1.55l-0.39,-0.56l1.11,-1.54l0.23,-1.59l-0.5,-1.83l0.07,-1.46l-0.66,-0.7l-0.21,-1.04l0.83,-2.22l-0.64,-1.95l0.76,-0.84l0.3,-1.49l0.78,-0.94l0.79,-2.83l-0.18,-1.42l0.58,-0.97l-0.75,-1.33l0.84,-0.39l0.2,-0.44l-0.89,-1.36l0.03,-2.13l-1.07,-0.23l-0.57,-1.57l-0.92,-0.84l0.28,-1.27l-0.81,-0.76l-0.33,-0.95l-0.64,-0.34l0.22,-0.98l-1.16,-0.58l-0.81,-0.93l0.16,-2.46l-0.68,-1.93l-1.33,-1.98l-2.63,-2.21ZM607.49,467.45l-0.03,-0.03l-0.07,-0.04l0.13,-0.01l-0.03,0.08ZM607.51,465.85l-0.02,-0.01l0.03,-0.01l-0.02,0.02ZM567.04,468.98l-2.0,-0.42l-0.66,-0.5l0.73,-0.43l0.35,-0.76l0.39,0.49l0.83,0.21l-0.15,0.61l0.5,0.81ZM550.39,463.0l1.73,-1.05l3.34,1.07l-0.69,0.56l-0.17,0.81l-0.68,0.17l-3.53,-1.57Z",
            name: "Louisiana"
        },
        "US-SD": {
            path: "M336.37,128.84l0.3,-0.53l0.75,-19.93l28.5,0.93l28.4,0.37l28.4,-0.19l27.78,-0.73l-0.18,1.71l-0.73,1.71l-2.9,2.46l-0.42,1.27l1.59,2.13l1.06,2.06l0.55,0.36l1.74,0.24l1.01,0.84l0.57,1.02l1.45,38.83l-1.84,0.09l-0.42,0.56l0.24,1.44l0.88,1.14l0.01,1.45l-0.65,0.36l0.17,1.48l0.48,0.43l1.09,0.04l0.34,1.68l-0.16,0.91l-0.62,0.83l0.02,1.73l-0.68,2.45l-0.49,0.44l-0.67,1.88l0.5,1.1l1.33,1.08l-0.16,0.62l0.64,0.66l0.35,1.15l-1.65,-0.28l-0.34,-0.94l-0.85,-0.73l0.19,-0.61l-0.28,-0.59l-1.58,-0.23l-1.03,-1.18l-1.57,-0.11l-1.51,-0.75l-1.34,-0.12l-2.38,-1.99l-3.78,0.6l-1.65,-0.25l-1.19,0.46l-2.62,-0.33l-0.98,0.48l-0.76,1.45l-0.72,0.05l-3.67,-1.82l-4.13,-2.8l-44.83,0.05l-43.33,-1.22l1.79,-43.2Z",
            name: "South Dakota"
        },
        "US-DC": {
            path: "M781.25,216.97l0.45,-0.77l2.04,1.26l-0.66,1.14l-0.55,-1.05l-1.28,-0.58Z",
            name: "District of Columbia"
        },
        "US-DE": {
            path: "M798.52,195.11l0.42,-1.51l0.92,-1.11l1.72,-0.71l1.12,0.06l-0.33,0.56l-0.08,1.38l-1.13,1.92l0.1,1.09l1.11,1.1l-0.07,1.52l2.29,2.48l1.25,0.6l0.93,1.52l0.99,3.35l1.72,1.57l0.57,1.32l3.06,1.99l1.44,-0.09l0.45,1.25l-1.06,0.56l0.16,1.32l0.36,0.19l-0.83,0.57l-0.08,1.21l0.66,0.21l0.85,-0.73l0.71,0.34l0.3,-0.21l0.75,1.55l-10.19,2.82l-8.12,-26.12Z",
            name: "Delaware"
        },
        "US-FL": {
            path: "M630.28,423.69l47.19,-6.86l1.53,1.91l0.87,2.72l1.47,1.0l48.79,-5.11l1.03,1.38l0.03,1.09l0.55,1.05l1.04,0.48l1.64,-0.28l0.85,-0.75l-0.14,-4.57l-0.98,-1.49l-0.22,-1.77l0.28,-0.74l0.62,-0.3l0.12,-0.7l5.6,0.96l4.03,-0.16l0.14,1.24l-0.75,-0.12l-0.33,0.43l0.25,1.54l2.11,1.81l0.22,1.01l0.42,0.38l0.29,1.92l1.87,3.29l1.7,4.87l0.73,0.84l0.51,1.5l1.64,2.46l0.64,1.57l2.79,3.71l1.93,3.18l2.29,2.77l0.16,0.6l0.63,0.36l6.82,7.53l-0.48,-0.03l-0.27,0.61l-1.35,-0.02l-0.34,-0.65l0.38,-1.38l-0.16,-0.56l-2.3,-0.92l-0.46,0.53l1.0,2.8l0.78,0.97l2.14,4.77l9.92,13.71l1.37,3.11l3.66,5.34l-1.38,-0.35l-0.43,0.74l0.8,0.65l0.85,0.24l0.56,-0.22l1.46,0.94l2.05,3.05l-0.5,0.34l-0.12,0.53l1.16,0.53l0.89,1.83l-0.08,1.06l0.59,0.95l0.61,2.64l-0.27,0.75l0.93,8.98l-0.31,1.07l0.46,0.67l0.5,3.1l-0.81,1.46l0.07,2.23l-0.84,0.74l-0.22,1.8l-0.48,0.85l0.21,1.47l-0.3,1.75l0.54,1.74l0.45,0.23l-1.15,1.8l-0.39,1.28l-0.94,0.24l-0.53,-0.22l-1.37,0.45l-0.35,1.06l-0.89,0.3l-0.18,0.58l-0.85,0.67l-1.44,0.14l-0.27,-0.32l-1.23,-0.1l-0.9,1.05l-3.17,1.13l-1.06,-0.59l-0.7,-1.04l0.06,-1.79l1.0,0.84l1.64,0.47l0.26,0.63l0.52,0.07l1.35,-0.72l0.2,-0.69l-0.26,-0.64l-1.58,-1.11l-2.4,-0.26l-0.91,-0.46l-0.85,-1.67l-0.89,-0.72l0.22,-0.98l-0.48,-0.28l-0.53,0.15l-1.38,-2.51l-0.44,-0.3l-0.64,0.07l-0.44,-0.61l0.22,-0.89l-0.7,-0.65l-1.21,-0.6l-1.06,-0.08l-0.75,-0.54l-0.57,0.18l-2.8,-0.59l-0.5,0.64l0.25,-0.91l-0.46,-0.42l-0.87,0.12l-0.26,-0.72l-0.88,-0.65l-0.61,-1.41l-0.55,-0.11l-0.72,-2.94l-0.77,-1.0l-0.16,-1.52l-0.44,-0.83l-0.71,-0.89l-0.49,-0.15l-0.12,0.93l-1.29,-0.26l1.06,-1.3l0.3,-0.75l-0.12,-0.63l0.86,-1.46l0.65,-0.34l0.28,-0.83l-0.61,-0.38l-1.42,0.93l-0.89,1.29l-0.42,2.17l-1.37,0.35l-0.21,-1.33l-0.79,-1.33l-0.27,-4.04l-0.86,-0.6l1.63,-1.33l0.22,-0.97l-0.58,-0.42l-3.06,1.92l-0.75,-0.66l-0.4,0.26l-1.27,-0.89l-0.37,0.74l1.13,1.09l0.52,0.1l1.26,2.0l-1.04,0.23l-1.42,-0.38l-0.84,-1.6l-1.13,-0.6l-1.94,-2.55l-1.04,-2.28l-1.28,-0.87l0.1,-0.87l-0.97,-1.8l-1.77,-0.98l0.09,-0.67l0.99,-0.41l-0.35,-0.49l0.44,-0.73l-0.39,-0.35l0.4,-1.21l2.47,-4.47l-1.05,-2.41l-0.68,-0.46l-0.92,0.42l-0.28,0.93l0.29,1.2l-0.24,0.03l-0.73,-2.44l-0.99,-0.28l-1.19,-0.87l-1.52,-0.31l0.29,1.95l-0.48,0.61l0.27,0.59l2.21,0.56l0.25,0.97l-0.37,2.46l-0.31,-0.58l-0.8,-0.22l-2.13,-1.53l-0.41,0.2l-0.29,-0.63l0.59,-2.11l0.07,-2.97l-0.66,-1.97l0.42,-0.51l0.48,-1.91l-0.24,-0.54l0.66,-3.04l-0.35,-5.26l-0.71,-1.7l0.35,-0.47l-0.47,-2.18l-2.1,-1.33l-0.05,-0.52l-0.55,-0.43l-0.1,-1.01l-0.92,-0.73l-0.55,-1.51l-0.64,-0.25l-1.44,0.32l-1.03,-0.2l-1.57,0.54l-1.14,-1.74l-1.51,-0.48l-0.19,-0.6l-1.35,-1.51l-0.87,-0.59l-0.62,0.07l-1.52,-1.16l-0.8,-0.21l-0.51,-2.75l-3.06,-1.13l-0.65,-0.59l-0.52,-1.23l-2.15,-1.93l-2.19,-1.09l-1.45,-0.12l-3.44,-1.68l-2.85,0.98l-1.0,-0.4l-1.05,0.42l-0.35,0.68l-1.33,0.68l-0.5,0.7l0.03,0.64l-0.73,-0.22l-0.59,0.6l0.67,0.94l1.51,0.08l0.41,0.21l-3.03,0.23l-1.58,1.51l-0.91,0.45l-1.3,1.56l-1.56,1.03l-0.32,0.13l0.2,-0.48l-0.26,-0.54l-0.66,-0.04l-0.96,0.75l-1.12,1.5l-2.2,0.23l-2.11,1.06l-0.78,0.03l-0.27,-2.03l-1.71,-2.23l-2.21,-1.0l-0.18,-0.41l-2.51,-1.5l2.79,1.33l1.21,-0.74l0.0,-0.74l-1.32,-0.34l-0.36,0.55l-0.21,-1.01l-0.34,-0.1l0.13,-0.52l-0.49,-0.33l-1.39,0.61l-2.3,-0.76l0.65,-1.08l0.83,-0.1l1.03,-1.45l-0.91,-0.95l-0.46,0.12l-0.49,1.02l-0.44,-0.04l-0.81,0.56l-0.72,-0.9l-0.7,0.09l-0.17,0.38l-1.34,0.73l-0.14,0.68l0.29,0.46l-3.95,-1.35l-5.05,-0.71l0.12,-0.24l1.27,0.29l0.61,-0.53l2.1,0.39l0.23,-0.78l-0.94,-1.02l0.09,-0.7l-0.63,-0.28l-0.5,0.32l-0.28,-0.47l-1.9,0.19l-2.25,1.1l0.3,-0.63l-0.41,-0.58l-0.96,0.35l-0.58,-0.25l-0.23,0.44l0.2,0.71l-1.45,0.8l-0.4,0.63l-5.18,0.97l0.32,-0.52l-0.4,-0.52l-1.35,-0.28l-0.72,-0.53l0.69,-0.53l0.01,-0.78l-0.68,-0.13l-0.81,-0.66l-0.46,0.11l0.14,0.76l-0.42,1.77l-1.05,-1.39l-0.69,-0.45l-0.55,0.07l-0.3,0.71l0.82,1.77l-0.25,0.79l-1.39,0.99l-0.05,1.04l-0.6,0.22l-0.17,0.57l-1.48,0.56l0.28,-0.65l-0.21,-0.46l1.14,-1.03l0.07,-0.74l-0.4,-0.58l-1.19,-0.24l-0.41,-0.84l0.3,-1.7l-0.18,-1.61l-2.17,-1.12l-2.39,-2.46l0.32,-1.44l-0.15,-1.04ZM767.29,490.44l0.48,1.07l0.9,0.39l0.78,-0.15l1.41,1.67l0.91,0.58l1.86,0.69l1.61,0.07l0.55,-0.44l-0.08,-0.87l0.55,-0.65l-0.16,-1.21l0.76,-1.36l0.09,-1.81l-0.64,-1.62l-1.46,-2.01l-1.74,-1.32l-1.19,-0.13l-1.12,0.83l-1.83,3.16l-2.12,1.94l-0.13,0.77l0.57,0.41ZM644.36,434.13l-0.94,0.26l0.41,-0.44l0.53,0.18ZM665.13,435.7l0.98,-0.28l0.35,0.32l0.09,0.72l-1.42,-0.75ZM770.56,455.01l0.42,0.56l-0.43,0.75l0.0,-1.31ZM788.88,525.23l0.01,-0.07l0.01,0.03l-0.03,0.04ZM789.47,522.87l-0.22,-0.23l0.49,-0.32l-0.27,0.55ZM768.83,453.61l0.21,0.76l-0.31,2.33l0.28,1.79l-1.38,-3.23l1.19,-1.65ZM679.81,445.61l0.22,-0.2l0.36,0.02l-0.11,0.42l-0.47,-0.25Z",
            name: "Florida"
        },
        "US-WA": {
            path: "M38.52,55.26l0.46,-1.32l0.18,0.45l0.65,0.3l1.04,-0.74l0.43,0.59l0.7,-0.03l0.17,-0.77l-0.92,-1.56l0.79,-0.74l-0.09,-1.36l0.49,-0.39l-0.1,-1.03l0.81,-0.27l0.05,0.5l0.48,0.41l0.95,-0.31l-0.09,-0.68l-1.35,-1.65l-0.9,0.15l-1.88,-0.56l0.17,-1.98l0.66,0.53l0.52,-0.07l0.29,-0.56l-0.16,-0.67l3.3,-0.52l0.26,-0.69l-1.7,-0.96l-0.86,-0.14l-0.37,-1.51l-0.7,-0.42l-0.81,-0.02l0.32,-4.73l-0.49,-1.28l0.1,-0.69l-0.4,-0.34l0.76,-5.74l-0.13,-2.46l-0.45,-0.62l-0.16,-1.36l-0.65,-1.33l-0.73,-0.57l-0.32,-2.45l0.35,-2.27l-0.15,-1.11l1.74,-3.3l-0.52,-1.23l4.59,3.9l1.19,0.38l0.92,0.75l0.81,1.3l1.86,1.08l3.24,0.91l0.84,0.77l1.42,0.11l1.73,1.02l2.33,0.73l1.46,-0.47l0.52,0.29l0.55,0.69l-0.03,1.09l0.55,0.74l0.31,0.11l0.49,-0.35l0.07,-0.75l0.45,0.03l0.63,1.39l-0.4,0.58l0.34,0.49l0.56,-0.04l0.72,-0.84l-0.38,-1.7l1.03,-0.24l-0.44,0.23l-0.21,0.69l1.27,4.41l-0.46,0.1l-1.67,1.73l0.22,-1.29l-0.22,-0.41l-1.31,0.31l-0.38,0.81l0.09,0.95l-1.37,1.7l-1.98,1.38l-1.06,1.41l-0.96,0.69l-1.1,1.67l-0.06,0.71l0.62,0.6l0.96,0.12l2.77,-0.48l1.22,-0.58l-0.03,-0.7l-0.64,-0.23l-2.94,0.79l-0.35,-0.3l3.23,-3.42l3.06,-0.88l0.89,-1.51l1.73,-1.54l0.53,0.57l0.54,-0.19l0.22,-1.81l-0.06,2.25l0.26,0.91l-0.99,-0.21l-0.64,0.77l-0.41,-0.73l-0.52,-0.19l-0.39,0.64l0.3,0.71l0.02,1.63l-0.21,-1.07l-0.67,-0.21l-0.47,0.69l-0.07,0.75l0.46,0.66l-0.63,0.58l-0.0,0.45l0.42,0.17l1.68,-0.57l0.25,1.09l-1.08,1.79l-0.08,1.05l-0.83,0.7l0.13,1.0l-0.85,-0.68l1.12,-1.44l-0.23,-0.96l-1.96,1.08l-0.38,0.64l-0.05,-2.11l-0.52,0.02l-1.03,1.59l-1.26,0.53l-1.14,1.87l-1.51,0.3l-0.46,0.43l-0.21,1.18l1.11,-0.03l-0.25,0.36l0.27,0.37l0.93,0.02l0.06,0.68l0.53,0.47l0.52,-0.27l0.35,-1.76l0.14,0.42l0.83,-0.15l1.11,1.48l1.31,-0.61l1.65,-1.48l0.98,-1.56l0.63,0.78l0.73,0.14l0.44,-0.23l-0.06,-0.86l1.56,-0.55l0.35,-0.94l-0.33,-1.27l0.22,-1.19l-0.18,-1.36l0.83,0.2l0.3,-0.92l-0.19,-0.75l-0.72,-0.63l0.89,-1.13l0.07,-1.75l1.24,-1.24l0.61,-1.37l1.61,-0.49l0.78,-1.16l-0.45,-0.66l-0.51,-0.02l-0.86,-1.3l0.16,-2.09l-0.26,-0.87l0.49,-0.79l0.06,-0.84l-1.15,-1.73l-0.63,-0.4l-0.17,-0.64l0.18,-0.5l0.59,0.23l0.53,-0.33l0.24,-1.8l0.79,-0.24l0.3,-1.0l-0.61,-2.32l0.44,-0.53l-0.03,-0.86l-0.96,-0.88l-0.95,0.3l-1.09,-2.66l0.93,-1.83l41.31,9.4l38.96,7.65l-9.66,54.39l-0.47,1.02l1.04,3.0l0.13,2.0l-1.0,1.3l0.73,1.88l-31.18,-5.92l-1.67,0.79l-7.24,-1.02l-1.68,0.92l-4.19,-0.12l-3.18,0.45l-1.64,0.75l-0.88,-0.26l-1.2,0.3l-1.51,-0.23l-2.43,-0.94l-0.91,0.46l-3.45,0.51l-2.11,-0.71l-1.65,0.3l-0.31,-1.36l-1.09,-0.88l-4.34,-1.46l-2.32,-0.11l-1.15,-0.51l-1.27,0.21l-1.89,0.86l-4.5,0.58l-1.11,-0.71l-1.15,-0.3l-1.61,-1.15l-1.84,-0.51l-0.63,-0.81l0.64,-6.82l-0.47,-0.95l-0.22,-1.9l-0.98,-1.35l-1.96,-1.67l-2.82,-0.11l-1.03,-1.31l-0.15,-1.05l-0.56,-0.63l-2.36,-0.31l-0.56,-0.3l-0.24,-0.79l-0.5,-0.18l-0.97,0.35l-0.84,-0.26l-1.1,0.4l-0.97,-1.47l-0.89,-0.22ZM61.85,39.78l0.16,0.74l-0.42,0.49l0.0,-0.91l0.26,-0.31ZM71.27,20.38l-0.61,0.87l-0.15,0.52l0.11,-1.01l0.65,-0.38ZM71.14,15.62l-0.09,-0.05l0.05,-0.04l0.04,0.1ZM70.37,15.48l-0.77,0.39l0.37,-0.68l-0.07,-0.6l0.22,-0.07l0.25,0.97ZM57.56,42.45l0.05,-0.02l-0.01,0.01l-0.04,0.02ZM67.75,19.23l1.73,-2.1l0.47,-0.02l0.53,1.71l-0.35,-0.55l-0.51,-0.12l-0.55,0.44l-0.35,-0.09l-0.35,0.73l-0.63,-0.01ZM67.87,20.4l0.44,0.0l0.61,0.5l0.08,0.35l-0.79,-0.2l-0.33,-0.65ZM68.84,23.16l-0.1,0.51l-0.0,0.0l-0.02,-0.24l0.12,-0.28ZM69.15,25.42l0.08,0.04l0.12,-0.04l-0.16,0.11l-0.05,-0.1ZM69.52,25.33l0.48,-0.93l1.02,1.21l0.11,1.12l-0.34,0.36l-0.34,-0.09l-0.27,-1.55l-0.67,-0.12ZM66.34,9.97l0.48,-0.34l0.18,1.51l-0.22,-0.05l-0.44,-1.12ZM68.04,9.66l0.83,0.8l-0.65,0.31l-0.18,-1.11ZM66.69,38.03l0.34,-1.07l0.21,-0.25l-0.03,1.07l-0.52,0.26ZM66.99,33.31l0.1,-1.04l0.35,-0.34l-0.23,1.56l-0.22,-0.18ZM66.51,14.27l-0.41,-0.4l0.6,-0.75l-0.18,0.61l-0.01,0.55ZM66.68,14.62l0.4,0.2l-0.08,0.12l-0.29,-0.12l-0.03,-0.2ZM66.74,12.96l-0.01,-0.1l0.05,-0.12l-0.04,0.23ZM64.36,13.12l-1.06,-0.82l0.19,-1.81l1.33,1.92l-0.35,0.18l-0.11,0.54ZM62.18,42.55l0.23,-0.25l0.02,0.01l-0.13,0.31l-0.12,-0.07ZM60.04,40.3l-0.09,-0.19l0.04,-0.07l0.0,0.13l0.05,0.14Z",
            name: "Washington"
        },
        "US-KS": {
            path: "M477.9,239.67l0.44,0.63l0.76,0.18l1.04,0.8l2.19,-1.08l-0.0,0.75l1.08,0.79l0.23,1.44l-0.95,-0.15l-0.6,0.31l-0.17,0.97l-1.14,1.37l-0.06,1.14l-0.79,0.5l0.04,0.64l1.56,2.1l2.0,1.49l0.2,1.13l0.42,0.86l0.74,0.56l0.32,1.11l1.89,0.91l1.54,0.26l2.67,46.82l-31.55,1.48l-31.97,0.88l-31.98,0.26l-32.05,-0.37l1.21,-65.47l27.9,0.35l27.86,-0.14l27.85,-0.64l27.68,-1.12l1.65,1.23Z",
            name: "Kansas"
        },
        "US-WI": {
            path: "M598.7,107.43l0.83,-0.15l-0.13,0.81l-0.56,0.01l-0.14,-0.68ZM594.22,116.05l0.47,-0.41l0.26,-2.36l0.95,-0.25l0.64,-0.69l0.22,-1.4l0.41,-0.63l0.63,-0.03l0.06,0.38l-0.76,0.06l-0.18,0.51l0.17,1.27l-0.38,0.17l-0.11,0.58l0.56,0.57l-0.24,0.65l-0.5,0.33l-0.69,1.91l0.07,1.23l-1.05,2.28l-0.41,0.15l-0.86,-0.97l-0.19,-0.72l0.31,-1.57l0.62,-1.05ZM510.06,124.08l0.41,-0.27l0.28,-0.9l-0.45,-1.48l0.04,-1.91l0.7,-1.16l0.53,-2.25l-1.61,-2.91l-0.83,-0.36l-1.28,-0.01l-0.21,-2.31l1.67,-2.26l-0.05,-0.77l0.77,-1.55l1.95,-1.09l0.48,-0.75l0.97,-0.25l0.45,-0.75l1.16,-0.14l1.04,-1.56l-0.97,-12.11l1.03,-0.35l0.22,-1.1l0.73,-0.97l0.78,0.69l1.68,0.64l2.61,-0.56l3.28,-1.57l2.65,-0.82l2.21,-2.12l0.31,0.29l1.39,-0.11l1.25,-1.48l0.79,-0.58l1.04,-0.1l0.4,-0.52l1.07,0.99l-0.48,1.68l-0.67,1.01l0.23,1.61l-1.21,2.21l0.64,0.66l2.5,-1.09l0.72,-0.86l2.16,1.22l2.34,0.47l0.44,0.54l0.86,-0.13l1.6,0.7l2.23,3.54l15.48,2.52l4.65,1.96l1.68,-0.17l1.63,0.42l1.33,-0.59l3.17,0.71l2.18,0.09l0.85,0.41l0.56,0.89l-0.42,1.09l0.41,0.77l3.4,0.63l1.41,1.13l-0.16,0.71l0.59,1.11l-0.36,0.81l0.43,1.25l-0.78,1.25l-0.03,1.76l0.91,0.63l1.38,-0.26l1.02,-0.72l0.2,0.26l-0.79,2.44l0.04,1.31l1.32,1.46l0.84,0.35l-0.24,2.02l-2.42,1.2l-0.51,0.79l0.04,1.26l-1.61,3.49l-0.4,3.5l1.11,0.82l0.92,-0.04l0.5,-0.36l0.49,-1.37l1.82,-1.47l0.66,-2.53l1.06,-1.7l0.14,0.25l0.45,-0.07l0.57,-0.7l0.88,-0.4l1.12,1.12l0.59,0.19l-0.29,2.21l-1.18,2.82l-0.56,5.58l0.23,1.11l0.8,0.93l0.07,0.52l-0.51,0.98l-1.3,1.34l-0.86,3.89l0.15,2.57l0.72,1.2l0.06,1.24l-1.07,3.22l0.12,2.12l-0.73,2.11l-0.28,2.47l0.59,2.02l-0.04,1.32l0.49,0.54l-0.21,1.7l0.92,0.78l0.54,2.43l1.2,1.54l0.08,1.69l-0.33,1.45l0.47,2.95l-44.2,4.6l-0.19,-0.79l-1.56,-2.19l-4.94,-0.84l-1.06,-1.35l-0.36,-1.69l-0.9,-1.21l-0.86,-4.9l1.04,-2.62l-0.09,-0.99l-0.71,-0.79l-1.44,-0.48l-0.71,-1.76l-0.47,-6.02l-0.7,-1.4l-0.52,-2.56l-1.15,-0.6l-1.1,-1.56l-0.93,-0.11l-1.17,-0.75l-1.71,0.09l-2.67,-1.79l-2.3,-3.5l-2.64,-2.1l-2.94,-0.53l-0.73,-1.24l-1.12,-1.0l-3.12,-0.45l-3.53,-2.74l0.45,-1.24l-0.12,-1.61l0.25,-0.81l-0.88,-3.11ZM541.58,78.25l0.05,-0.28l0.03,0.16l-0.08,0.12ZM537.91,83.72l0.28,-0.21l0.05,0.08l-0.33,0.12Z",
            name: "Wisconsin"
        },
        "US-OR": {
            path: "M10.69,140.12l0.01,-1.77l0.5,-0.84l0.32,-1.95l1.12,-1.91l0.24,-1.9l-0.72,-2.57l-0.33,-0.15l-0.12,-1.81l3.04,-3.82l2.5,-5.98l0.01,0.77l0.52,0.52l0.49,-0.28l0.6,-1.6l0.47,-0.48l0.31,0.98l1.12,0.41l0.33,-0.54l-0.45,-1.76l0.27,-0.87l-0.45,-0.14l-0.79,0.32l1.74,-3.16l1.13,-0.96l0.89,0.3l0.49,-0.29l-0.47,-1.08l-0.81,-0.4l1.77,-4.63l0.47,-0.57l0.02,-0.99l1.08,-2.67l0.62,-2.6l1.04,-1.92l0.33,0.28l0.66,-0.33l-0.04,-0.6l-0.76,-0.62l1.06,-2.6l0.32,0.22l0.59,-0.19l0.13,-0.35l-0.04,-0.51l-0.57,-0.32l0.85,-3.84l1.23,-1.8l0.83,-3.04l1.14,-1.76l0.83,-2.45l0.26,-1.21l-0.18,-0.5l1.19,-1.08l-0.32,-1.64l0.96,0.57l0.78,-0.63l-0.39,-0.75l0.2,-0.65l-0.77,-0.77l0.51,-1.07l1.3,-0.86l0.06,-0.46l-0.93,-0.34l-0.33,-1.25l0.97,-2.14l-0.04,-1.48l0.86,-0.53l0.58,-1.33l0.18,-1.96l-0.21,-1.45l0.83,1.17l0.6,0.18l-0.11,0.89l0.55,0.53l0.83,-0.96l-0.27,-0.99l0.21,-0.07l0.24,0.56l0.69,0.32l1.51,0.04l0.37,-0.36l1.37,-0.19l0.99,2.08l2.43,0.92l1.25,-0.64l0.78,0.04l1.72,1.51l0.77,1.04l0.21,1.9l0.43,0.78l-0.03,2.05l-0.39,1.24l0.19,0.93l-0.43,1.74l0.26,1.45l0.79,0.85l1.94,0.56l1.44,1.05l1.36,0.41l1.04,0.69l4.98,-0.53l2.9,-1.06l1.14,0.51l2.23,0.09l4.24,1.43l0.69,0.54l0.19,1.15l0.57,0.58l1.86,-0.27l2.11,0.71l3.79,-0.55l0.69,-0.42l2.19,0.93l1.64,0.24l1.2,-0.3l0.88,0.26l1.89,-0.78l3.07,-0.43l4.16,0.13l1.61,-0.91l7.17,1.02l0.96,-0.19l0.79,-0.58l31.27,5.93l0.23,1.81l0.93,1.82l1.16,0.63l1.96,1.86l0.57,2.45l-0.16,1.0l-3.69,4.55l-0.4,1.41l-1.39,2.63l-2.21,2.42l-0.65,2.68l-1.49,1.84l-2.23,1.5l-1.92,3.35l-1.49,1.27l-0.62,2.02l-0.12,1.87l0.28,0.92l0.56,0.61l0.54,0.04l0.39,-0.35l0.63,0.76l0.89,-0.05l0.07,0.88l0.81,0.95l-0.46,1.0l-0.65,0.06l-0.33,0.4l0.21,1.8l-1.03,2.56l-1.22,1.41l-6.86,39.16l-26.21,-4.99l-28.9,-6.05l-28.8,-6.61l-28.95,-7.24l-1.48,-2.59l0.2,-2.36l-0.23,-0.89Z",
            name: "Oregon"
        },
        "US-KY": {
            path: "M583.02,306.59l0.35,-2.18l1.13,0.96l0.72,0.2l0.75,-0.36l0.46,-0.88l0.87,-3.55l-0.54,-1.75l0.38,-0.86l-0.1,-1.88l-1.27,-2.04l1.79,-3.21l1.24,-0.51l0.73,0.06l7.03,2.56l0.81,-0.2l0.65,-0.72l0.24,-1.93l-1.49,-2.14l-0.24,-1.44l0.2,-0.87l0.4,-0.52l1.1,-0.18l1.24,-0.83l3.0,-0.95l0.64,-0.51l0.15,-1.13l-1.53,-2.05l-0.08,-0.68l1.33,-1.97l0.14,-1.16l1.25,0.42l1.12,-1.33l-0.68,-2.0l1.92,0.9l1.72,-0.84l0.03,1.18l1.0,0.46l0.99,-0.94l0.02,-1.36l0.51,0.16l1.9,-0.96l4.41,1.52l0.64,0.94l0.86,0.18l0.59,-0.59l0.73,-2.53l1.38,-0.55l1.39,-1.34l0.86,1.29l0.77,0.42l1.16,-0.13l0.11,0.75l0.95,0.19l0.67,-0.62l0.03,-1.01l0.84,-0.38l0.26,-0.48l-0.25,-2.09l0.84,-0.4l0.34,-0.56l-0.06,-0.69l1.25,-0.56l0.34,-0.72l0.38,1.47l0.61,0.6l1.46,0.64l1.25,-0.0l1.11,0.81l0.53,-0.11l0.26,-0.55l1.1,-0.46l0.53,-0.69l0.04,-3.48l0.85,-2.18l1.02,0.18l1.55,-1.19l0.75,-3.46l1.04,-0.37l1.65,-2.23l0.0,-0.81l-1.18,-2.88l2.78,-0.59l1.54,0.81l3.85,-2.82l2.23,-0.46l-0.18,-1.07l0.36,-1.47l-0.32,-0.36l-1.22,-0.04l0.58,-1.39l-1.09,-1.54l1.65,-1.83l1.81,1.18l0.92,-0.11l1.93,-1.01l0.78,0.88l1.76,0.54l0.57,1.28l0.94,0.92l0.79,1.84l2.6,0.67l1.87,-0.57l1.63,0.27l2.18,1.85l0.96,0.43l1.28,-0.18l0.61,-1.31l0.99,-0.54l1.35,0.5l1.34,0.04l1.33,1.09l1.26,-0.69l1.41,-0.15l1.81,-2.55l1.72,-1.03l0.92,2.35l0.7,0.83l2.45,0.81l1.35,0.97l0.75,1.05l0.93,3.35l-0.37,0.45l0.09,0.72l-0.44,0.61l0.02,0.53l2.24,2.62l1.35,0.92l-0.08,0.89l1.34,0.97l0.58,1.36l1.55,1.2l0.98,1.62l2.14,0.84l1.09,1.12l2.14,0.25l-4.86,6.13l-5.06,4.16l-0.42,0.86l0.22,1.25l-2.07,1.93l0.04,1.64l-3.06,1.63l-0.8,2.38l-1.71,0.6l-2.7,1.83l-1.66,0.48l-3.39,2.42l-23.95,3.09l-8.8,1.42l-7.47,0.86l-7.68,0.46l-22.71,3.52l-0.64,-0.56l-3.63,0.09l-0.41,0.6l1.03,3.57l-23.0,2.73ZM580.9,306.78l-0.59,0.08l-0.06,-0.55l0.47,-0.01l0.18,0.49Z",
            name: "Kentucky"
        },
        "US-CO": {
            path: "M364.18,239.57l-1.22,65.87l-29.29,-0.9l-29.38,-1.43l-29.35,-1.95l-32.17,-2.75l8.33,-87.15l27.79,2.4l28.23,1.92l29.58,1.46l27.95,0.87l-0.46,21.66Z",
            name: "Colorado"
        },
        "US-OH": {
            path: "M664.99,178.81l1.67,0.47l1.04,-0.3l1.74,1.07l2.07,0.26l1.47,1.18l1.71,0.23l-2.19,1.18l-0.12,0.47l0.42,0.24l2.46,0.19l1.39,-1.1l1.77,-0.25l3.39,0.96l0.92,-0.08l1.48,-1.29l1.74,-0.6l1.15,-0.96l1.91,-0.97l2.62,-0.03l1.09,-0.62l1.24,-0.06l1.07,-0.8l4.24,-5.46l4.53,-3.47l6.92,-4.36l5.83,28.05l-0.51,0.54l-1.28,0.43l-0.41,0.95l1.65,2.24l0.02,2.11l0.41,0.26l0.31,0.94l-0.04,0.76l-0.54,0.83l-0.5,4.08l0.18,3.21l-0.58,0.41l0.34,1.11l-0.35,1.74l-0.39,0.54l0.76,1.23l-0.25,1.87l-2.41,2.65l-0.82,1.86l-1.37,1.5l-1.24,0.67l-0.6,0.7l-0.87,-0.92l-1.18,0.14l-1.32,1.74l-0.09,1.32l-1.78,0.85l-0.78,2.25l0.28,1.58l-0.94,0.85l0.3,0.67l0.63,0.41l0.27,1.3l-0.8,0.17l-0.5,1.6l0.06,-0.93l-0.91,-1.26l-1.53,-0.55l-1.07,0.71l-0.82,1.98l-0.34,2.69l-0.53,0.82l1.22,3.58l-1.27,0.39l-0.28,0.42l-0.25,3.12l-2.66,1.2l-1.0,0.05l-0.76,-1.06l-1.51,-1.1l-2.34,-0.73l-1.17,-1.92l-0.31,-1.14l-0.42,-0.33l-0.73,0.13l-1.84,1.17l-1.1,1.29l-0.4,1.05l-1.43,0.15l-0.87,0.61l-1.11,-1.0l-3.14,-0.59l-1.37,0.72l-0.53,1.25l-0.71,0.05l-3.04,-2.26l-1.93,-0.29l-1.77,0.56l-2.14,-0.52l-0.55,-1.54l-0.96,-0.97l-0.63,-1.38l-2.03,-0.76l-1.14,-1.01l-0.97,0.26l-1.31,0.89l-0.46,0.03l-1.79,-1.23l-0.61,0.2l-0.6,0.71l-8.53,-55.69l20.43,-4.26ZM675.61,181.34l0.53,-0.79l0.67,0.41l-0.48,0.35l-0.72,0.03ZM677.31,180.77l0.01,-0.0l0.01,-0.0l-0.02,0.0Z",
            name: "Ohio"
        },
        "US-OK": {
            path: "M399.06,359.31l-0.05,-42.03l-0.39,-0.4l-26.69,-0.22l-25.13,-0.6l0.31,-10.23l36.7,0.74l36.0,-0.07l35.99,-0.86l35.56,-1.62l0.6,10.68l4.55,24.34l1.41,37.88l-1.2,-0.22l-0.29,-0.36l-2.13,-0.21l-0.82,-0.79l-2.11,-0.39l-1.77,-2.05l-1.23,-0.22l-2.25,-1.57l-1.5,-0.4l-0.8,0.46l-0.23,0.88l-0.82,0.24l-0.46,0.62l-2.47,-0.14l-0.47,-0.19l-0.27,-0.68l-1.05,-0.61l-2.3,1.29l-1.17,0.2l-0.19,0.56l-0.63,0.28l-2.12,-0.77l-1.7,1.18l-1.17,0.08l-0.89,0.42l-0.83,1.37l-1.48,0.06l-0.57,1.25l-1.26,-1.55l-1.7,-0.1l-0.32,-0.58l-1.21,-0.46l-0.02,-0.96l-0.44,-0.5l-1.24,-0.18l-0.73,1.38l-0.66,0.11l-0.84,-0.5l-0.97,0.07l-0.71,-1.51l-1.09,-0.35l-1.17,0.57l-0.45,1.7l-0.7,-0.08l-0.49,0.43l0.29,0.73l-0.51,1.68l-0.43,0.19l-0.55,-0.55l-0.3,-0.91l0.39,-1.65l-0.75,-0.86l-0.8,0.18l-0.49,0.76l-0.84,-0.18l-0.92,0.98l-1.07,0.13l-0.53,-1.36l-1.99,-0.19l-0.3,-1.48l-1.19,-0.53l-0.82,0.33l-2.12,2.15l-1.21,0.51l-0.97,-0.38l0.19,-1.25l-0.28,-1.13l-2.33,-0.68l-0.07,-2.18l-0.43,-0.55l-2.11,0.39l-2.52,-0.25l-0.64,0.26l-0.81,1.21l-0.95,0.06l-1.77,-1.77l-0.97,-0.12l-1.5,0.56l-2.68,-0.63l-1.86,-1.0l-1.05,0.25l-2.46,-0.3l-0.17,-2.12l-0.85,-0.87l-0.44,-1.02l-1.16,-0.41l-0.7,-0.83l-0.83,0.08l-0.44,1.64l-2.22,-0.68l-1.07,0.6l-0.96,-0.09l-3.79,-3.78l-1.12,-0.43l-0.8,0.08Z",
            name: "Oklahoma"
        },
        "US-WV": {
            path: "M693.03,248.42l3.95,-1.54l0.35,-0.71l0.12,-2.77l1.15,-0.22l0.4,-0.61l-0.57,-2.49l-0.61,-1.24l0.49,-0.64l0.36,-2.77l0.68,-1.66l0.45,-0.39l1.24,0.55l0.41,0.71l-0.14,1.13l0.71,0.46l0.78,-0.44l0.48,-1.42l0.49,0.21l0.57,-0.2l0.2,-0.44l-0.63,-2.09l-0.75,-0.55l0.81,-0.79l-0.26,-1.71l0.74,-2.0l1.65,-0.51l0.17,-1.6l1.02,-1.42l0.43,-0.08l0.65,0.79l0.67,0.19l2.28,-1.59l1.5,-1.64l0.79,-1.83l2.45,-2.67l0.37,-2.41l-0.73,-1.0l0.71,-2.33l-0.25,-0.76l0.59,-0.58l-0.27,-3.43l0.47,-3.93l0.53,-0.8l0.08,-1.11l-0.38,-1.21l-0.39,-0.33l-0.04,-2.01l-1.57,-1.91l0.44,-0.54l0.85,-0.1l0.3,-0.33l4.03,19.34l0.47,0.31l16.6,-3.55l2.17,10.68l0.5,0.37l2.06,-2.5l0.97,-0.56l0.34,-1.03l1.63,-1.99l0.25,-1.05l0.52,-0.4l1.19,0.45l0.74,-0.32l1.32,-2.6l0.6,-0.46l-0.04,-0.85l0.42,0.59l1.81,0.52l3.2,-0.57l0.78,-0.86l0.07,-1.46l2.0,-0.74l1.02,-1.69l0.67,-0.1l3.16,1.5l1.81,-0.71l-0.45,1.02l0.56,0.92l1.27,0.42l0.09,0.96l1.13,0.43l0.09,1.2l0.33,0.42l-0.58,3.64l-9.0,-4.48l-0.64,0.24l-0.31,1.14l0.38,1.61l-0.52,1.62l0.41,2.28l-1.36,2.4l-0.42,1.76l-0.72,0.53l-0.42,1.11l-0.27,0.21l-0.61,-0.23l-0.37,0.33l-1.25,3.28l-1.84,-0.78l-0.64,0.25l-0.94,2.77l0.08,1.47l-0.73,1.14l-0.19,2.33l-0.89,2.2l-3.25,-0.36l-1.44,-1.76l-1.71,-0.24l-0.5,0.41l-0.26,2.17l0.19,1.3l-0.32,1.45l-0.49,0.45l-0.31,1.04l0.23,0.92l-1.58,2.44l-0.04,2.1l-0.52,2.0l-2.58,4.73l-0.75,3.16l0.14,0.76l1.14,0.55l-1.08,1.38l0.06,0.6l0.45,0.4l-2.16,2.13l-0.55,-0.7l-0.84,0.15l-3.12,2.53l-1.03,-0.56l-1.32,0.26l-0.44,0.91l0.45,1.17l-0.91,0.91l-0.73,-0.05l-2.27,1.0l-1.21,0.96l-2.18,-1.36l-0.73,-0.01l-0.82,1.58l-1.1,0.49l-1.22,1.46l-1.08,0.08l-1.98,-1.09l-1.31,-0.01l-0.61,-0.74l-1.19,-0.6l-0.31,-1.33l-0.89,-0.55l0.36,-0.67l-0.3,-0.81l-0.85,-0.37l-0.84,0.25l-1.33,-0.17l-1.26,-1.19l-2.06,-0.79l-0.76,-1.43l-1.58,-1.24l-0.7,-1.49l-1.0,-0.6l-0.12,-1.09l-1.38,-0.95l-2.0,-2.27l0.71,-2.03l-0.25,-1.62l-0.66,-1.46Z",
            name: "West Virginia"
        },
        "US-WY": {
            path: "M218.53,207.02l10.1,-86.6l25.46,2.74l26.8,2.4l26.83,1.91l27.85,1.46l-3.67,87.11l-27.32,-1.41l-28.21,-1.97l-29.69,-2.63l-28.14,-3.02Z",
            name: "Wyoming"
        },
        "US-UT": {
            path: "M178.67,180.38l41.53,5.44l-2.51,21.5l0.35,0.45l32.24,3.43l-8.33,87.15l-42.54,-4.67l-42.41,-5.77l16.08,-108.34l5.58,0.82ZM187.74,191.46l-0.3,0.04l-0.25,0.62l0.74,3.68l-0.81,0.19l-0.5,1.31l1.15,0.59l0.35,-0.84l0.37,-0.18l0.92,1.14l0.83,1.68l-0.25,1.0l0.16,1.45l-0.4,0.77l0.4,0.52l-0.05,0.56l1.58,1.84l0.02,0.59l1.13,1.92l0.71,-0.1l0.83,-1.74l0.08,2.28l0.53,0.94l0.06,1.8l0.99,0.47l1.65,-0.67l2.48,-1.77l0.37,-1.25l3.32,-1.44l0.17,-0.54l-0.52,-1.02l-0.68,-0.84l-1.36,-0.7l-1.87,-4.59l-0.87,-0.46l0.87,-0.92l1.3,0.6l1.33,-0.15l0.92,-0.83l-0.06,-1.12l-1.55,-0.5l-0.81,0.42l-1.17,-0.12l0.27,-0.76l-0.58,-0.79l-1.86,-0.22l-0.56,1.13l0.28,0.78l-0.35,0.69l0.55,2.44l-0.91,0.32l-0.34,-0.42l0.22,-1.8l-0.42,-0.69l-0.06,-1.74l-0.68,-0.6l-1.32,-0.11l-1.07,-1.55l-0.19,-0.69l0.64,-0.55l0.36,-1.29l-0.83,-1.38l-1.23,-0.28l-0.99,0.81l-2.73,0.2l-0.35,0.63l0.62,0.83l-0.28,0.43ZM199.13,204.0l0.03,0.02l0.04,0.11l-0.07,-0.13ZM199.17,204.81l0.31,0.91l-0.18,0.9l-0.39,-0.93l0.25,-0.88Z",
            name: "Utah"
        },
        "US-IN": {
            path: "M600.86,189.63l1.43,0.87l2.1,0.14l1.52,-0.38l2.63,-1.39l2.73,-2.1l32.3,-4.83l8.81,57.45l-0.66,1.15l0.3,0.92l0.81,0.79l-0.66,1.14l0.49,0.8l1.12,0.04l-0.36,1.14l0.18,0.51l-1.81,0.29l-3.18,2.55l-0.43,0.17l-1.4,-0.81l-3.46,0.91l-0.09,0.78l1.19,3.1l-1.4,1.88l-1.18,0.49l-0.45,0.89l-0.31,2.6l-1.11,0.88l-1.06,-0.24l-0.47,0.47l-0.85,1.95l0.05,3.14l-0.39,1.0l-1.38,0.85l-0.93,-0.68l-1.24,0.01l-1.48,-0.69l-0.62,-1.84l-1.89,-0.73l-0.44,0.3l-0.04,0.5l0.83,0.68l-0.62,0.31l-0.89,-0.35l-0.36,0.29l-0.04,0.48l0.54,0.93l-1.08,0.68l0.14,2.37l-1.06,0.65l-0.0,0.83l-0.16,0.37l0.08,-0.5l-0.33,-0.51l-1.6,0.18l-1.4,-1.69l-0.5,-0.08l-1.67,1.5l-1.57,0.69l-1.07,2.89l-0.81,-1.07l-2.79,-0.77l-1.11,-0.61l-1.08,-0.18l-1.76,0.92l-0.64,-1.02l-0.58,-0.18l-0.53,0.56l0.64,1.86l-0.34,0.84l-0.28,0.09l-0.02,-1.18l-0.42,-0.4l-0.58,0.01l-1.46,0.79l-1.41,-0.84l-0.85,0.0l-0.48,0.95l0.71,1.55l-0.49,0.74l-1.15,-0.39l-0.07,-0.54l-0.53,-0.44l0.55,-0.63l-0.35,-3.09l0.96,-0.78l-0.07,-0.58l-0.44,-0.23l0.69,-0.46l0.25,-0.61l-1.17,-1.47l0.46,-1.16l0.32,0.19l1.39,-0.55l0.33,-1.8l0.55,-0.4l0.44,-0.92l-0.06,-0.83l1.52,-1.07l0.06,-0.69l-0.41,-0.93l0.57,-0.86l0.14,-1.29l0.87,-0.51l0.4,-1.91l-1.08,-2.54l0.22,-0.8l-0.16,-1.11l-0.93,-0.91l-0.61,-1.5l-1.05,-0.78l-0.04,-0.59l0.92,-1.39l-0.63,-2.25l1.27,-1.31l-6.5,-50.68Z",
            name: "Indiana"
        },
        "US-IL": {
            path: "M540.07,225.55l0.86,-0.35l0.37,-0.67l-0.23,-2.33l-0.73,-0.93l0.15,-0.41l0.72,-0.69l2.42,-0.98l0.71,-0.65l0.63,-1.68l0.17,-2.11l1.65,-2.47l0.27,-0.94l-0.03,-1.22l-0.59,-1.95l-2.23,-1.88l-0.11,-1.77l0.67,-2.38l0.45,-0.37l4.6,-0.85l0.81,-0.41l0.82,-1.12l2.55,-1.0l1.43,-1.56l-0.01,-1.57l0.4,-1.71l1.42,-1.46l0.29,-0.74l0.33,-4.37l-0.76,-2.14l-4.02,-2.47l-0.28,-1.5l-0.48,-0.82l-3.64,-2.48l44.58,-4.64l-0.01,2.66l0.57,2.59l1.37,2.49l1.31,0.95l0.76,2.6l1.26,2.71l1.42,1.84l6.6,51.49l-1.22,1.13l-0.1,0.69l0.67,1.76l-0.84,1.09l-0.03,1.11l1.19,1.09l0.56,1.41l0.89,0.82l-0.1,1.8l1.06,2.31l-0.28,1.49l-0.87,0.56l-0.21,1.47l-0.59,0.93l0.34,1.2l-1.48,1.13l-0.23,0.41l0.28,0.7l-0.93,1.17l-0.31,1.19l-1.64,0.67l-0.63,1.67l0.15,0.8l0.97,0.83l-1.27,1.15l0.42,0.76l-0.49,0.23l-0.13,0.54l0.43,2.94l-1.15,0.19l0.08,0.45l0.92,0.78l-0.48,0.17l-0.03,0.64l0.83,0.29l0.04,0.42l-1.31,1.97l-0.25,1.19l0.59,1.22l0.7,0.64l0.37,1.08l-3.31,1.22l-1.19,0.82l-1.24,0.24l-0.77,1.01l-0.18,2.04l0.3,0.88l1.4,1.93l0.07,0.54l-0.53,1.19l-0.96,0.03l-6.3,-2.43l-1.08,-0.08l-1.57,0.64l-0.68,0.72l-1.44,2.95l0.06,0.66l-1.18,-1.2l-0.79,0.14l-0.35,0.47l0.59,1.13l-1.24,-0.79l-0.01,-0.68l-1.6,-2.21l-0.4,-1.12l-0.76,-0.37l-0.05,-0.49l0.94,-1.35l0.2,-1.03l-0.32,-1.01l-1.44,-2.02l-0.47,-3.18l-2.26,-0.99l-1.55,-2.14l-1.95,-0.82l-1.72,-1.34l-1.56,-0.14l-1.82,-0.96l-2.32,-1.78l-2.34,-2.44l-0.36,-1.95l2.37,-6.85l-0.25,-2.32l0.98,-2.06l-0.38,-0.84l-2.66,-1.45l-2.59,-0.67l-1.29,0.45l-0.86,1.45l-0.46,0.28l-0.44,-0.13l-1.3,-1.9l-0.43,-1.52l0.16,-0.87l-0.54,-0.91l-0.29,-1.65l-0.83,-1.36l-0.94,-0.9l-4.11,-2.52l-1.01,-1.64l-4.53,-3.53l-0.73,-1.9l-1.04,-1.21l-0.04,-1.6l-0.96,-1.48l-0.75,-3.54l0.1,-2.94l0.6,-1.28ZM585.52,295.52l0.05,0.05l0.04,0.04l-0.05,-0.0l-0.04,-0.09Z",
            name: "Illinois"
        },
        "US-AK": {
            path: "M89.36,517.03l0.84,0.08l0.09,0.36l-0.3,0.32l-0.64,0.3l-0.15,-0.15l0.25,-0.4l-0.12,-0.31l0.04,-0.2ZM91.79,517.2l0.42,-0.02l0.19,-0.11l0.26,-0.56l1.74,-0.37l2.26,0.07l1.57,0.63l0.84,0.69l0.02,1.85l0.32,0.18l0.0,0.34l0.25,0.27l-0.35,0.09l-0.25,-0.16l-0.23,0.08l-0.41,-0.33l-0.29,-0.04l-0.69,0.23l-0.91,-0.21l-0.07,-0.26l-0.24,-0.17l0.27,-0.21l0.74,0.72l0.46,-0.02l0.2,-0.48l-0.28,-0.44l-0.03,-0.3l-0.31,-0.67l-0.96,-0.52l-1.05,0.27l-0.57,0.69l-1.04,0.3l-0.44,-0.3l-0.48,0.12l-0.06,0.12l-0.63,-0.14l-0.26,0.06l-0.22,0.24l0.2,-0.3l-0.1,-0.55l0.12,-0.79ZM99.83,520.19l0.3,-0.07l0.29,-0.28l-0.03,-0.55l0.31,0.2l-0.06,0.45l0.83,0.92l-0.93,-0.51l-0.44,0.41l-0.13,-0.54l-0.13,-0.04ZM100.07,520.81l0.0,0.04l-0.03,0.0l0.02,-0.04ZM102.01,520.78l0.05,-0.34l0.33,-0.2l0.01,-0.12l-0.58,-1.24l0.1,-0.2l0.59,-0.24l0.29,-0.3l0.65,-0.34l0.62,-0.01l0.41,-0.13l0.81,0.1l1.42,-0.06l0.64,0.15l0.49,0.27l0.88,0.11l0.27,0.15l0.23,-0.22l0.27,-0.05l0.39,0.09l0.2,0.21l0.26,-0.05l0.2,0.38l0.44,0.31l0.1,0.23l0.7,-0.06l0.3,-0.77l0.44,-0.61l0.47,-0.21l1.78,-0.45l0.5,0.04l0.37,0.23l1.13,-0.38l0.66,0.04l-0.11,0.41l0.43,0.51l0.42,0.26l0.62,0.06l0.42,-0.43l0.14,-0.42l-0.34,-0.29l-0.31,-0.03l0.15,-0.44l-0.15,-0.38l1.04,-1.0l0.83,-0.99l0.12,-0.08l0.34,0.17l0.38,-0.02l0.32,0.3l0.19,0.37l0.66,-0.29l-0.1,-0.57l-0.43,-0.58l-0.46,-0.24l0.15,-0.44l0.77,-0.47l0.36,0.04l0.68,-0.2l0.8,-0.08l0.58,0.18l0.45,-0.16l-0.12,-0.52l0.66,-0.6l0.4,0.06l0.26,-0.11l0.43,-0.52l0.34,-0.12l0.23,-0.46l-0.42,-0.3l-0.38,0.03l-0.33,0.15l-0.36,0.39l-0.51,-0.09l-0.5,0.27l-2.19,-0.52l-1.69,-0.24l-0.71,-0.26l-0.12,-0.2l0.17,-0.32l0.04,-0.44l-0.28,-0.56l0.45,-0.35l0.43,-0.13l0.36,0.38l0.04,0.25l-0.15,0.44l0.07,0.39l0.56,0.12l0.32,-0.15l-0.03,-0.3l0.16,-0.35l-0.05,-0.75l-0.84,-1.05l0.01,-0.7l-0.67,-0.19l-0.19,0.24l-0.06,0.48l-0.41,0.22l-0.09,0.03l-0.26,-0.56l-0.34,-0.09l-0.51,0.41l-0.02,0.26l-0.15,0.15l-0.38,-0.02l-0.48,0.27l-0.24,0.54l-0.22,1.13l-0.13,0.32l-0.19,0.05l-0.31,-0.31l0.1,-2.67l-0.23,-0.99l0.19,-0.33l0.02,-0.27l-0.16,-0.29l-0.53,-0.27l-0.46,0.26l-0.1,-0.07l-0.35,0.13l-0.01,-0.54l-0.54,-0.61l0.19,-0.22l0.08,-0.65l-0.16,-0.37l-0.55,-0.26l-1.89,-0.01l-0.58,-0.34l-1.01,-0.12l-0.16,-0.12l-0.07,-0.22l-0.23,-0.07l-1.06,0.53l-0.75,-0.16l-0.12,-0.44l0.3,0.09l0.48,-0.08l0.31,-0.44l-0.21,-0.49l0.37,-0.49l0.83,0.04l0.43,-0.16l0.12,-0.35l-0.14,-0.42l-1.11,-0.64l0.09,-0.27l0.34,-0.17l0.38,-0.44l1.12,-0.0l0.23,-0.09l0.19,-0.32l0.03,-0.95l0.22,-0.54l0.07,-1.42l0.25,-0.45l-0.08,-0.58l0.07,-0.2l0.88,-0.74l0.02,-0.1l-0.09,-0.02l0.19,-0.16l-0.31,-0.35l-0.27,0.05l-0.04,-0.25l-0.09,-0.04l0.57,-0.22l0.33,-0.25l0.51,-0.1l0.24,-0.25l0.42,-0.0l0.19,0.18l0.41,0.08l0.29,-0.08l0.44,-0.55l-0.3,-0.34l-0.39,-0.07l-0.05,-0.33l-0.27,-0.31l-0.6,0.4l-0.43,-0.07l-1.12,0.62l-1.04,0.06l-0.34,0.18l-0.48,-0.03l-0.12,0.5l0.4,0.64l-0.26,0.19l-0.29,0.45l-0.19,-0.09l-0.17,-0.27l-0.76,-0.04l-1.16,-0.25l-0.81,-0.4l-1.05,-0.59l-0.78,-0.61l-0.52,-0.69l0.01,-0.21l0.6,-0.1l-0.06,-0.4l0.1,-0.24l-0.51,-1.06l0.1,-0.78l-0.18,-0.52l0.33,-0.54l-0.4,-0.34l-0.23,0.0l-0.44,-0.69l-0.01,-0.2l0.59,-0.14l0.3,-0.37l-0.05,-0.44l-0.36,-0.26l0.72,0.04l0.29,-0.13l0.18,-0.25l0.63,0.01l0.08,0.51l0.56,0.51l0.32,0.49l-0.03,0.09l-0.79,0.11l-0.53,0.51l0.31,0.45l0.94,-0.08l0.4,0.24l0.26,-0.01l0.39,-0.22l0.29,0.03l0.08,0.07l-0.51,0.6l-0.05,0.38l0.22,0.43l0.46,0.24l1.42,0.07l0.28,-0.17l0.16,-0.35l0.19,-0.08l-0.2,-0.74l0.35,-0.35l-0.02,-0.33l-0.18,-0.25l0.15,-0.43l-0.08,-0.13l-0.52,-0.26l-0.77,-0.01l-0.34,0.1l-1.51,-1.2l-0.01,-0.53l-0.35,-0.39l-0.26,-0.12l-0.15,-0.38l0.55,0.15l0.53,-0.4l-0.17,-0.41l-0.7,-0.51l0.4,-0.45l-0.14,-0.5l0.31,-0.15l0.27,0.08l0.44,-0.1l0.45,0.27l0.75,-0.04l0.67,-0.44l-0.08,-0.48l-0.18,-0.19l-0.48,-0.03l-0.51,0.16l-0.43,-0.19l-1.02,-0.02l-0.26,0.14l-0.44,0.04l-0.36,0.29l-0.62,0.09l-0.15,0.12l-0.15,0.42l-0.13,-0.19l0.27,-0.52l0.36,-0.24l-0.1,-0.44l-0.48,-0.6l0.03,-0.1l0.37,0.1l0.4,-0.18l0.16,-0.22l0.07,-0.36l-0.22,-0.6l0.55,0.23l0.42,-0.5l-0.44,-0.59l0.38,0.32l0.94,0.37l0.2,-0.44l0.14,0.01l-0.04,-0.54l0.12,-0.36l0.48,-0.28l0.49,0.01l1.96,-0.47l0.8,-0.03l0.3,0.25l-0.01,0.44l0.19,0.27l-0.27,0.16l0.13,0.47l0.35,0.15l0.74,0.01l0.29,-0.39l-0.13,-0.45l0.08,-0.34l1.21,-0.11l0.29,-0.63l-0.31,-0.24l-0.93,-0.04l0.03,-0.08l0.41,-0.03l0.15,-0.63l0.72,-0.27l0.86,0.88l0.32,0.11l0.38,-0.28l0.08,-0.27l-0.04,-0.41l-0.18,-0.26l0.34,0.0l0.69,0.32l0.35,0.31l0.54,0.81l-0.06,0.29l-0.38,-0.09l-0.52,0.21l-0.13,0.47l0.43,0.24l1.07,0.06l0.05,0.52l0.31,0.3l0.91,0.49l1.02,0.09l0.53,-0.18l0.41,0.17l0.49,-0.0l1.61,-0.32l0.1,0.49l1.67,0.97l0.28,0.31l0.53,0.32l1.06,0.37l1.81,-0.2l0.56,-0.21l0.47,-0.49l0.2,-0.57l0.15,-0.95l0.61,-1.1l0.01,-0.29l-0.24,-0.88l0.14,-0.05l-0.03,-0.19l0.58,0.25l0.2,-0.1l0.86,0.0l0.36,-0.17l0.41,-0.47l0.07,-0.93l-0.19,-0.43l0.22,-0.03l0.11,-0.44l-0.23,-0.32l-0.73,-0.39l-0.29,0.12l-0.43,-0.04l-0.52,0.2l-0.21,-0.12l-0.29,-0.6l-0.31,-0.29l-0.51,0.0l-0.02,0.1l-0.52,-0.04l-0.43,-0.31l-0.56,-0.02l-0.32,0.1l-1.04,-0.24l-0.48,0.03l-0.33,0.16l0.04,-0.42l-0.29,-0.71l-0.21,-0.97l-0.49,-0.23l-0.55,-0.08l-0.29,0.09l-0.47,-0.64l-0.48,-0.4l-0.5,-0.25l-1.14,-1.02l-0.95,-0.24l-0.2,-0.27l-0.49,-0.27l-0.11,-0.23l-0.63,-0.01l-0.04,0.13l-0.9,-1.22l-1.86,-2.14l-0.25,-0.55l-0.0,-0.32l0.07,-0.19l0.27,0.06l0.27,-0.13l0.35,-0.76l-0.41,-1.02l0.05,-0.11l0.4,0.19l0.51,-0.05l0.41,-0.17l0.51,0.66l0.43,0.23l0.48,-0.4l-0.02,-0.33l-0.32,-0.66l-0.48,-0.41l-0.46,-0.78l-0.84,-0.88l-0.12,-0.02l-0.98,-1.16l-0.33,-0.52l-0.04,-0.3l-0.46,-0.96l0.41,0.03l0.54,0.45l0.34,0.15l0.44,-0.1l0.12,-0.17l0.2,0.03l0.06,-0.15l0.18,0.03l0.17,0.41l0.2,0.18l1.09,0.35l1.08,-0.18l1.53,0.45l0.14,0.13l-0.06,0.06l0.19,0.45l0.88,0.89l1.03,0.47l0.56,-0.36l-0.06,-0.35l-0.37,-0.64l1.48,0.48l0.36,0.26l0.11,0.4l0.61,0.16l1.2,0.07l0.48,0.24l1.49,0.99l0.18,0.45l-0.34,0.04l-0.1,0.06l-0.4,0.34l-0.16,0.3l-0.6,-0.28l-0.52,-0.06l-0.12,0.69l0.62,0.52l0.02,0.52l0.16,0.37l0.28,0.32l0.91,0.59l0.18,0.29l0.46,0.4l0.69,0.3l0.39,0.29l-0.14,0.25l0.02,0.32l0.38,0.24l0.2,-0.05l0.26,0.12l0.44,0.49l0.56,0.16l0.39,0.46l-0.08,0.39l0.24,0.31l0.41,0.19l0.41,-0.15l0.03,-0.15l1.39,-0.46l0.24,0.52l0.24,0.25l-0.25,0.06l0.01,0.5l0.38,0.29l0.43,0.02l0.5,-0.24l0.36,-0.41l-0.05,-0.98l-0.45,-0.65l0.19,0.01l0.65,1.54l0.23,0.25l1.6,0.95l0.53,-0.01l0.29,-0.27l0.34,-0.59l-0.02,-0.44l0.3,-0.38l-0.16,-0.23l-0.72,-0.38l-0.44,-0.04l-0.49,-0.92l-0.89,-0.53l-0.42,-0.12l-0.61,0.21l-0.32,-0.28l-0.0,-0.43l-0.16,-0.19l-0.23,-0.71l0.64,-0.39l0.29,-0.02l0.35,0.29l0.32,0.05l0.37,-0.41l-0.0,-0.15l-0.75,-1.21l-1.13,-0.68l-0.06,-0.29l0.18,-0.28l-0.15,-0.48l-0.43,-0.23l-0.43,0.29l-0.42,0.07l-0.25,-0.44l-0.53,-0.4l-0.31,-0.1l-0.25,-0.41l-1.35,-1.4l0.59,-1.11l0.15,-1.07l-0.1,-1.05l-0.51,-1.13l-0.29,-1.11l-0.36,-0.48l-0.85,-2.25l-1.06,-1.45l-0.08,-0.73l-0.38,-0.89l0.17,-0.17l0.91,-0.32l1.04,-1.04l1.08,1.08l1.75,1.29l0.84,0.44l1.33,0.95l1.37,0.54l1.36,0.24l1.49,-0.09l0.3,0.11l0.42,-0.05l0.4,-0.16l0.23,-0.26l0.3,-0.14l0.42,-0.5l0.56,-0.03l0.17,-0.31l1.66,0.14l0.96,-0.29l0.5,0.12l0.03,0.15l0.87,0.52l0.35,0.13l0.52,-0.01l0.77,0.56l0.91,0.33l0.1,0.2l0.28,-0.04l0.42,0.16l1.99,0.27l-0.05,0.31l0.11,0.18l-0.18,0.06l-0.15,0.66l0.44,0.21l0.04,0.83l0.28,0.36l0.44,-0.14l0.1,-0.13l0.05,-0.46l0.22,-0.51l1.1,0.62l0.73,0.1l0.29,-0.35l-0.22,-0.39l-0.74,-0.5l-0.43,-0.14l-0.07,-0.18l0.03,-0.25l0.76,-0.07l0.26,0.1l0.01,0.3l0.27,0.62l0.54,0.33l0.14,-0.17l0.45,0.24l0.16,-0.08l0.63,0.55l1.13,0.63l0.13,-0.03l0.81,0.55l0.59,0.22l1.21,0.25l1.27,0.12l1.06,-0.17l1.19,0.0l0.01,0.22l0.26,0.49l0.68,0.48l0.08,0.62l0.56,0.17l0.57,0.45l-0.61,-0.02l-0.77,-0.42l-0.42,0.03l-0.44,0.21l0.1,0.48l0.23,0.26l-0.19,0.32l0.18,0.59l0.33,0.11l0.33,-0.12l0.64,0.36l0.3,0.06l0.31,-0.08l0.23,-0.23l0.33,-0.02l0.39,0.36l0.26,0.01l0.25,0.18l0.33,0.02l0.27,-0.16l0.13,0.09l0.16,0.38l-0.54,-0.04l-0.29,0.34l0.21,0.4l0.2,0.11l0.07,0.35l0.89,0.58l-0.04,0.13l0.18,0.3l0.49,0.21l0.94,-0.04l0.96,0.68l0.58,0.26l0.32,0.03l0.37,0.42l0.23,0.1l0.1,0.31l0.34,0.26l0.21,0.38l0.34,0.08l0.26,-0.12l0.25,0.23l-0.55,0.05l-0.29,0.34l-0.41,0.04l-0.18,0.63l0.35,0.33l1.4,0.72l-0.08,0.69l1.48,0.96l0.49,0.67l0.27,0.15l0.49,-0.16l1.05,0.48l0.24,-0.05l0.38,0.32l0.16,0.58l1.1,0.42l0.72,0.06l0.21,0.19l0.85,0.38l0.32,0.34l0.31,0.09l0.59,0.53l0.2,0.37l0.73,0.47l0.25,0.29l0.1,0.53l0.48,0.29l0.55,0.03l0.31,0.44l0.56,0.33l-0.11,0.34l0.39,0.41l1.66,1.19l0.76,0.36l0.16,-0.03l1.78,1.0l0.42,0.4l0.69,0.34l0.47,0.65l0.08,-0.08l-0.02,0.25l0.22,0.06l0.5,0.55l0.02,0.21l0.5,0.23l0.54,0.42l1.19,0.58l0.8,0.03l0.63,0.31l0.03,0.31l0.43,0.12l0.33,-0.2l0.19,-0.0l0.43,0.12l1.02,0.51l0.05,0.25l0.41,0.27l0.22,-0.19l0.58,0.53l0.31,0.09l0.53,0.55l-0.01,0.24l0.49,0.42l0.02,0.24l0.27,0.43l0.55,0.34l0.18,0.4l0.42,0.15l0.58,0.51l0.56,0.96l0.35,0.26l0.53,0.01l0.15,0.11l-23.69,51.51l0.09,0.46l1.53,1.4l0.52,0.02l0.19,-0.15l1.17,1.29l0.41,0.12l1.37,-0.4l1.79,0.68l-0.86,0.96l-0.08,0.38l0.35,1.01l0.91,0.92l-0.08,0.65l0.1,0.44l2.43,4.76l-0.2,1.48l-0.29,0.38l0.19,0.62l0.58,0.12l0.83,-0.25l0.54,-0.07l0.07,0.08l0.03,0.1l-0.66,0.3l-0.33,0.34l0.29,0.54l0.35,-0.0l0.37,-0.18l0.25,0.12l0.02,0.21l0.44,0.11l0.09,0.11l0.26,1.19l-0.17,0.03l-0.1,0.51l0.24,0.32l0.94,0.22l0.04,0.16l-0.27,0.18l0.01,0.12l0.21,0.32l0.21,0.09l-0.05,0.37l-0.24,-0.02l-0.1,-0.46l-0.35,-0.31l-0.11,0.06l-0.28,-0.47l-0.47,-0.03l-0.26,0.35l-0.45,0.01l-0.08,0.13l-0.26,-0.63l-0.14,0.01l-0.35,-0.41l-0.47,-0.12l-0.89,-1.43l0.11,-0.01l0.32,-0.49l-0.08,-0.26l-0.34,-0.28l-0.51,0.01l-0.47,-0.93l-0.05,-0.15l0.12,-0.53l-0.08,-0.41l-0.52,-1.06l-0.46,-0.7l-0.19,-0.07l0.1,-0.61l-0.29,-0.28l-0.72,-0.14l-1.24,-1.44l-0.27,-0.47l-0.01,-0.21l-0.32,-0.23l-0.24,-0.34l-0.28,-0.11l-0.49,-0.63l0.39,-0.11l0.12,-0.23l0.05,0.05l0.59,-0.3l-0.02,0.13l-0.16,0.06l-0.16,0.55l0.3,0.41l0.38,0.07l0.43,-0.3l0.25,-1.03l0.15,-0.22l0.42,0.2l0.36,0.46l0.36,0.04l0.35,-0.35l-0.47,-0.83l-0.69,-0.39l-0.27,-0.91l-0.35,-0.63l-0.4,-0.17l-0.67,0.44l-0.39,0.06l-0.79,0.37l-1.9,-0.05l-1.0,-0.5l-0.45,-0.34l-1.46,-1.5l0.23,-0.14l0.21,-0.32l0.16,-0.74l-0.43,-0.94l-0.52,-0.09l-0.33,0.19l-0.12,0.52l-0.6,-0.04l-0.85,-0.89l-2.81,-1.97l-1.68,-0.48l-1.62,-0.65l-1.13,-0.19l-0.1,-0.53l-0.27,-0.5l0.13,-0.25l-0.02,-0.26l-0.22,-0.25l-0.8,-0.28l-0.36,-0.35l-0.17,-0.01l-0.13,-0.55l-0.2,-0.34l-0.2,-0.12l0.7,-0.5l0.09,-0.27l-0.09,-0.08l0.21,-0.27l0.23,-0.09l0.38,0.08l0.38,-0.17l0.18,-0.32l-0.03,-0.34l-0.35,-0.22l-0.55,-0.07l-0.81,0.27l-0.24,0.2l-0.57,0.02l-0.56,0.35l-0.61,0.15l-0.2,-0.13l-0.19,-0.59l-0.58,-0.63l0.77,-0.37l0.19,-0.38l-0.32,-0.45l-0.53,-0.01l-0.15,-0.48l-0.19,-0.17l0.09,-0.49l-0.16,-0.25l0.04,-0.22l-0.31,-0.55l-0.43,-0.22l-0.53,0.17l-0.07,-0.2l-0.27,-0.03l-0.09,-0.14l0.22,-0.56l0.26,0.03l0.08,-0.09l0.65,0.37l0.38,0.07l0.42,-0.49l-0.14,-0.42l-0.27,-0.26l-1.05,-0.52l-1.54,0.27l-0.1,-0.21l-0.41,-0.3l-0.42,-0.01l-0.08,-0.23l-0.47,0.02l-0.21,-0.16l0.21,-0.26l-0.05,-0.39l0.14,-0.4l-0.28,-0.27l-0.25,-0.05l0.21,-0.77l-0.33,-0.28l-0.29,0.02l-1.36,0.57l0.02,-0.11l-0.34,-0.35l-1.19,-0.19l-0.14,0.25l-0.55,0.26l0.08,0.49l0.21,0.14l-0.01,0.1l-0.83,-0.27l-0.63,-0.03l-0.23,0.49l-0.51,0.38l0.12,0.52l0.31,0.16l0.46,-0.02l-0.05,0.11l-0.98,0.16l-0.3,0.14l-0.16,0.16l-0.05,0.46l0.37,0.28l0.83,-0.12l0.12,0.14l-0.04,0.25l0.31,0.21l-0.27,0.12l-0.15,0.24l-0.51,-0.02l-0.23,0.34l-0.3,0.12l0.05,0.54l-0.3,0.32l-0.12,-0.14l-0.66,0.24l-0.32,-0.27l-0.44,-0.13l-0.32,-0.39l0.11,-0.5l-0.38,-0.29l-0.64,0.04l0.13,-0.4l-0.05,-0.34l-0.23,-0.26l-0.26,-0.07l-0.4,0.16l-0.47,0.73l-0.25,-0.01l-0.23,-0.49l-0.46,-0.07l-0.37,0.4l-0.4,-0.06l-0.16,0.33l-0.29,-0.31l-0.42,-0.03l-0.26,0.25l-0.01,0.21l-0.31,-0.08l-0.11,-0.32l-0.12,-0.03l-0.37,0.06l-0.72,0.4l-0.01,-0.27l-0.13,-0.08l-0.8,-0.04l-0.38,0.2l-0.0,0.45l-0.09,0.05l-1.16,0.08l-0.3,0.13l-0.87,-0.77l-0.22,-0.05l-0.29,0.29l-0.4,-0.28l-1.02,-0.03l0.03,-0.13l-0.35,-0.39l-0.01,-0.13l0.45,0.02l0.16,-0.37l0.53,0.01l0.43,0.3l0.3,0.45l0.49,-0.04l0.2,-0.43l0.23,0.09l0.44,-0.04l0.48,-0.17l0.06,-0.15l0.45,-0.23l0.46,-0.08l0.32,-0.52l-0.21,-0.37l-0.49,-0.19l-1.84,0.04l-0.57,-0.71l-0.07,-0.28l1.28,-0.98l1.62,-0.44l0.37,-0.26l0.33,-0.45l0.46,-0.1l0.65,-0.89l0.14,-1.04l0.36,-0.03l0.74,0.3l1.54,-0.17l1.4,0.03l0.01,0.5l0.23,0.42l0.56,0.48l1.06,0.16l0.14,0.1l0.28,0.41l0.4,0.26l1.19,1.07l0.2,0.34l0.25,0.13l0.5,-0.37l0.0,-0.44l-0.13,-0.39l-0.42,-0.46l-0.43,-0.13l-0.32,-0.52l-0.43,-0.35l-0.69,-1.19l0.45,-0.11l0.44,-0.3l0.35,0.02l0.33,-0.17l1.56,0.33l0.37,-0.06l0.15,-0.62l-0.09,-0.11l-0.67,-0.46l-0.84,-0.3l-0.61,-0.04l-0.74,0.14l-0.37,0.19l-0.29,0.35l-0.76,-0.52l-0.11,-0.24l-0.42,-0.02l-0.16,-0.12l0.14,-0.2l-0.17,-0.67l-0.09,-0.02l-1.07,0.27l-0.85,-0.19l-0.49,0.0l-0.85,0.41l-0.65,-0.15l-0.6,-0.29l-1.18,0.04l-0.71,0.35l-0.19,0.5l-0.35,-0.15l-0.65,0.04l-0.5,0.24l-0.62,0.03l-0.54,0.15l-0.41,0.33l-0.12,0.36l-0.49,0.22l-0.59,-0.02l-0.4,-0.27l-0.26,-0.68l-0.43,-0.32l-0.3,-0.11l-0.42,0.02l-0.3,0.28l0.16,0.51l0.31,0.08l0.01,0.37l0.37,0.61l0.21,0.72l-0.38,0.08l-0.35,0.26l-0.33,-0.06l-0.56,-0.39l-0.98,-0.37l-0.58,0.21l0.02,0.44l-0.07,-0.38l-0.32,-0.34l-0.42,0.19l-0.23,0.4l-0.2,-0.38l-0.81,0.14l-0.08,0.05l-0.02,0.41l-0.37,-0.32l-0.33,-0.04l-0.36,0.28l0.13,0.39l-1.49,-0.27l-0.16,0.49l-0.25,0.14l-0.28,0.36l-0.51,0.04l-0.02,0.17l-0.2,0.09l0.03,0.42l-0.16,0.27l-0.01,0.39l0.33,0.34l0.59,-0.05l0.39,0.38l0.56,0.31l0.08,0.49l0.23,0.34l0.3,0.19l0.03,0.3l-0.64,0.54l-0.5,-0.05l-0.44,0.18l-0.88,-0.46l-0.37,0.02l-0.48,0.41l-0.2,-0.12l-0.45,-0.01l-0.34,0.59l-0.75,-0.12l-0.4,0.05l-0.27,0.3l-0.1,-0.02l0.07,0.06l-0.11,0.01l0.0,0.1l-0.42,-0.28l-0.36,0.33l-0.19,-0.1l-0.32,0.19l-0.3,-0.11l-0.37,0.07l-0.53,-0.44l-0.45,-0.15l-0.9,0.53l-0.18,-0.15l-0.71,-0.02l-0.45,0.28l-0.15,-0.37l-0.41,-0.28l-0.42,0.1l-0.43,0.49l-0.37,-0.15l-0.28,0.31l-0.47,-0.08l-0.4,-0.43l-0.4,0.07l-0.3,0.24l-0.14,-0.11l-0.43,-0.05l-0.14,0.08l-1.45,-0.04l-0.31,0.12l-0.22,0.28l0.24,0.95l-0.31,-0.03l-0.15,0.18l-0.69,-0.24l-0.41,-0.28l-0.26,0.05l-0.26,0.26l-0.2,-0.24l-0.49,0.22l-0.65,0.09l-0.32,-0.22l-0.27,0.2l-0.19,-0.65l-0.39,-0.22l-0.43,0.08l-0.28,0.31l-0.44,0.09l-0.26,-0.07l-0.14,0.34l-0.06,-0.31l-0.26,-0.25l-0.54,-0.14l-1.29,-0.05l-0.62,0.31l-0.42,-0.34l-0.51,-0.04l-0.84,0.27l-0.73,0.11l-0.16,0.12l-0.11,0.56l-0.26,-0.07l-0.44,0.3l-0.03,0.21l-0.23,0.15l-0.26,-0.25l-0.37,-0.03l-0.36,0.17l-0.6,-0.33l-0.87,-0.22l-0.41,-0.18l-0.09,-0.37l-0.55,-0.15l-0.25,0.15l-0.71,-0.67l-0.41,0.02l-0.78,-0.24l-0.4,0.21ZM111.25,502.71l-0.44,0.21l-0.03,-0.02l0.24,-0.26l0.23,0.07ZM128.45,468.26l-0.1,0.14l-0.06,0.02l0.02,-0.15l0.14,-0.02ZM191.55,470.09l-0.0,0.04l-0.02,-0.04l0.03,-0.01ZM191.85,541.2l-0.08,-0.21l0.06,-0.51l0.25,-0.06l0.08,0.39l-0.31,0.39ZM165.84,518.29l-0.19,0.37l-0.34,0.04l-0.07,0.31l-0.27,-0.07l-0.45,0.06l-0.04,-0.09l0.46,-0.29l0.06,-0.15l0.84,-0.19ZM162.12,521.34l0.09,0.0l-0.06,0.02l-0.02,-0.03ZM162.26,521.34l0.08,-0.02l0.01,0.04l-0.04,0.04l-0.05,-0.05ZM141.64,514.73l0.19,0.06l0.26,0.22l-0.46,0.03l-0.07,-0.12l0.08,-0.19ZM132.07,521.13l-0.0,0.0l0.0,-0.0l0.0,0.0ZM132.06,520.84l-0.02,-0.07l0.06,-0.01l-0.03,0.08ZM109.91,522.38l0.07,-0.02l0.05,0.12l-0.03,0.01l-0.09,-0.11ZM107.83,523.67l0.01,0.02l-0.02,0.0l0.0,-0.02l0.01,-0.01ZM136.02,515.64l-0.01,-0.04l0.07,0.01l-0.06,0.03ZM199.71,549.76l0.43,-0.06l0.87,0.3l0.36,-0.05l0.76,-0.54l0.39,-0.87l0.67,-0.03l0.47,-0.34l0.17,-0.49l0.96,0.19l1.89,-0.14l0.49,0.7l0.06,0.43l0.38,0.59l-0.1,0.26l-0.29,0.17l-0.1,0.55l0.11,0.16l-0.11,0.33l0.13,0.53l0.17,0.24l0.69,0.46l0.02,0.37l0.3,0.56l0.35,0.24l0.08,0.34l-0.15,0.26l0.26,1.28l1.33,1.5l0.24,0.78l-0.64,-0.19l-0.38,0.04l-0.33,0.37l-0.51,0.26l-0.01,0.29l-0.38,0.15l-0.21,0.29l-0.52,-0.98l-0.84,-0.64l0.11,-0.44l-0.27,-1.06l0.14,-0.11l0.26,-1.09l-0.26,-0.26l0.04,-0.09l-0.12,-0.01l0.04,-0.06l-0.09,0.05l-0.1,-0.1l-0.04,0.1l-0.12,-0.01l-0.03,-0.07l0.24,-0.92l0.1,-1.07l-0.15,-1.05l0.51,-0.94l0.02,-0.37l-0.66,-0.25l-0.5,0.69l-0.24,-0.13l-0.45,0.11l0.01,0.55l-0.32,0.35l0.3,1.04l-0.34,0.85l0.13,1.32l-0.11,0.36l0.04,0.39l-0.27,0.34l0.03,1.86l-0.28,0.29l-0.27,-0.31l0.02,-1.36l-0.28,-0.43l-0.53,0.1l-0.08,0.1l-0.88,-0.14l0.22,-0.05l0.2,-0.25l0.2,-0.91l-0.12,-0.1l-0.13,-1.06l0.88,0.13l0.45,-0.45l-0.11,-0.33l-0.74,-0.45l-0.23,0.1l0.0,-0.84l-0.33,-0.34l-0.31,-0.01l-0.29,0.56l-0.24,0.06l-0.27,0.41l0.12,0.13l-0.5,-0.23l0.24,-0.5l-0.28,-0.54l-0.29,-0.02l-0.18,-0.5l-0.47,-0.15l-0.19,0.31l-0.22,-0.47ZM201.64,551.89l0.21,0.2l-0.19,0.19l-0.03,-0.38ZM210.83,558.1l0.42,0.83l-0.23,0.38l0.09,0.66l0.47,1.27l0.06,1.07l0.15,0.48l-0.33,-0.38l-1.31,-0.73l-0.26,-0.05l0.19,-0.2l-0.17,-0.39l0.14,-0.1l0.31,-0.63l-0.47,-0.31l-0.27,0.01l-0.75,0.68l-0.11,-0.36l0.09,-0.18l-0.03,-0.41l0.26,-0.33l0.36,-0.19l0.16,-0.56l0.43,-0.42l0.36,0.09l0.44,-0.23ZM211.88,563.05l1.25,5.46l-0.54,0.45l0.03,0.64l0.81,0.55l-0.47,0.67l0.05,0.52l0.58,0.54l-0.08,0.3l0.06,0.48l-0.14,0.55l0.15,0.3l0.2,0.13l0.9,0.26l1.46,1.84l1.18,0.8l0.34,0.76l0.55,0.42l-0.01,0.53l0.1,0.24l0.78,0.58l0.49,0.11l0.03,0.16l-0.16,0.69l-0.68,0.46l-0.31,0.4l-0.04,0.78l-0.31,0.67l0.11,0.99l-0.15,0.54l0.03,0.33l-0.4,0.17l-1.34,1.4l-0.41,0.31l-0.48,0.16l-0.2,-0.13l-0.28,0.01l0.12,-0.5l-0.16,-0.42l-0.64,0.07l-0.08,0.17l-0.1,-0.51l0.24,-0.03l0.12,0.14l0.5,0.14l1.27,-0.81l0.75,-0.65l-0.23,-0.63l-0.48,0.07l0.01,-0.13l-0.37,-0.36l-0.54,0.12l0.59,-1.72l0.0,-0.38l0.15,-0.3l-0.06,-0.43l0.09,-0.51l-0.36,-0.24l-0.06,-0.35l-0.27,-0.49l0.49,-0.15l0.35,-0.35l0.18,-0.48l-0.43,-0.27l-0.43,0.08l-0.61,0.31l-0.45,0.04l-0.55,-0.29l-1.43,0.28l-0.59,-0.05l0.17,-0.09l0.2,-0.36l0.21,-0.85l0.32,0.02l0.81,0.41l0.31,0.03l0.71,-0.34l-0.07,-0.49l-0.33,-0.19l-0.4,0.02l-0.88,-0.43l0.03,-0.84l-0.23,-0.29l-0.46,-0.26l0.02,-0.43l-0.43,-0.61l0.27,-0.3l-0.16,-0.68l-0.35,-0.03l0.1,-0.07l0.01,-0.21l0.42,-0.17l0.22,-0.62l-0.38,-0.26l-0.67,0.18l-0.27,-0.29l-0.2,-0.32l-0.06,-0.35l0.33,-0.21l0.18,-1.04l-0.39,-0.3l-0.47,0.16l-0.17,-0.08l-0.29,-0.36l0.13,-0.2l-0.14,-0.35l-0.45,-0.27l1.08,-0.08l0.35,-0.42l-0.28,-0.52l-0.49,0.08l-0.44,-0.14l0.18,-0.32l-0.03,-0.32l-0.51,-0.26l0.04,-0.13l0.64,0.01l0.41,0.72l0.28,0.23l0.31,0.02l0.28,-0.15l0.04,-0.52l-0.24,-0.23l-0.1,-0.4l-0.37,-0.63l-0.78,-0.91l0.12,-0.39l1.23,0.83l0.52,-0.45ZM214.19,585.45l-0.17,0.68l-0.05,-0.01l0.09,-0.42l0.13,-0.25ZM215.44,583.76l-0.46,0.24l-0.25,-0.22l-0.63,0.14l0.05,-0.14l0.52,-0.28l0.76,0.25ZM211.63,577.78l-0.08,0.43l0.26,0.27l-0.46,0.4l-0.51,-0.23l-0.26,0.45l0.06,0.32l-0.15,-0.2l0.08,-0.67l0.25,-0.15l0.49,-0.04l0.32,-0.57ZM209.08,567.17l-0.25,-0.24l0.08,-0.14l0.49,0.2l-0.32,0.18ZM138.39,458.34l-0.47,-0.44l0.06,-0.45l0.41,0.27l0.0,0.62ZM108.63,500.59l-0.13,0.01l0.09,-0.03l0.04,0.02ZM211.75,580.86l0.58,-0.24l-0.2,0.44l0.02,0.52l-0.22,-0.23l-0.18,-0.5ZM212.61,580.43l0.18,-0.49l-0.1,-0.18l0.52,-0.05l0.31,-0.26l0.18,-0.36l0.14,-0.03l0.14,-0.52l0.57,-0.03l0.29,1.05l0.12,1.09l-0.15,0.19l0.03,0.12l-0.16,0.04l-0.27,0.73l-0.28,0.21l-0.2,-0.36l0.13,-1.47l-0.39,-0.42l-0.41,0.19l-0.18,0.46l-0.46,0.07ZM211.52,574.36l0.23,0.31l0.37,0.12l0.01,0.48l-0.14,0.07l-0.12,-0.08l-0.4,-0.44l-0.11,-0.22l0.15,-0.24ZM209.53,575.0l0.17,-0.21l0.28,-0.04l-0.06,0.38l0.09,0.09l0.27,0.14l0.34,0.0l0.41,0.28l0.04,0.12l-0.35,0.14l0.09,0.38l-0.06,0.17l-0.28,0.08l0.14,-0.47l-0.34,-0.41l-0.06,-0.25l-0.69,-0.39ZM210.36,574.41l0.1,-0.07l0.07,0.06l-0.0,0.01l-0.16,-0.0ZM209.54,571.91l0.03,-0.1l0.32,-0.15l0.14,-0.29l-0.04,-0.37l0.05,-0.1l0.34,1.01l-0.09,-0.09l-0.52,-0.06l-0.15,0.21l-0.08,-0.04ZM206.97,580.16l0.1,-0.52l-0.42,-0.36l0.1,-0.03l-0.05,-0.5l-0.28,-0.2l0.14,-0.17l0.28,-0.1l0.36,0.03l0.21,-0.67l-0.39,-0.23l-1.18,-0.03l-0.2,-0.17l0.19,-0.17l0.46,-0.05l0.67,-0.52l0.19,-0.54l-0.08,-0.32l-0.26,-0.01l0.23,-0.63l0.14,0.22l0.53,0.22l0.24,0.31l0.4,0.27l0.42,1.0l0.12,0.56l-0.14,0.62l-0.17,-0.03l-0.11,0.19l-0.32,0.19l0.02,0.34l-0.75,0.25l-0.08,0.43l0.07,0.45l0.56,-0.01l-0.02,0.13l0.38,0.45l0.22,-0.01l0.23,0.23l0.25,-0.06l0.21,0.38l-0.39,-0.07l-0.32,0.43l-0.06,0.32l0.22,0.37l0.41,0.04l0.21,0.09l-0.2,-0.03l-0.41,0.47l-0.47,0.15l0.11,0.7l0.38,0.27l-0.13,0.2l0.18,0.53l-0.2,0.06l-0.06,0.23l-0.22,-0.08l0.18,-0.35l-0.4,-1.09l0.11,-0.08l0.05,-0.73l-0.28,-0.13l-0.15,-0.32l0.01,-0.81l-0.21,-0.78l-0.46,-0.01l-0.11,0.08l-0.05,-0.39ZM207.26,574.01l-0.02,-0.27l-0.21,-0.27l0.29,-0.14l0.03,0.3l0.15,0.15l-0.04,0.21l-0.2,0.0ZM206.9,573.41l-0.43,-0.14l-0.38,-0.35l0.21,-0.11l0.28,0.14l0.04,0.28l0.27,0.18ZM208.72,573.09l0.26,-0.17l0.43,0.23l0.25,-0.0l-0.15,0.15l-0.09,0.37l-0.14,0.04l-0.23,-0.02l-0.33,-0.6ZM206.49,567.38l1.0,0.59l0.81,0.7l0.06,0.4l-0.46,0.04l-0.19,0.76l0.03,0.31l0.19,0.26l-0.17,0.31l0.43,0.76l-0.15,0.1l-0.85,-0.57l-0.44,0.12l-0.01,0.16l-0.22,-0.06l0.24,-0.51l-0.06,-0.27l0.08,0.03l0.08,-0.27l-0.06,-0.29l0.42,-0.7l0.08,-0.44l-0.28,-0.43l0.06,-0.22l-0.32,-0.31l-0.25,-0.5ZM208.6,569.24l0.34,0.07l0.2,-0.33l0.2,0.07l0.2,0.44l-0.0,0.19l-0.3,0.2l-0.13,0.86l-0.14,-0.44l-0.01,-0.6l-0.07,-0.17l-0.2,-0.03l-0.09,-0.25ZM209.57,569.66l0.0,-0.0l0.03,-0.02l-0.04,0.02ZM204.29,565.52l0.44,-0.15l-0.03,-0.36l0.29,-0.2l0.29,0.26l0.51,-0.3l-0.08,0.47l-0.15,0.23l-0.33,-0.04l-0.36,0.3l-0.27,-0.06l-0.16,0.09l0.02,0.12l-0.36,0.07l0.19,-0.44ZM206.36,564.27l-0.49,0.31l-0.02,-0.59l-0.46,-0.14l-0.02,-0.1l0.53,-0.05l0.24,-0.65l-0.35,-0.23l-0.51,-0.03l-0.1,-0.28l0.09,-0.84l0.2,-0.34l0.16,-0.72l0.07,-1.03l0.34,-0.33l0.69,0.17l0.26,0.31l-0.04,0.27l-0.16,0.12l0.03,0.24l-0.13,0.05l-0.05,0.65l-0.22,0.57l0.02,0.09l0.33,0.11l0.23,1.01l-0.15,0.27l0.43,0.45l-0.08,0.23l-0.57,-0.12l-0.09,0.19l-0.15,0.04l-0.01,0.39ZM206.15,574.28l-0.13,-0.03l0.0,-0.02l0.15,-0.04l-0.02,0.09ZM205.18,574.32l-0.02,0.0l0.01,-0.01l0.01,0.0ZM204.96,570.25l-0.05,-0.24l0.09,0.22l-0.04,0.01ZM205.25,569.02l-0.25,0.19l-0.3,-0.19l-0.18,-0.37l-0.42,-0.07l0.04,-0.08l0.41,0.09l0.15,-0.2l0.31,0.17l0.28,-0.13l0.03,0.52l-0.07,0.07ZM198.99,558.2l0.09,-0.07l0.23,0.49l-0.21,-0.07l-0.11,-0.35ZM199.36,558.71l0.38,0.44l0.56,-0.45l-0.44,-1.09l0.59,0.02l0.03,-0.77l0.24,0.32l0.51,0.01l0.2,-0.29l0.29,-0.06l0.19,0.34l0.24,0.12l0.18,0.27l-0.28,0.14l-0.69,-0.17l-0.13,0.26l-0.17,-0.1l-0.57,0.26l0.08,0.42l0.27,0.54l0.56,0.48l0.25,0.5l0.39,0.36l-0.12,0.15l0.09,0.44l-0.94,-1.32l-0.28,-0.2l-0.61,0.35l0.06,0.34l-0.2,0.14l0.2,0.7l0.21,0.07l-0.14,0.51l0.2,0.13l0.05,0.18l-0.28,0.06l-0.12,-0.56l-0.37,-0.57l0.25,-0.15l-0.16,-0.49l-0.21,-0.17l-0.02,-0.33l-0.28,-0.49l-0.01,-0.31ZM202.27,558.92l0.38,-0.28l0.43,-0.1l0.76,0.39l0.05,0.17l0.43,0.38l-0.11,0.18l-0.41,-0.45l-0.58,-0.11l-0.2,0.41l0.19,0.59l-0.97,-1.19ZM202.11,560.96l0.33,0.1l0.14,0.21l0.26,0.09l0.85,-0.01l-0.23,1.25l-0.31,-0.14l-1.03,-1.5ZM201.29,562.69l0.18,0.07l0.33,-0.09l0.0,0.25l0.48,0.21l0.22,0.28l-0.11,0.08l0.12,0.52l-0.05,0.29l0.23,0.34l-0.06,0.8l0.13,0.32l-0.1,0.03l-0.14,0.56l-0.14,0.99l0.02,0.73l-0.25,0.74l-0.22,-0.02l-0.19,0.34l-0.01,0.5l-0.44,1.06l-0.2,-0.86l-0.08,-0.92l0.3,-0.02l0.63,-0.49l-0.06,-0.73l-0.22,-0.05l0.02,-0.45l-0.19,-0.26l-0.25,-0.01l-0.16,-0.59l-0.47,-0.03l0.24,-0.17l0.01,-0.27l0.65,-0.05l0.22,-0.32l-0.13,-0.51l-0.53,-0.24l0.57,-0.27l-0.34,-1.16l-0.33,-0.12l0.28,-0.19l0.04,-0.3ZM199.27,560.14l0.0,0.0l-0.01,0.0l0.0,-0.0ZM199.1,564.31l0.25,-0.07l0.1,-0.06l-0.12,0.15l-0.23,-0.02ZM199.63,563.32l0.06,-0.2l-0.05,-0.13l0.09,0.13l-0.1,0.2ZM162.15,525.49l0.25,-0.21l0.11,-0.0l-0.2,0.31l-0.16,-0.1ZM136.7,524.68l0.22,0.25l0.59,-0.1l0.04,-0.44l0.61,0.38l0.29,-0.23l0.18,-0.67l0.1,-0.05l0.25,0.13l0.16,-0.06l-0.14,0.5l0.39,0.72l-0.5,0.38l-0.19,-0.72l-0.36,-0.02l-0.69,0.57l-0.12,-0.24l-0.46,0.06l-0.15,0.16l-0.22,-0.52l-0.13,-0.04l0.04,-0.14l0.07,0.07ZM139.88,525.13l-0.03,-0.01l0.02,-0.02l0.01,0.03ZM127.78,528.13l0.49,-0.13l0.09,0.05l-0.34,0.29l-0.18,0.01l-0.06,-0.22ZM128.01,526.82l0.09,-0.93l-0.34,-0.41l0.27,-0.06l0.19,-0.29l0.22,-0.02l0.24,-0.25l0.44,0.22l0.16,-0.11l0.5,0.1l0.1,-0.23l0.15,-0.03l0.38,0.09l0.25,0.25l-0.43,0.12l0.02,0.5l0.44,0.31l-0.25,0.64l0.13,1.11l0.36,0.59l0.43,0.15l-0.37,0.07l-0.19,0.39l-0.11,-0.05l0.03,-0.41l-0.23,-0.36l-0.69,-0.05l-0.43,-0.59l-0.47,-0.4l-0.65,-0.34l-0.26,-0.01ZM131.4,528.57l0.28,-0.39l-0.19,-0.6l0.07,-0.55l0.15,-0.28l0.3,0.13l0.31,-0.27l0.44,0.14l0.52,-0.02l0.3,-0.22l0.26,0.17l0.23,-0.03l0.19,0.33l0.66,-0.29l0.18,-0.29l0.28,0.22l-0.13,0.25l-0.0,0.39l0.26,0.35l0.46,-0.02l0.28,-0.39l0.28,0.18l0.44,-0.16l0.31,0.17l0.08,-0.05l-0.05,0.23l-0.73,0.21l-0.21,0.41l0.22,0.27l-0.07,0.65l0.3,0.23l0.29,0.05l-0.5,0.18l-0.19,-0.24l-0.3,-0.08l-0.09,-0.22l-0.26,-0.17l-0.13,-0.32l-0.96,-0.67l-0.23,0.18l-0.65,0.18l-0.19,0.27l0.12,0.28l-0.38,-0.39l-0.44,0.12l-0.19,0.46l-0.91,-0.26l-0.07,0.08l-0.35,-0.23ZM134.19,529.01l0.07,-0.02l0.09,0.03l-0.15,-0.01l-0.01,0.0ZM134.4,529.04l0.27,0.1l0.23,0.58l-0.25,-0.11l0.04,-0.1l-0.29,-0.47ZM135.83,526.14l0.09,-0.06l0.01,0.01l-0.11,0.04ZM132.89,525.47l-0.57,-0.58l0.11,-0.17l0.27,-0.08l0.34,0.07l0.08,0.37l-0.22,0.39ZM98.14,450.76l0.34,-0.44l0.56,-0.16l0.06,0.49l-0.13,0.02l0.1,0.29l0.7,0.54l0.29,0.6l0.36,0.4l-0.66,-0.36l-1.21,-0.26l-0.45,-0.8l0.04,-0.32ZM100.81,452.78l1.01,0.2l0.26,0.2l0.38,0.11l0.3,0.33l0.23,0.8l-0.26,0.19l-0.26,0.4l0.43,0.51l0.28,0.71l0.39,0.33l-0.09,0.31l0.05,0.32l0.21,0.31l0.5,0.32l0.0,0.35l-0.82,-0.26l-0.09,0.09l-0.51,-0.1l-0.33,0.07l-0.08,-0.93l-0.57,-1.1l0.12,-0.48l-0.3,-0.98l-0.39,-0.84l-0.28,-0.35l-0.01,-0.23l-0.17,-0.28ZM104.84,458.76l0.28,0.01l0.41,0.53l-0.25,0.05l-0.44,-0.59ZM96.98,478.79l0.06,-0.22l1.37,1.26l0.38,-0.0l0.32,-0.21l0.21,0.06l0.2,0.25l0.72,-0.01l-0.01,0.32l0.69,0.19l0.2,0.27l-0.05,0.32l0.09,0.16l0.27,0.29l0.49,0.19l0.07,0.2l-0.23,0.33l-0.32,0.22l-0.42,1.13l-0.7,-0.22l-0.36,-0.42l-0.19,0.11l-0.26,-0.08l-0.29,-0.35l-0.42,-0.13l-0.26,-0.41l-0.51,-0.41l-0.61,-1.56l0.07,-0.19l-0.47,-0.5l0.04,-0.31l-0.09,-0.3ZM97.68,522.17l0.05,-0.07l0.04,-0.11l0.07,0.18l-0.15,-0.01ZM98.03,522.39l0.04,0.02l-0.0,0.03l-0.03,-0.05ZM80.23,514.88l0.08,-0.15l0.69,0.24l0.38,-0.02l1.55,-0.69l0.18,0.0l0.16,0.37l0.44,0.39l0.27,0.08l0.4,-0.16l0.54,0.24l0.6,-0.01l0.53,0.26l0.44,0.41l0.03,0.72l-0.26,0.4l-0.13,0.44l-0.31,0.06l-0.22,0.21l-0.27,0.01l-0.3,-0.08l-0.46,-0.58l-1.38,-0.93l-0.45,-0.11l-0.76,0.03l-0.42,0.3l-0.21,0.03l-0.91,-0.42l-0.33,-0.34l0.14,-0.67ZM74.26,514.0l0.03,-0.25l0.32,0.05l0.02,0.35l-0.37,-0.15ZM64.81,513.23l0.09,-0.01l0.13,0.09l-0.17,0.0l-0.05,-0.08ZM70.29,514.35l-0.12,-0.05l-0.16,0.39l-0.25,-0.27l-0.36,0.08l0.24,-0.12l0.32,0.02l0.41,-0.61l-0.31,-0.35l-0.31,-0.63l-0.3,-0.24l0.05,-0.29l0.13,-0.06l0.67,0.13l0.43,0.28l0.16,0.24l-0.29,0.4l0.11,0.51l-0.06,0.17l-0.33,0.11l-0.04,0.31ZM68.8,514.2l-0.28,0.32l-0.09,-0.1l0.24,-0.29l-0.1,-0.27l0.19,-0.02l0.04,0.36ZM59.97,511.71l0.2,-0.13l0.18,-0.38l0.48,-0.06l0.27,0.03l0.13,0.21l0.36,0.14l0.1,0.15l-0.09,0.12l-0.23,-0.03l-0.61,0.18l-0.41,-0.22l-0.36,0.0ZM62.67,511.56l0.07,-0.35l0.28,-0.32l0.75,-0.02l0.67,0.35l0.17,0.49l-0.28,0.29l-1.25,-0.24l-0.41,-0.2ZM37.79,498.38l0.07,-0.23l-0.1,-0.23l0.32,0.03l0.09,0.49l-0.29,0.05l-0.1,-0.11ZM36.41,498.87l-0.02,0.01l0.01,-0.02l0.01,0.01ZM36.85,498.71l-0.0,-0.07l-0.0,-0.01l0.02,0.01l-0.01,0.07ZM30.2,493.17l-0.02,-0.03l0.04,-0.04l0.0,0.08l-0.02,-0.0ZM26.76,492.74l0.41,-0.33l0.12,0.35l-0.02,0.08l-0.25,0.01l-0.26,-0.12ZM25.01,490.83l0.02,0.0l-0.01,0.01l-0.02,-0.01ZM23.18,488.38l-0.09,0.01l0.05,-0.17l0.04,0.08l0.01,0.08ZM23.19,487.9l-0.06,0.1l-0.14,-0.54l0.19,0.18l0.0,0.26ZM15.95,478.85l0.25,0.07l-0.02,0.19l-0.14,-0.01l-0.09,-0.25ZM1.23,449.67l0.23,0.17l0.21,0.66l0.47,0.45l-0.25,0.16l0.12,0.39l-0.24,-0.38l-0.54,-0.19l-0.11,-0.3l0.19,-0.08l0.2,-0.42l-0.28,-0.47Z",
            name: "Alaska"
        },
        "US-NJ": {
            path: "M801.67,165.24l1.31,-1.55l0.48,-1.57l0.5,-0.62l0.54,-1.45l0.11,-2.05l0.68,-1.35l0.92,-0.71l14.12,4.17l-0.3,5.66l-0.51,0.83l-0.13,-0.3l-0.65,-0.07l-0.34,0.44l-0.56,1.46l-0.46,2.72l0.26,1.55l0.63,0.61l1.06,0.15l1.23,-0.43l2.46,0.29l0.66,1.87l-0.2,4.55l0.29,0.47l-0.54,0.44l0.27,0.81l-0.72,0.74l0.03,0.35l0.43,0.22l-0.21,0.6l0.48,0.6l-0.17,3.8l0.59,0.52l-0.36,1.36l-1.14,1.82l-0.11,0.94l-1.36,0.07l0.09,1.21l0.64,0.83l-0.82,0.56l-0.18,1.15l1.05,0.77l-0.31,0.29l-0.17,-0.44l-0.53,-0.18l-0.5,0.22l-0.44,1.51l-1.28,0.61l-0.2,0.45l0.46,0.55l0.8,0.06l-0.66,1.26l-0.26,1.5l-0.68,0.65l0.19,0.48l0.4,0.04l-0.89,1.57l0.07,0.95l-1.56,1.66l-0.17,-1.65l0.33,-2.07l-0.11,-0.87l-0.58,-0.82l-0.89,-0.28l-1.11,0.34l-0.81,-0.35l-1.51,0.88l-0.31,-0.71l-1.62,-0.96l-1.0,0.04l-0.65,-0.71l-0.7,0.07l-3.24,-2.03l-0.06,-1.72l-1.02,-0.94l0.48,-0.68l0.0,-0.88l0.43,-0.83l-0.12,-0.73l0.51,-1.19l1.2,-1.16l2.6,-1.49l0.54,-0.86l-0.38,-0.85l0.5,-0.37l0.47,-1.44l1.24,-1.7l2.52,-2.22l0.18,-0.67l-0.47,-0.82l-4.26,-2.78l-0.75,-1.05l-0.9,0.24l-0.48,-0.33l-1.24,-2.46l-1.62,-0.02l-1.0,-3.45l1.02,-1.03l0.36,-2.23l-1.87,-1.91Z",
            name: "New Jersey"
        },
        "US-ME": {
            path: "M837.04,56.27l0.86,-1.15l1.42,1.7l0.84,0.04l0.39,-2.12l-0.46,-2.19l1.7,0.36l0.73,-0.42l0.21,-0.52l-0.32,-0.7l-1.18,-0.47l-0.44,-0.62l0.19,-1.43l0.86,-2.02l2.08,-2.25l0.01,-0.98l-0.52,-0.93l1.02,-1.64l0.39,-1.51l-0.22,-0.91l-1.02,-0.35l-0.07,-1.42l-0.4,-0.43l0.55,-0.96l-0.04,-0.63l-1.0,-1.26l0.13,-1.73l0.37,-0.63l-0.15,-0.97l1.22,-1.93l-0.96,-6.17l5.58,-18.88l2.25,-0.23l1.15,3.18l0.55,0.43l2.54,0.56l1.83,-1.73l1.68,-0.83l1.24,-1.72l1.25,-0.12l0.64,-0.47l0.25,-1.43l0.42,-0.3l1.36,0.04l3.68,1.41l1.14,0.96l2.36,1.05l8.38,22.7l0.64,0.65l-0.25,0.95l0.72,1.02l-0.1,1.41l0.54,1.3l0.67,0.47l1.05,-0.12l1.12,0.58l0.97,0.1l2.47,-0.53l0.4,0.95l-0.59,1.42l1.69,1.86l0.28,2.69l2.72,1.68l0.98,-0.1l0.47,-0.74l-0.06,-0.5l1.21,0.25l2.95,2.8l0.04,0.47l-0.52,-0.14l-0.38,0.41l0.18,0.77l-0.76,-0.15l-0.35,0.4l0.15,0.63l1.84,1.62l0.16,-0.88l0.39,-0.17l0.8,0.32l0.27,-0.83l0.33,0.41l-0.31,0.85l-0.53,0.19l-1.21,3.24l-0.62,-0.04l-0.31,0.44l-0.55,-1.05l-0.72,0.03l-0.3,0.5l-0.56,0.06l-0.02,0.49l0.58,0.85l-0.91,-0.45l-0.32,0.63l0.26,0.52l-1.2,-0.28l-0.37,0.3l-0.37,0.78l0.08,0.45l0.44,0.08l0.07,1.21l-0.37,-0.57l-0.54,-0.06l-0.39,0.45l-0.2,1.09l-0.48,-1.53l-1.14,0.01l-0.68,0.75l-0.36,1.48l0.59,0.63l-0.83,0.63l-0.7,-0.46l-0.73,1.04l0.1,0.64l0.99,0.63l-0.35,0.21l-0.1,0.82l-0.45,-0.2l-0.85,-1.82l-1.03,-0.46l-0.39,0.22l-0.45,-0.41l-0.57,0.63l-1.25,-0.19l-0.26,0.86l0.78,0.4l0.01,0.37l-0.51,-0.06l-0.56,0.4l-0.09,0.69l-0.49,-1.02l-1.17,-0.02l-0.16,0.64l0.52,0.87l-1.44,0.96l0.84,1.11l0.08,1.06l0.53,0.65l-0.96,-0.41l-0.96,0.22l-1.2,-0.42l-0.17,-0.91l0.74,-0.28l-0.08,-0.55l-0.43,-0.5l-0.67,-0.12l-0.3,0.33l-0.23,-2.37l-0.37,-0.22l-1.1,0.26l0.04,1.96l-1.85,1.92l0.02,0.49l1.25,1.47l-0.64,0.96l-0.19,3.87l0.77,1.41l-0.57,0.53l0.0,0.63l-0.51,0.55l-0.8,-0.19l-0.45,0.93l-0.62,-0.06l-0.41,-1.15l-0.73,-0.21l-0.52,1.03l0.11,0.69l-0.45,0.59l0.12,2.41l-0.95,-1.01l0.14,-1.28l-0.24,-0.59l-0.81,0.29l-0.08,2.01l-0.44,-0.25l0.15,-1.55l-0.48,-0.4l-0.68,0.49l-0.76,3.04l-0.75,-1.84l0.07,-1.51l-0.77,0.05l-1.06,2.76l0.51,0.55l0.73,-0.25l0.91,2.04l-0.28,-0.59l-0.52,-0.23l-0.66,0.3l-0.07,0.64l-1.38,-0.1l-2.16,3.18l-0.53,1.86l0.29,0.6l-0.68,0.65l0.51,0.43l0.91,-0.21l0.37,0.92l-0.77,0.3l-0.2,0.39l-0.4,-0.04l-0.51,0.57l-0.14,1.03l0.67,1.37l-0.08,0.68l-0.79,1.29l-0.94,0.61l-0.41,1.07l-0.1,1.28l0.44,0.9l-0.4,2.81l-0.8,-0.33l-0.41,0.6l-1.02,-0.76l-0.57,-1.86l-0.93,-0.37l-2.36,-1.99l-0.76,-3.45l-13.25,-35.55ZM863.92,80.85l0.09,0.26l-0.08,0.23l0.03,-0.29l-0.04,-0.2ZM865.33,81.07l0.47,0.7l-0.04,0.47l-0.32,-0.25l-0.1,-0.93ZM867.67,77.93l0.43,0.83l-0.16,0.14l-0.42,-0.19l0.16,-0.77ZM877.04,64.5l-0.14,0.2l-0.03,-0.24l0.17,0.04ZM873.08,74.84l0.01,0.02l-0.03,0.03l0.01,-0.06ZM882.73,63.41l0.04,-1.17l0.41,-0.66l-0.18,-0.44l0.4,-0.5l0.62,-0.11l1.54,1.36l-0.49,0.65l-1.08,0.04l-0.27,0.43l0.57,1.3l-0.99,-0.18l-0.14,-0.57l-0.44,-0.16ZM879.31,65.98l0.61,0.41l-0.35,0.29l0.15,0.96l-0.39,-0.63l0.19,-0.53l-0.21,-0.5ZM878.07,70.51l0.09,-0.01l0.48,-0.08l-0.25,0.46l-0.32,-0.37Z",
            name: "Maine"
        },
        "US-MD": {
            path: "M740.69,219.66l-2.04,-10.06l19.85,-4.49l-0.66,1.29l-0.94,0.08l-1.55,0.81l0.16,0.7l-0.42,0.49l0.23,0.78l-1.04,0.09l-0.72,0.41l-1.48,0.03l-1.14,-0.39l0.21,-0.36l-0.3,-0.49l-1.11,-0.31l-0.47,1.8l-1.63,2.85l-1.37,-0.39l-1.03,0.62l-0.41,1.26l-1.6,1.93l-0.36,1.04l-0.88,0.45l-1.3,1.87ZM760.76,204.58l37.02,-9.15l8.22,26.4l0.48,0.26l8.48,-2.22l0.24,0.71l0.6,0.03l0.38,0.95l0.52,-0.05l-0.38,1.96l-0.12,-0.26l-0.47,0.06l-0.73,0.86l-0.17,2.7l-0.6,0.19l-0.36,0.71l-0.02,1.47l-3.64,1.51l-0.37,0.76l-2.25,0.43l-0.56,0.65l-0.3,-1.09l0.5,-0.31l0.87,-1.85l-0.4,-0.51l-0.45,0.12l0.08,-0.5l-0.44,-0.42l-2.29,0.63l0.3,-0.6l1.15,-0.83l-0.17,-0.69l-1.36,-0.18l0.38,-2.24l-0.18,-1.02l-0.91,0.16l-0.53,1.76l-0.34,-0.69l-0.62,-0.07l-0.44,0.47l-0.5,1.39l0.53,1.02l-2.87,-2.14l-0.43,-0.19l-0.61,0.36l-0.73,-0.76l0.37,-0.84l-0.04,-0.84l0.76,-0.6l-0.08,-1.35l2.08,0.1l0.89,-0.45l0.36,-0.9l-0.32,-1.42l-0.43,-0.05l-0.54,1.31l-0.39,0.09l-1.05,-0.72l0.06,-0.4l-0.52,-0.28l-0.55,0.23l-0.22,-0.68l-0.73,0.1l-0.12,0.28l0.07,-0.74l0.65,-0.01l0.49,-0.37l0.22,-1.04l-0.54,-0.55l-0.57,0.71l-0.2,-0.53l0.88,-0.87l-0.25,-0.65l-0.54,-0.08l-0.09,-0.48l-0.42,-0.27l-0.35,0.15l-0.66,-0.53l0.89,-0.8l-0.24,-1.03l0.94,-2.38l-0.17,-0.43l-0.46,0.02l-0.66,0.66l-0.56,-0.16l-0.61,0.95l-0.74,-0.6l0.49,-3.59l0.6,-0.52l0.06,-0.61l4.22,-1.21l0.12,-0.7l-0.51,-0.3l-2.38,0.43l0.76,-1.27l1.42,-0.05l0.35,-0.5l-0.99,-0.67l0.44,-1.9l-0.63,-0.32l-1.2,1.82l0.05,-1.5l-0.59,-0.34l-0.68,1.1l-1.62,0.67l-0.31,1.65l0.39,0.54l0.65,0.12l-1.45,1.92l-0.2,-1.64l-0.64,-0.42l-0.61,0.73l0.07,1.45l-0.85,-0.29l-1.16,0.64l0.02,0.71l1.01,0.27l-0.37,0.54l-0.83,0.22l-0.05,0.34l-0.44,-0.04l-0.35,0.64l1.15,1.2l-1.88,-0.67l-1.21,0.59l0.16,0.69l1.56,0.58l0.91,0.93l0.72,-0.12l0.56,0.75l-0.98,-0.07l-1.15,1.36l0.32,0.77l1.57,0.92l-0.67,0.12l-0.21,0.41l0.8,1.08l-0.32,0.56l0.32,0.97l0.58,0.45l-0.52,1.09l0.99,1.25l0.96,3.54l0.61,0.84l2.07,1.63l0.42,0.81l-0.58,0.17l-0.64,-0.75l-1.45,-0.31l-1.64,-1.26l-1.33,-3.16l-0.73,-0.68l-0.3,0.37l0.11,0.7l1.28,3.54l1.14,1.31l2.05,0.74l1.03,1.11l0.64,0.14l0.91,-0.36l-0.03,1.11l1.66,1.54l0.1,1.1l-0.89,-0.35l-0.51,-1.29l-0.63,-0.45l-0.45,0.04l-0.13,0.44l0.27,0.79l-0.67,0.09l-0.65,-0.82l-1.41,-0.67l-2.39,0.63l-0.7,-0.67l-0.71,-1.49l-1.26,-0.71l-0.46,0.14l0.01,0.48l1.13,1.84l-0.22,-0.08l-1.62,-1.2l-1.66,-2.28l-0.45,-0.02l-0.37,1.44l-0.32,-0.79l-0.74,0.2l-0.21,0.27l0.33,0.72l-0.11,0.56l-0.76,0.53l-0.94,-1.5l0.07,-1.68l0.76,-0.6l-0.19,-0.74l0.78,-0.47l0.21,-1.61l1.07,-1.03l-0.0,-1.03l-0.46,-0.86l1.27,-2.19l-0.14,-0.54l-2.72,-1.68l-0.56,0.14l-0.63,1.08l-1.87,-0.26l-0.52,-0.83l-1.11,-0.51l-2.41,0.07l-1.25,-0.91l0.61,-1.35l-0.4,-0.97l-1.19,-0.3l-0.89,-0.66l-2.69,0.07l-0.36,-0.23l-0.11,-1.26l-1.04,-0.6l0.09,-1.2l-0.51,-0.29l-0.49,0.19l-0.23,-0.64l-0.52,-0.13l0.26,-0.83l-0.45,-0.58l-0.69,-0.12l-1.81,0.67l-2.24,-1.27ZM790.04,212.1l1.14,0.18l0.3,0.17l-0.52,0.29l-0.93,-0.63ZM803.05,225.67l-0.02,0.33l-0.21,-0.15l0.23,-0.19ZM807.02,229.13l-0.16,0.3l-0.13,0.07l0.02,-0.24l0.26,-0.12ZM797.57,220.61l-0.06,0.01l-0.09,0.03l0.12,-0.07l0.03,0.02ZM797.24,220.74l-0.26,0.56l-0.18,0.12l0.15,-0.61l0.29,-0.07ZM795.94,216.76l-0.29,0.29l-0.72,-0.27l0.02,-0.33l0.26,-0.36l0.72,0.67ZM794.58,212.85l-0.34,0.78l-0.59,0.23l0.02,-1.48l0.92,0.47ZM802.18,228.89l0.1,-0.11l0.12,0.08l-0.22,0.03Z",
            name: "Maryland"
        },
        "US-AR": {
            path: "M498.73,376.99l-1.42,-38.01l-4.48,-23.98l37.68,-2.58l39.02,-3.58l0.8,1.6l1.01,0.7l0.11,1.77l-0.77,0.57l-0.22,0.94l-1.42,0.93l-0.29,1.04l-0.83,0.54l-1.19,2.59l0.02,0.7l0.53,0.26l10.94,-1.46l0.86,0.93l-1.18,0.37l-0.52,0.96l0.25,0.49l0.84,0.41l-3.6,2.7l0.02,0.84l0.83,1.04l-0.6,1.15l0.62,0.97l-1.42,0.74l-0.11,1.44l-1.45,2.09l0.12,1.64l0.91,3.1l-0.15,0.27l-1.08,-0.01l-0.33,0.26l-0.51,1.73l-1.52,0.95l-0.04,0.51l0.79,0.91l0.05,0.65l-1.11,1.21l-2.02,1.13l-0.21,0.62l0.43,1.0l-0.19,0.27l-1.23,0.03l-0.42,0.67l-0.32,1.89l0.47,1.57l0.02,3.08l-1.27,1.09l-1.54,0.13l0.23,1.49l-0.21,0.48l-0.93,0.25l-0.59,1.77l-1.49,1.19l-0.02,0.93l1.39,0.76l-0.03,0.7l-1.23,0.3l-2.24,1.23l0.03,0.67l0.99,0.82l-0.45,1.14l0.53,1.38l-1.09,0.62l-1.9,2.57l0.52,0.7l1.0,0.49l0.01,0.58l-0.98,0.29l-0.42,0.64l0.51,0.84l1.63,1.01l0.06,1.77l-0.59,0.98l-0.09,0.84l0.29,0.4l1.05,0.39l0.5,2.17l-1.09,1.01l0.06,2.11l-51.46,4.07l-0.83,-11.53l-1.18,-0.85l-0.9,0.16l-0.83,-0.35l-0.93,0.39l-1.22,-0.33l-0.57,0.72l-0.47,0.01l-0.49,-0.48l-0.82,-0.15l-0.63,-1.0Z",
            name: "Arkansas"
        },
        "US-MA": {
            path: "M877.65,135.84l1.07,-0.19l0.85,-1.13l0.45,0.58l-1.06,0.64l-1.31,0.1ZM831.87,132.65l-0.46,-0.28l-10.4,2.53l-0.25,-0.18l-0.27,-14.8l29.99,-7.86l1.53,-1.8l0.34,-1.48l0.95,-0.35l0.61,-1.04l1.3,-1.08l1.23,-0.08l-0.44,1.05l1.36,0.55l-0.16,0.61l0.44,0.83l1.0,0.36l-0.06,0.32l0.39,0.28l1.31,0.19l-0.16,0.56l-2.52,1.87l-0.05,1.07l0.45,0.16l-1.11,1.41l0.23,1.08l-1.01,0.96l0.58,1.41l1.4,0.45l0.5,0.63l1.36,-0.57l0.33,-0.59l1.2,0.09l0.79,0.47l0.23,0.68l1.78,1.37l-0.07,1.25l-0.36,0.29l0.11,0.61l1.58,0.82l1.19,-0.14l0.68,1.2l0.22,1.14l0.89,0.68l1.33,0.41l1.48,-0.12l0.43,0.38l1.05,-0.23l3.35,-2.76l0.39,-0.69l0.54,0.02l0.56,1.86l-3.32,1.52l-0.94,0.82l-2.75,0.98l-0.49,1.65l-1.94,1.27l-0.81,-2.53l0.11,-1.35l-0.55,-0.31l-0.5,0.39l-0.93,-0.11l-0.3,0.51l0.25,0.92l-0.26,0.79l-0.4,0.06l-0.63,1.1l-0.6,-0.2l-0.5,0.48l0.22,1.86l-0.9,0.87l-0.63,-0.8l-0.47,0.01l-0.11,0.55l-0.26,0.03l-0.7,-2.02l-1.02,-0.35l0.44,-2.5l-0.21,-0.4l-0.77,0.4l-0.29,1.47l-0.69,0.2l-1.4,-0.64l-0.78,-2.12l-0.8,-0.22l-0.78,-2.15l-0.49,-0.24l-6.13,2.0l-0.3,-0.15l-14.84,4.19l-0.28,0.5ZM860.89,110.08l-0.02,-0.37l-0.14,-0.48l0.51,0.23l-0.35,0.62ZM876.37,122.8l-0.42,-0.66l0.06,-0.05l0.44,0.67l-0.09,0.05ZM875.46,121.25l-0.86,-0.11l-0.94,-1.42l1.44,1.0l0.36,0.54ZM871.54,119.46l-0.06,0.25l-0.35,-0.2l0.13,0.02l0.29,-0.07ZM871.87,135.18l0.01,-0.02l0.01,0.04l-0.02,-0.02ZM867.18,137.63l0.78,-0.56l0.28,-1.17l0.84,-1.19l0.17,0.26l0.46,-0.11l0.34,0.52l0.71,-0.01l0.19,0.38l-2.11,0.73l-1.34,1.31l-0.33,-0.17Z",
            name: "Massachusetts"
        },
        "US-AL": {
            path: "M608.66,337.47l25.17,-2.91l19.4,-2.75l14.04,43.3l0.79,1.4l0.22,1.05l1.17,1.59l0.59,1.87l2.24,2.5l0.92,1.8l-0.11,2.13l1.8,1.13l-0.17,0.74l-0.63,0.1l-0.16,0.7l-0.98,0.84l-0.22,2.29l0.25,1.48l-0.77,2.3l-0.14,1.84l1.1,2.94l1.21,1.52l0.53,1.6l-0.08,5.02l-0.25,0.81l0.48,2.03l1.35,1.16l1.14,2.07l-47.65,6.92l-0.42,0.61l-0.08,2.99l2.64,2.75l2.0,0.97l-0.34,2.7l0.56,1.6l0.43,0.39l-0.94,1.69l-1.24,1.0l-1.13,-0.75l-0.34,0.49l0.66,1.46l-2.82,1.05l0.29,-0.64l-0.45,-0.86l-0.99,-0.77l-0.1,-1.11l-0.57,-0.22l-0.53,0.61l-0.32,-0.1l-0.89,-1.53l0.41,-1.67l-0.97,-2.21l-0.46,-0.45l-0.86,-0.2l-0.3,-0.89l-0.56,-0.17l-0.37,0.61l0.14,0.35l-0.77,3.1l-0.01,5.08l-0.59,0.0l-0.24,-0.71l-2.22,-0.44l-1.65,0.31l-5.46,-31.99l-0.99,-66.49l-0.02,-0.37l-1.07,-0.63l-0.69,-1.02Z",
            name: "Alabama"
        },
        "US-MO": {
            path: "M468.68,225.54l24.71,-0.73l18.94,-1.43l22.11,-2.58l0.42,0.35l0.39,0.91l2.43,1.65l0.29,0.74l1.21,0.87l-0.51,1.37l-0.1,3.21l0.78,3.65l0.95,1.44l0.03,1.59l1.11,1.37l0.46,1.55l4.96,4.1l1.06,1.69l4.93,3.31l0.7,1.15l0.27,1.62l0.5,0.82l-0.18,0.69l0.47,1.8l0.97,1.63l0.77,0.73l1.04,0.16l0.83,-0.56l0.84,-1.4l0.57,-0.19l2.41,0.61l1.68,0.76l0.84,0.77l-0.97,1.95l0.26,2.28l-2.37,6.86l0.01,1.02l0.7,1.92l4.67,4.05l1.99,1.05l1.46,0.09l1.66,1.31l1.91,0.8l1.51,2.11l2.04,0.83l0.42,2.96l1.72,2.9l-1.1,1.94l0.18,1.38l0.75,0.33l2.31,4.25l1.94,0.92l0.55,-0.32l0.0,-0.65l0.87,1.1l1.07,-0.08l0.14,1.85l-0.37,1.07l0.53,1.6l-1.07,3.86l-0.51,0.07l-1.37,-1.13l-0.65,0.13l-0.78,3.34l-0.52,0.74l0.13,-1.06l-0.56,-1.09l-0.97,-0.2l-0.74,0.63l0.02,1.05l0.53,0.66l-0.04,0.7l0.58,1.34l-0.2,0.4l-1.2,0.39l-0.17,0.41l0.15,0.55l0.86,0.84l-1.71,0.37l-0.14,0.62l1.53,1.97l-0.89,0.75l-0.63,2.13l-10.61,1.42l1.06,-2.28l0.87,-0.61l0.18,-0.87l1.44,-0.96l0.25,-0.96l0.63,-0.37l0.29,-0.59l-0.22,-2.28l-1.05,-0.75l-0.2,-0.77l-1.09,-1.18l-39.24,3.61l-37.72,2.58l-3.21,-58.2l-1.03,-0.63l-1.2,-0.02l-1.52,-0.73l-0.19,-0.93l-0.76,-0.59l-0.34,-0.71l-0.36,-1.55l-0.55,-0.09l-0.3,-0.56l-1.13,-0.66l-1.4,-1.84l0.73,-0.51l0.09,-1.24l1.12,-1.27l0.09,-0.79l1.01,0.16l0.56,-0.43l-0.2,-2.24l-1.02,-0.74l-0.32,-1.1l-1.17,-0.01l-1.31,0.96l-0.81,-0.7l-0.73,-0.17l-2.67,-2.35l-1.05,-0.28l0.13,-1.6l-1.32,-1.72l0.1,-1.02l-0.37,-0.36l-1.01,-0.18l-0.59,-0.85l-0.84,-0.26l0.07,-0.53l-1.24,-2.88l-0.0,-0.74l-0.4,-0.49l-0.85,-0.29l-0.05,-0.54ZM583.77,294.59l-0.1,-0.1l-0.08,-0.15l0.11,-0.01l0.07,0.26Z",
            name: "Missouri"
        },
        "US-MN": {
            path: "M439.34,42.76l26.81,-1.05l0.34,1.46l1.28,0.84l1.79,-0.5l1.05,-1.43l0.78,-0.31l2.13,2.19l1.71,0.28l0.31,1.2l1.83,1.4l1.79,0.48l2.64,-0.41l0.39,0.85l0.67,0.4l5.12,0.01l0.37,0.23l0.54,1.59l0.71,0.61l4.27,-0.78l0.77,-0.65l0.07,-0.69l2.43,-0.79l3.97,-0.02l1.42,0.7l3.39,0.66l-1.01,0.79l0.0,0.82l1.18,0.54l2.23,-0.16l0.52,2.08l1.58,2.29l0.71,0.05l1.03,-0.78l-0.04,-1.73l2.67,-0.46l1.43,2.17l2.01,0.79l1.54,0.18l0.54,0.57l-0.03,0.83l0.58,0.35l1.32,0.06l0.38,0.83l1.43,-0.19l1.12,0.22l2.22,-0.85l2.78,-2.55l2.49,-1.54l1.24,2.52l0.96,0.51l2.23,-0.66l0.87,0.36l5.98,-1.3l0.56,0.18l1.32,1.64l1.24,0.59l0.62,-0.01l1.61,-0.83l1.35,0.08l-0.93,1.03l-4.69,3.07l-6.35,2.82l-3.68,2.48l-2.15,2.49l-0.95,0.58l-6.63,8.66l-0.95,0.61l-1.08,1.56l-1.96,1.96l-4.17,3.55l-0.86,1.79l-0.55,0.44l-0.14,0.96l-0.78,-0.01l-0.46,0.51l0.98,12.22l-0.79,1.2l-1.05,0.08l-0.52,0.82l-0.83,0.15l-0.61,0.83l-2.06,1.19l-0.94,1.86l0.06,0.72l-1.69,2.39l-0.01,2.06l0.38,0.91l2.15,0.39l1.42,2.49l-0.52,1.92l-0.71,1.25l-0.05,2.12l0.45,1.32l-0.71,1.23l0.91,3.14l-0.51,4.08l3.95,3.03l3.02,0.4l1.89,2.25l2.87,0.5l2.45,1.93l2.39,3.59l2.64,1.8l2.09,0.09l1.07,0.71l0.88,0.1l0.82,1.36l1.03,0.45l0.23,0.39l0.28,2.03l0.68,1.3l0.39,4.82l-40.63,3.2l-40.63,2.09l-1.46,-38.98l-0.7,-1.27l-0.83,-0.78l-2.57,-0.79l-0.94,-1.91l-1.46,-1.79l0.21,-0.68l2.83,-2.34l0.97,-2.12l0.4,-2.44l-0.35,-1.58l0.23,-1.58l-0.18,-1.79l-0.5,-1.03l-0.18,-2.33l-1.81,-2.59l-0.47,-1.13l-0.21,-2.16l-0.66,-0.98l0.15,-1.66l-0.35,-1.52l0.53,-2.69l-1.08,-1.85l-0.49,-8.33l-0.42,-0.79l0.06,-3.92l-1.58,-3.96l-0.53,-0.65l-0.4,-1.37l0.05,-1.19l-0.48,-0.53l-1.36,-3.77l0.0,-3.22l-0.47,-1.97l0.27,-1.12l-0.57,-2.32l0.73,-2.56l-2.06,-6.9ZM468.97,33.61l1.22,0.46l0.99,-0.2l0.33,0.45l-0.05,1.72l-1.78,1.12l-0.15,-0.47l-0.4,-0.14l-0.16,-2.95Z",
            name: "Minnesota"
        },
        "US-CA": {
            path: "M2.95,175.4l0.78,-1.24l0.46,0.46l0.59,-0.08l0.52,-1.18l0.8,-0.86l1.3,-0.26l0.56,-0.53l-0.15,-0.71l-0.93,-0.32l1.53,-2.79l-0.3,-1.58l0.14,-0.87l2.04,-3.3l1.31,-3.03l0.36,-2.12l-0.28,-1.0l0.16,-3.11l-1.36,-2.16l1.18,-1.38l0.67,-2.53l32.73,8.13l32.58,7.34l-13.67,64.68l25.45,34.66l36.6,51.1l13.3,17.72l-0.19,2.73l0.73,0.94l0.21,1.71l0.85,0.63l0.81,2.56l-0.07,0.91l0.63,1.46l-0.16,1.36l3.8,3.82l0.01,0.5l-1.95,1.53l-3.11,1.26l-1.2,1.99l-1.72,1.14l-0.33,0.81l0.38,1.03l-0.51,0.51l-0.1,0.9l0.08,2.29l-0.6,0.72l-0.64,2.44l-2.02,2.47l-1.6,0.14l-0.42,0.51l0.33,0.89l-0.59,1.34l0.54,1.12l-0.01,1.19l-0.78,2.68l0.57,1.02l2.74,1.13l0.34,0.83l-0.19,2.4l-1.18,0.78l-0.42,1.37l-2.27,-0.62l-1.25,0.6l-43.38,-3.34l0.17,-1.15l0.67,-0.51l-0.17,-1.06l-1.17,-1.38l-1.04,-0.15l0.23,-1.2l-0.28,-1.07l0.78,-1.33l-0.3,-4.25l-0.6,-2.3l-1.92,-4.07l-3.56,-4.07l-1.29,-1.98l-2.42,-2.11l-2.04,-3.01l-2.22,-0.89l-0.94,0.3l-0.39,0.96l-0.62,-0.73l-0.88,-0.22l-0.15,-0.31l0.61,-0.76l0.17,-1.57l-0.44,-2.06l-1.01,-1.95l-1.0,-0.74l-4.44,-0.19l-3.33,-1.81l-1.36,-1.26l-0.7,-0.12l-1.02,-1.19l-0.44,-2.6l-0.97,-0.47l-1.68,-2.31l-2.19,-1.73l-1.24,-0.41l-1.66,0.37l-1.15,-1.01l-1.25,0.03l-2.48,-1.83l-1.06,0.01l-1.49,-0.69l-4.91,-0.52l-1.12,-2.35l-1.43,-0.76l1.34,-2.45l-0.25,-1.36l0.74,-1.99l-0.63,-1.35l1.27,-2.45l0.33,-2.44l-0.99,-1.24l-1.26,-0.23l-1.4,-1.28l0.41,-1.62l0.79,-0.09l0.25,-0.45l-0.47,-2.2l-0.65,-0.77l-1.47,-0.84l-1.78,-3.97l-1.82,-1.25l-0.36,-2.75l-1.61,-2.58l0.07,-1.39l-0.33,-1.26l-1.16,-0.94l-0.74,-2.95l-2.41,-2.69l-0.55,-1.25l-0.02,-4.63l0.59,-0.57l-0.59,-1.14l0.51,-0.59l0.53,0.61l0.78,-0.02l0.84,-0.81l0.56,-1.33l0.8,0.04l0.21,-0.88l-0.43,-0.27l0.47,-1.19l-1.22,-3.68l-0.62,-0.48l-1.05,0.08l-1.93,-0.51l-1.04,-1.06l-1.89,-3.21l-0.8,-2.28l0.86,-2.39l0.09,-1.11l-0.27,-2.38l-0.32,-0.64l-0.54,-0.24l0.25,-1.19l0.69,-1.07l0.24,-2.71l0.47,-0.64l0.88,0.13l0.18,0.94l-0.7,2.13l0.05,1.15l1.18,1.32l0.55,0.1l0.58,1.28l1.16,0.78l0.4,1.01l0.89,0.41l0.83,-0.21l-0.21,-1.45l-0.65,-0.43l-0.18,-0.58l-0.24,-3.57l-0.56,-0.71l0.26,-0.69l-1.48,-1.06l0.5,-1.07l0.09,-1.06l-1.2,-1.58l0.78,-0.74l0.79,0.06l1.24,-0.73l1.25,1.02l1.87,-0.32l5.55,2.41l0.61,-0.09l0.64,-1.38l0.69,-0.04l1.92,2.53l0.25,0.18l0.63,-0.24l0.02,-0.38l-0.39,-0.93l-1.57,-1.89l-1.66,-0.32l0.27,-0.62l-0.28,-0.54l-0.48,0.09l-1.05,1.01l-1.84,-0.22l-0.43,0.28l-0.15,-0.51l-1.05,-0.4l0.24,-1.05l-0.85,-0.47l-1.0,0.28l-0.6,0.84l-1.09,0.4l-1.35,-0.9l-0.39,-0.88l-1.51,-1.44l-0.58,0.03l-0.64,0.61l-0.92,-0.12l-0.48,0.36l-0.33,1.88l0.21,0.78l-0.76,1.36l0.36,0.65l-0.47,0.59l-0.04,0.69l-2.16,-2.89l-0.44,-0.15l-0.25,0.32l-0.73,-1.0l-0.21,-1.03l-1.2,-1.17l-0.4,-1.05l-0.61,-0.18l0.65,-1.48l0.11,0.95l0.76,1.49l0.44,0.25l0.33,-0.38l-1.45,-5.21l-1.08,-1.42l-0.31,-2.68l-2.5,-2.87l-1.8,-4.48l-3.05,-5.54l1.09,-1.7l0.25,-1.97l-0.46,-2.11l-0.14,-3.61l1.34,-2.92l0.7,-0.74l-0.07,-1.54l0.42,-1.53l-0.41,-1.63l0.11,-1.96l-1.41,-4.06l-0.97,-1.15l0.06,-0.8l-0.42,-1.19l-2.91,-4.03l0.51,-1.35l-0.21,-2.69l2.23,-3.44ZM31.5,240.45l-0.06,0.1l-0.34,0.04l0.21,-0.05l0.19,-0.09ZM64.32,351.64l0.27,0.13l0.19,0.18l-0.31,-0.18l-0.15,-0.13ZM65.92,352.88l1.32,0.84l0.76,1.73l-0.89,-0.66l-1.14,0.03l-0.05,-1.94ZM62.72,363.08l1.36,2.08l0.57,0.53l-0.46,0.06l-0.83,-0.79l-0.65,-1.88ZM43.54,333.81l0.88,0.73l1.37,0.36l1.36,1.0l-2.82,-0.18l-0.71,-0.58l0.24,-0.66l-0.32,-0.67ZM47.89,335.89l0.94,-0.5l0.32,0.36l-0.37,0.14l-0.88,-0.0ZM46.05,352.4l0.29,-0.06l0.95,0.92l-0.61,-0.17l-0.64,-0.69ZM37.57,334.04l2.57,0.16l0.2,0.74l0.6,0.45l-1.21,0.64l-1.17,-0.1l-0.49,-0.44l-0.5,-1.44ZM34.94,332.37l0.06,-0.02l0.05,0.06l-0.01,-0.0l-0.1,-0.04Z",
            name: "California"
        },
        "US-IA": {
            path: "M452.9,162.25l42.83,-2.19l40.56,-3.19l0.96,2.52l2.0,1.0l0.08,0.59l-0.9,1.8l-0.16,1.04l0.9,5.09l0.92,1.26l0.39,1.75l1.46,1.72l4.95,0.85l1.27,2.03l-0.3,1.03l0.29,0.66l3.61,2.37l0.85,2.41l3.84,2.31l0.62,1.68l-0.31,4.21l-1.64,1.98l-0.5,1.94l0.13,1.28l-1.26,1.36l-2.51,0.97l-0.89,1.18l-0.55,0.25l-4.56,0.83l-0.89,0.73l-0.61,1.71l-0.15,2.56l0.4,1.08l2.01,1.47l0.54,2.65l-1.87,3.25l-0.22,2.24l-0.53,1.42l-2.88,1.39l-1.02,1.02l-0.2,0.99l0.72,0.87l0.2,2.15l-0.58,0.23l-1.34,-0.82l-0.31,-0.76l-1.29,-0.82l-0.29,-0.51l-0.88,-0.36l-0.3,-0.82l-0.95,-0.68l-22.3,2.61l-15.13,1.17l-7.59,0.51l-20.78,0.47l-0.22,-1.06l-1.3,-0.73l-0.33,-0.67l0.58,-1.16l-0.21,-0.95l0.22,-1.39l-0.36,-2.19l-0.6,-0.73l0.07,-3.65l-1.05,-0.5l0.05,-0.91l0.71,-1.02l-0.05,-0.44l-1.31,-0.56l0.33,-2.54l-0.41,-0.45l-0.89,-0.16l0.23,-0.8l-0.3,-0.58l-0.51,-0.25l-0.74,0.23l-0.42,-2.81l0.5,-2.36l-0.2,-0.67l-1.36,-1.71l-0.08,-1.92l-1.78,-1.54l-0.36,-1.74l-1.09,-0.94l0.03,-2.18l-1.1,-1.87l0.21,-1.7l-0.27,-1.08l-1.38,-0.67l-0.42,-1.58l-0.45,-0.59l0.05,-0.63l-1.81,-1.82l0.56,-1.61l0.54,-0.47l0.73,-2.68l0.0,-1.68l0.55,-0.69l0.21,-1.19l-0.51,-2.24l-1.33,-0.29l-0.05,-0.73l0.45,-0.56l-0.0,-1.71l-0.95,-1.42l-0.05,-0.87Z",
            name: "Iowa"
        },
        "US-MI": {
            path: "M612.24,185.84l1.83,-2.17l0.7,-1.59l1.18,-4.4l1.43,-3.04l1.01,-5.05l0.09,-5.37l-0.86,-5.54l-2.4,-5.18l0.61,-0.51l0.3,-0.79l-0.57,-0.42l-1.08,0.55l-3.82,-7.04l-0.21,-1.11l1.13,-2.69l-0.01,-0.97l-0.74,-3.13l-1.28,-1.65l-0.05,-0.62l1.73,-2.73l1.22,-4.14l-0.21,-5.34l-0.77,-1.6l1.09,-1.15l0.81,-0.02l0.56,-0.47l-0.27,-3.49l1.08,-0.11l0.67,-1.43l1.19,0.48l0.65,-0.33l0.76,-2.59l0.82,-1.2l0.56,-1.68l0.55,-0.18l-0.58,0.87l0.6,1.65l-0.71,1.8l0.71,0.42l-0.48,2.61l0.88,1.42l0.73,-0.06l0.52,0.56l0.65,-0.24l0.89,-2.26l0.66,-3.52l-0.08,-2.07l-0.76,-3.42l0.58,-1.02l2.13,-1.64l2.74,-0.54l0.98,-0.63l0.28,-0.64l-0.25,-0.54l-1.76,-0.1l-0.96,-0.86l-0.52,-1.99l1.85,-2.98l-0.11,-0.73l1.72,-0.23l0.74,-0.94l4.16,2.0l0.83,0.13l1.98,-0.4l1.37,0.39l1.19,1.04l0.53,1.14l0.77,0.49l2.41,-0.29l1.7,1.02l1.92,0.09l0.8,0.64l3.27,0.45l1.1,0.78l-0.01,1.12l1.04,1.31l0.64,0.21l0.38,0.92l-0.16,0.54l-0.66,-0.25l-0.94,0.57l-0.23,1.83l0.81,1.29l1.6,0.99l0.69,1.37l0.65,2.26l-0.12,1.73l0.77,5.57l-0.14,0.6l-0.57,0.2l-0.48,0.96l-0.75,0.08l-0.79,0.81l-0.17,4.47l-1.12,0.49l-0.18,0.82l-1.86,0.43l-0.73,0.6l-0.58,2.61l0.26,0.45l-0.21,0.52l0.25,2.58l1.38,1.31l2.9,0.84l0.91,-0.07l1.08,-1.23l0.6,-1.44l0.62,0.19l0.38,-0.24l1.01,-3.59l0.6,-1.06l-0.08,-0.52l0.97,-1.45l1.39,-0.39l1.07,-0.69l0.83,-1.1l0.87,-0.44l2.06,0.59l1.13,0.7l1.0,1.09l1.21,2.16l2.0,5.91l0.82,1.6l1.03,3.71l1.49,3.63l1.27,1.73l-0.33,3.93l0.45,2.49l-0.48,2.79l-0.34,0.44l-0.24,-0.33l-0.31,-1.71l-1.46,-0.52l-0.47,0.08l-1.48,1.36l-0.06,0.83l0.55,0.67l-0.83,0.57l-0.29,0.79l0.28,2.94l-0.49,0.75l-1.62,0.92l-1.06,1.85l-0.43,3.73l0.27,1.55l-0.33,0.93l-0.42,0.19l0.02,0.91l-0.64,0.3l-0.37,1.08l-0.52,0.52l-0.5,1.28l-0.02,1.05l-0.52,0.78l-20.37,4.25l-0.14,-0.86l-0.46,-0.33l-31.6,4.74ZM621.47,115.87l0.0,-0.07l0.12,-0.12l-0.01,0.03l-0.11,0.16ZM621.73,114.95l-0.07,-0.16l0.07,-0.14l-0.0,0.3ZM543.48,88.04l4.87,-2.38l3.55,-3.62l5.77,-1.36l1.39,-0.84l2.36,-2.71l0.97,0.04l1.52,-0.73l1.0,-2.25l2.82,-2.84l0.23,1.72l1.85,0.59l0.05,1.45l0.66,0.14l0.51,0.6l-0.17,3.14l0.44,0.95l-0.34,0.47l0.2,0.47l0.74,-0.02l1.08,-2.21l1.08,-0.9l-0.42,1.15l0.59,0.45l0.82,-0.67l0.52,-1.22l1.0,-0.43l3.09,-0.25l1.51,0.21l1.18,0.93l1.54,0.44l0.47,1.05l2.31,2.58l1.17,0.55l0.53,1.55l0.73,0.34l1.87,0.07l0.73,-0.4l1.07,-0.06l0.52,-0.65l0.88,-0.43l1.0,1.11l1.1,0.64l1.02,-0.25l0.68,-0.82l1.87,1.06l0.64,-0.34l1.65,-2.59l2.81,-1.89l1.7,-1.65l0.91,0.11l3.27,-1.21l5.17,-0.25l4.49,-2.72l2.56,-0.37l-0.01,3.24l0.29,0.71l-0.36,1.1l0.67,0.85l0.66,0.11l0.71,-0.39l2.2,0.7l1.14,-0.43l1.03,-0.87l0.66,0.48l0.21,0.71l0.85,0.22l1.27,-0.8l0.95,-1.55l0.66,-0.02l0.84,0.75l1.98,3.78l-0.86,1.04l0.48,0.89l0.47,0.36l1.37,-0.42l0.58,0.46l0.64,0.04l0.18,1.2l0.98,0.87l1.53,0.52l-1.17,0.68l-4.96,-0.14l-0.53,0.29l-1.35,-0.17l-0.88,0.41l-0.66,-0.76l-1.63,-0.07l-0.59,0.47l-0.07,1.22l-0.49,0.75l0.38,2.05l-0.92,-0.22l-0.89,-0.92l-0.77,-0.13l-1.96,-1.65l-2.41,-0.6l-1.6,0.04l-1.04,-0.5l-2.89,0.47l-0.61,0.45l-1.18,2.52l-3.48,0.73l-0.58,0.77l-2.06,-0.34l-2.82,0.93l-0.68,0.83l-0.56,2.51l-0.78,0.28l-0.81,0.87l-0.65,0.28l0.16,-1.96l-0.75,-0.91l-1.02,0.34l-0.76,0.92l-0.97,-0.39l-0.68,0.17l-0.37,0.4l0.1,0.83l-0.73,2.01l-1.2,0.59l-0.11,-1.38l-0.46,-1.06l0.34,-1.69l-0.17,-0.37l-0.66,-0.17l-0.45,0.58l-0.6,2.12l-0.22,2.57l-1.12,0.91l-1.26,3.02l-0.62,2.66l-2.56,5.33l-0.69,0.74l0.12,0.91l-1.4,-1.28l0.18,-1.75l0.63,-1.69l-0.41,-0.81l-0.62,-0.31l-1.36,0.85l-1.16,0.09l0.04,-1.29l0.81,-1.45l-0.41,-1.34l0.3,-1.09l-0.58,-0.98l0.15,-0.83l-1.9,-1.55l-1.1,-0.06l-0.59,-0.44l-0.86,0.2l-0.62,-0.2l0.3,-1.36l-0.94,-1.45l-1.13,-0.51l-2.23,-0.1l-3.2,-0.71l-1.55,0.59l-1.43,-0.42l-1.62,0.17l-4.56,-1.94l-15.37,-2.5l-2.0,-3.4l-1.88,-0.96l-0.76,0.26l-0.1,-0.3ZM603.38,98.65l-0.01,0.52l-0.46,0.32l-0.7,1.39l0.08,0.57l-0.65,-0.58l0.91,-2.16l0.83,-0.06ZM643.87,87.47l1.99,-1.52l0.17,-0.57l-0.27,-0.64l1.05,0.16l0.8,1.24l0.81,0.19l-0.27,1.08l-0.36,0.19l-1.5,-0.34l-0.77,0.45l-1.63,-0.24ZM635.6,77.64l0.56,-0.83l0.52,0.05l-0.37,1.32l0.11,0.71l-0.35,-0.9l-0.46,-0.35ZM636.53,79.17l0.09,0.14l0.01,0.01l-0.02,-0.01l-0.08,-0.14ZM637.39,81.25l0.4,0.45l0.22,0.61l-0.63,-0.71l0.01,-0.34ZM633.73,93.13l1.41,0.25l0.36,-0.18l0.4,0.21l-0.17,0.52l-0.75,0.11l-1.24,-0.9ZM618.85,96.77l0.62,2.25l-0.8,0.78l-0.39,-0.27l0.56,-2.76ZM613.26,110.83l0.47,0.3l-0.09,0.57l-0.45,-0.69l0.06,-0.17ZM612.23,113.57l0.0,-0.03l0.02,-0.04l-0.03,0.07ZM599.41,82.64l-0.23,-0.37l0.03,-0.4l0.37,0.32l-0.17,0.45ZM570.51,72.75l-0.51,-0.27l-1.16,0.06l-0.04,-1.56l1.0,-1.03l1.17,-2.09l1.84,-1.49l0.63,-0.0l0.53,-0.58l2.08,-0.89l3.34,-0.42l1.1,0.66l-0.54,0.38l-1.31,-0.12l-2.27,0.78l-0.15,0.29l0.3,0.59l0.71,0.13l-1.19,0.98l-1.4,1.89l-0.7,0.29l-0.36,1.45l-1.15,1.37l-0.66,2.04l-0.67,-0.87l0.75,-0.97l0.14,-1.95l-0.63,-0.37l-0.21,0.15l-0.6,0.92l-0.05,0.67ZM558.28,58.21l0.75,-0.98l-0.39,-0.33l0.56,-0.53l4.62,-2.98l1.97,-1.72l0.62,-0.18l-0.45,0.65l0.1,0.79l-0.43,0.49l-4.25,2.56l-0.86,0.99l0.24,0.36l-1.87,1.17l-0.61,-0.28Z",
            name: "Michigan"
        },
        "US-GA": {
            path: "M654.05,331.71l22.02,-3.57l20.65,-3.86l-1.48,1.42l-0.51,1.68l-0.66,0.82l-0.41,1.73l0.11,1.23l0.82,0.78l1.84,0.8l1.03,0.12l2.7,2.03l0.84,0.24l1.9,-0.37l0.6,0.25l0.8,1.64l1.51,1.6l1.04,2.5l1.33,0.82l0.84,1.16l0.56,0.26l1.0,1.77l1.07,0.3l1.17,0.99l3.81,1.85l2.41,3.16l2.25,0.58l2.53,1.67l0.5,2.34l1.25,1.02l0.47,-0.16l0.31,0.49l-0.1,0.62l0.79,0.73l0.79,0.09l0.56,1.21l4.99,1.89l0.4,1.78l1.54,1.73l1.02,2.01l-0.07,0.81l0.49,0.69l0.11,1.24l1.04,0.79l1.17,0.17l1.25,0.62l0.28,0.53l0.57,0.23l1.12,2.56l0.76,0.57l0.08,2.68l0.77,1.48l1.38,0.9l1.52,-0.27l1.44,0.76l1.45,0.11l-0.59,0.78l-0.56,-0.35l-0.47,0.28l-0.4,0.99l0.62,0.91l-0.38,0.48l-1.38,-0.16l-0.77,-0.55l-0.65,0.44l0.26,0.71l-0.49,0.52l0.36,0.61l0.94,-0.04l0.5,0.29l-0.58,1.35l-1.43,0.27l-1.33,-0.44l-0.44,0.39l0.34,0.85l1.23,0.35l-0.5,0.87l0.23,0.35l-0.2,0.64l0.83,0.64l-0.33,0.44l-0.72,-0.13l-0.96,0.51l-0.1,0.62l1.09,0.45l0.05,0.95l0.48,-0.07l1.2,-1.17l-0.92,2.31l-0.31,-0.58l-0.59,-0.08l-0.44,0.72l0.29,0.7l0.98,0.83l-2.32,0.04l-0.92,-0.28l-0.63,0.3l0.06,0.63l0.55,0.34l2.76,0.24l1.07,0.66l-0.02,0.34l-0.56,0.22l-0.88,1.95l-0.5,-1.41l-0.45,-0.13l-0.6,0.33l-0.15,0.84l0.34,0.96l-0.6,0.11l-0.03,0.84l-0.3,0.16l0.07,0.46l1.33,1.15l-1.09,1.03l0.32,0.47l0.77,0.07l-0.39,0.92l0.06,0.88l-0.46,0.51l1.1,1.66l0.03,0.76l-0.79,0.33l-2.64,-0.17l-4.06,-0.96l-1.31,0.35l-0.18,0.74l-0.68,0.26l-0.35,1.25l0.28,2.08l0.95,1.36l0.13,4.25l-1.97,0.4l-0.54,-0.92l-0.12,-1.3l-1.33,-1.82l-49.22,5.14l-0.72,-0.56l-0.86,-2.7l-0.94,-1.51l-0.56,-0.38l0.16,-0.68l-0.73,-1.51l-1.82,-1.81l-0.43,-1.75l0.25,-0.8l0.06,-5.18l-0.6,-1.81l-1.19,-1.47l-1.03,-2.65l0.12,-1.65l0.78,-2.36l-0.25,-1.53l0.19,-2.11l1.62,-1.33l0.46,-1.47l-0.55,-0.61l-1.42,-0.69l0.09,-2.15l-0.97,-1.87l-2.18,-2.42l-1.03,-2.81l-0.75,-0.68l-0.17,-0.96l-0.77,-1.37l-13.99,-43.12ZM745.21,389.83l0.7,-0.26l-0.07,0.82l-0.29,-0.33l-0.34,-0.24ZM743.75,406.73l0.05,0.87l-0.01,0.46l-0.34,-0.56l0.3,-0.76Z",
            name: "Georgia"
        },
        "US-AZ": {
            path: "M128.39,384.21l0.44,-1.81l1.29,-1.29l0.54,-1.11l0.48,-0.25l1.66,0.62l0.96,-0.03l0.52,-0.46l0.28,-1.17l1.31,-1.0l0.24,-2.73l-0.46,-1.24l-0.84,-0.66l-2.07,-0.67l-0.3,-0.61l0.8,-2.4l0.0,-1.39l-0.52,-1.2l0.57,-0.86l-0.2,-0.87l1.57,-0.27l2.29,-2.81l0.65,-2.43l0.65,-0.81l0.02,-3.17l0.55,-0.62l-0.29,-1.43l1.71,-1.14l1.03,-1.85l3.16,-1.29l2.03,-1.58l0.26,-0.53l-0.13,-1.04l-3.25,-3.49l-0.51,-0.22l0.22,-1.26l-0.66,-1.46l0.07,-0.91l-0.88,-2.76l-0.84,-0.56l-0.19,-1.65l-0.69,-0.8l0.19,-3.54l0.58,-0.87l-0.3,-0.86l1.04,-0.4l0.4,-1.42l0.14,-3.2l-0.76,-3.66l0.47,-0.88l0.29,-1.67l-0.4,-3.0l0.85,-2.56l-0.8,-1.87l-0.03,-0.92l0.43,-0.52l0.34,-1.35l2.54,-0.63l1.75,0.99l1.43,-0.19l0.96,2.24l0.79,0.71l1.54,0.14l1.01,-0.5l1.02,-2.27l0.94,-1.19l2.57,-16.95l42.43,5.78l42.56,4.67l-11.82,123.66l-36.89,-4.05l-36.34,-18.98l-28.44,-15.56Z",
            name: "Arizona"
        },
        "US-MT": {
            path: "M166.3,57.31l0.69,-0.1l0.33,-0.38l-0.9,-1.99l0.83,-0.96l-0.39,-1.3l0.09,-0.96l-1.24,-1.93l-0.24,-1.49l-1.03,-1.33l-1.19,-2.44l3.53,-20.65l43.66,6.71l43.06,5.23l42.75,3.84l43.15,2.53l-3.53,86.06l-28.11,-1.47l-26.82,-1.91l-26.78,-2.4l-25.84,-2.79l-0.44,0.35l-1.22,10.41l-1.51,-2.01l-0.03,-0.91l-1.19,-2.35l-1.25,-0.74l-1.8,0.92l0.03,1.05l-0.72,0.42l-0.34,1.56l-2.42,-0.41l-1.91,0.57l-0.92,-0.85l-3.36,0.09l-2.38,-0.96l-1.68,0.58l-0.84,1.49l-4.66,-1.6l-1.3,0.37l-1.12,0.9l-0.31,0.67l-1.65,-1.4l0.22,-1.43l-0.9,-1.71l0.4,-0.36l0.07,-0.62l-1.17,-3.08l-1.45,-1.25l-1.44,0.36l-0.21,-0.64l-1.08,-0.9l-0.41,-1.37l0.68,-0.61l0.2,-1.41l-0.77,-2.38l-0.77,-0.35l-0.31,-1.58l-1.51,-2.54l0.23,-1.51l-0.56,-1.26l0.34,-1.4l-0.73,-0.86l0.48,-0.98l-0.21,-0.74l-1.14,-0.75l-0.13,-0.59l-0.85,-0.91l-0.8,-0.4l-0.51,0.37l-0.07,0.74l-0.7,0.27l-1.13,1.22l-1.75,0.37l-1.21,1.07l-1.08,-0.85l-0.64,-1.01l-1.06,-0.44l0.02,-0.86l0.74,-0.63l0.24,-1.06l-0.61,-1.6l0.9,-1.09l1.07,-0.08l0.83,-0.8l-0.26,-1.14l0.38,-1.07l-0.95,-0.81l-0.04,-0.81l0.66,-1.28l-0.59,-1.07l0.74,-0.07l0.38,-0.42l-0.04,-1.77l1.83,-3.73l-0.14,-1.05l0.89,-0.62l0.6,-3.17l-0.78,-0.5l-1.8,0.37l-1.33,-0.11l-0.64,-0.55l0.37,-0.83l-0.62,-0.97l-0.66,-0.23l-0.72,0.35l-0.07,-0.95l-1.74,-1.63l0.04,-1.84l-1.68,-1.82l-0.08,-0.69l-1.55,-2.88l-1.07,-1.29l-0.57,-1.63l-2.35,-1.34l-0.95,-1.95l-1.44,-1.19Z",
            name: "Montana"
        },
        "US-MS": {
            path: "M555.49,431.1l0.67,-0.97l-1.05,-1.76l0.18,-1.63l-0.81,-0.87l1.69,-0.25l0.47,-0.54l0.4,-2.74l-0.77,-1.82l1.56,-1.79l0.25,-3.58l0.74,-2.26l1.89,-1.25l1.15,-1.97l1.4,-1.04l0.34,-0.78l-0.04,-0.99l-0.63,-0.96l1.14,-0.28l0.96,-2.59l0.91,-1.31l-0.16,-0.86l-1.54,-0.43l-0.35,-0.96l-1.83,-1.04l-0.07,-2.14l-0.93,-0.74l-0.45,-0.84l-0.02,-0.37l1.14,-0.29l0.47,-0.69l-0.26,-0.89l-1.41,-0.49l0.23,-1.77l0.98,-1.54l-0.77,-1.06l-1.08,-0.31l-0.15,-2.82l0.9,-0.54l0.23,-0.8l-0.62,-2.52l-1.25,-0.66l0.7,-1.33l-0.07,-2.22l-2.02,-1.52l1.14,-0.47l0.12,-1.41l-1.34,-0.89l1.58,-2.04l0.93,-0.31l0.36,-0.69l-0.52,-1.56l0.42,-1.35l-0.9,-0.89l1.6,-0.83l1.24,-0.27l0.59,-0.77l-0.09,-1.07l-1.41,-0.95l1.39,-1.08l0.62,-1.77l0.5,0.11l0.45,-0.28l0.34,-0.98l-0.2,-0.77l1.48,-0.43l1.22,-1.21l0.07,-3.53l-0.46,-1.53l0.36,-1.78l0.73,0.09l0.68,-0.33l0.42,-0.87l-0.41,-1.06l2.72,-1.71l0.58,-1.06l-0.29,-1.28l36.45,-4.1l0.86,1.26l0.85,0.45l0.99,66.5l5.52,32.95l-0.73,0.69l-1.53,-0.3l-0.91,-0.94l-1.32,1.06l-1.23,0.17l-2.17,-1.26l-1.85,-0.19l-0.83,0.36l-0.34,0.44l0.32,0.41l-0.56,0.36l-3.96,1.66l-0.05,-0.5l-0.96,-0.52l-1.0,0.04l-0.59,1.0l0.76,0.61l-1.59,1.21l-0.32,1.28l-0.69,0.3l-1.34,-0.06l-1.16,-1.86l-0.08,-0.89l-0.92,-1.47l-0.21,-1.01l-1.4,-1.63l-1.16,-0.54l-0.47,-0.78l0.1,-0.62l-0.69,-0.92l0.21,-1.99l0.5,-0.93l0.66,-2.98l-0.06,-1.23l-0.43,-0.29l-34.66,3.41Z",
            name: "Mississippi"
        },
        "US-SC": {
            path: "M697.56,324.11l4.86,-2.69l1.02,-0.05l1.11,-1.38l3.93,-1.9l0.45,-0.88l0.63,0.22l22.71,-3.36l0.07,1.22l0.42,0.57l0.71,0.01l1.21,-1.3l2.82,2.54l0.46,2.48l0.55,0.52l19.74,-3.49l22.74,15.07l0.02,0.55l-2.48,2.18l-2.44,3.67l-2.41,5.72l-0.09,2.74l-1.08,-0.21l0.85,-2.73l-0.64,-0.23l-0.76,0.87l-0.56,1.38l-0.11,1.55l0.84,0.95l1.05,0.23l0.44,0.91l-0.75,0.08l-0.41,0.56l-0.87,0.02l-0.24,0.68l0.94,0.45l-1.1,1.13l-0.07,1.02l-1.34,0.63l-0.5,-0.61l-0.5,-0.08l-1.07,0.87l-0.56,1.76l0.43,0.87l-1.2,1.23l-0.61,1.44l-1.2,1.01l-0.9,-0.4l0.27,-0.6l-0.53,-0.74l-1.38,0.31l-0.11,0.43l0.36,0.77l-0.52,0.03l0.05,0.76l0.72,0.58l1.3,0.43l-0.12,0.39l-0.88,0.94l-1.22,0.23l-0.25,0.51l0.33,0.45l-2.3,1.34l-1.42,-0.85l-0.56,0.11l-0.11,0.67l1.19,0.78l-1.54,1.57l-0.72,-0.75l-0.5,0.52l-0.0,0.74l-0.69,-0.37l-0.85,-0.0l-1.34,-0.84l-0.45,0.5l0.16,0.53l-1.73,0.17l-0.44,0.37l-0.06,0.77l0.65,0.23l1.43,-0.17l-0.26,0.55l0.42,0.25l1.91,-0.15l0.11,0.22l-0.97,0.86l-0.32,0.78l0.57,0.49l0.94,-0.53l0.03,0.21l-1.12,1.09l-0.99,0.43l-0.21,-2.04l-0.69,-0.27l-0.22,-1.55l-0.88,-0.15l-0.31,0.58l0.86,2.7l-1.12,-0.66l-0.63,-1.0l-0.4,-1.76l-0.65,-0.2l-0.52,-0.63l-0.69,0.0l-0.27,0.6l0.84,1.02l0.01,0.68l1.11,1.83l-0.02,0.86l1.22,1.17l-0.62,0.35l0.03,0.98l-1.2,3.56l-1.52,-0.78l-1.52,0.26l-0.97,-0.68l-0.54,-1.03l-0.17,-2.93l-0.86,-0.75l-1.06,-2.47l-1.04,-0.95l-3.23,-1.33l-0.49,-2.65l-1.12,-2.17l-1.43,-1.58l-0.06,-1.07l-0.76,-1.21l-4.82,-1.69l-0.58,-1.27l-1.21,-0.37l0.02,-0.7l-0.53,-0.87l-0.87,0.0l-0.73,-0.61l0.03,-1.21l-0.66,-1.26l-2.7,-1.78l-2.16,-0.52l-2.36,-3.12l-3.93,-1.93l-1.22,-1.03l-0.83,-0.12l-1.05,-1.81l-0.51,-0.22l-0.91,-1.21l-1.18,-0.68l-0.99,-2.42l-1.54,-1.65l-1.02,-1.87l-1.06,-0.37l-1.93,0.37l-0.46,-0.16l-2.75,-2.19l-1.06,0.02l-1.7,-0.74l-0.52,-0.53l0.36,-2.22l0.64,-0.78l0.34,-1.39l1.36,-1.23l0.4,-0.98ZM750.38,375.27l0.73,-0.08l0.51,0.45l-1.23,1.9l0.28,-1.22l-0.3,-1.06Z",
            name: "South Carolina"
        },
        "US-RI": {
            path: "M859.15,133.1l0.33,0.01l1.02,2.65l-0.31,0.56l-1.04,-3.22ZM858.41,136.77l-0.28,-0.34l0.24,-1.5l0.41,1.53l-0.37,0.31ZM851.13,141.49l0.22,-0.46l-0.53,-2.22l-3.14,-10.0l5.61,-1.84l0.76,2.06l0.8,0.25l0.19,0.73l0.08,0.41l-0.77,0.25l0.03,0.29l0.51,1.45l0.59,0.5l-0.6,0.15l-0.46,0.73l0.87,0.97l-0.14,1.22l0.94,2.18l-0.32,2.08l-1.33,0.23l-3.15,2.19l-0.16,-1.21ZM855.93,131.57l0.26,0.1l0.01,0.09l-0.17,-0.08l-0.1,-0.11ZM857.32,132.24l0.23,0.48l-0.2,0.31l-0.04,-0.39l0.01,-0.4ZM855.92,145.03l0.11,0.11l-0.18,0.1l-0.03,-0.14l0.11,-0.07Z",
            name: "Rhode Island"
        },
        "US-CT": {
            path: "M823.44,156.54l2.83,-3.23l-0.07,-0.54l-1.31,-1.25l-3.5,-15.89l9.81,-2.41l0.6,0.46l0.65,-0.26l0.23,-0.58l14.16,-4.0l3.2,10.18l0.47,1.96l-0.04,1.69l-1.65,0.32l-0.91,0.81l-0.69,-0.36l-0.5,0.11l-0.18,0.91l-1.15,0.07l-1.27,1.27l-0.62,-0.14l-0.56,-1.02l-0.89,-0.09l-0.21,0.67l0.75,0.64l0.08,0.54l-0.89,-0.02l-1.02,0.87l-1.65,0.07l-1.15,0.94l-0.86,-0.09l-2.05,0.82l-0.4,-0.68l-0.61,0.11l-0.89,2.12l-0.59,0.29l-0.83,1.29l-0.79,-0.05l-0.94,0.74l-0.2,0.63l-0.53,0.05l-0.88,0.75l-2.77,3.07l-0.96,0.27l-1.24,-1.04Z",
            name: "Connecticut"
        }
    },
    height: 589.0572567800147,
    projection: {
        type: "aea",
        centralMeridian: -100
    },
    width: 900
}), angular.module("truncate", []).filter("characters", function() {
    return function(input, chars, breakOnWord) {
        if (isNaN(chars)) return input;
        if (0 >= chars) return "";
        if (input && input.length >= chars) {
            if (input = input.substring(0, chars), breakOnWord) for (;" " == input.charAt(input.length - 1); ) input = input.substr(0, input.length - 1); else {
                var lastspace = input.lastIndexOf(" ");
                -1 !== lastspace && (input = input.substr(0, lastspace));
            }
            return input + "...";
        }
        return input;
    };
}).filter("words", function() {
    return function(input, words) {
        if (isNaN(words)) return input;
        if (0 >= words) return "";
        if (input) {
            var inputWords = input.split(/\s+/);
            inputWords.length > words && (input = inputWords.slice(0, words).join(" ") + "...");
        }
        return input;
    };
});

var twitterFetcher = function() {
    function x(e) {
        return e.replace(/<b[^>]*>(.*?)<\/b>/gi, function(c, e) {
            return e;
        }).replace(/class=".*?"|data-query-source=".*?"|dir=".*?"|rel=".*?"/gi, "");
    }
    function p(e, c) {
        for (var g = [], f = RegExp("(^| )" + c + "( |$)"), a = e.getElementsByTagName("*"), h = 0, d = a.length; d > h; h++) f.test(a[h].className) && g.push(a[h]);
        return g;
    }
    var y = "", l = 20, s = !0, k = [], t = !1, q = !0, r = !0, u = null, v = !0, z = !0, w = null, A = !0;
    return {
        fetch: function(e, c, g, f, a, h, d, b, m, n) {
            void 0 === g && (g = 20), void 0 === f && (s = !0), void 0 === a && (a = !0), void 0 === h && (h = !0), 
            void 0 === d && (d = "default"), void 0 === b && (b = !0), void 0 === m && (m = null), 
            void 0 === n && (n = !0), t ? k.push({
                id: e,
                domId: c,
                maxTweets: g,
                enableLinks: f,
                showUser: a,
                showTime: h,
                dateFunction: d,
                showRt: b,
                customCallback: m,
                showInteraction: n
            }) : (t = !0, y = c, l = g, s = f, r = a, q = h, z = b, u = d, w = m, A = n, c = document.createElement("script"), 
            c.type = "text/javascript", c.src = "//cdn.syndication.twimg.com/widgets/timelines/" + e + "?&lang=en&callback=twitterFetcher.callback&suppress_response_codes=true&rnd=" + Math.random(), 
            document.getElementsByTagName("head")[0].appendChild(c));
        },
        callback: function(e) {
            var c = document.createElement("div");
            c.innerHTML = e.body, "undefined" == typeof c.getElementsByClassName && (v = !1), 
            e = [];
            var g = [], f = [], a = [], h = [], d = 0;
            if (v) for (c = c.getElementsByClassName("tweet"); d < c.length; ) a.push(0 < c[d].getElementsByClassName("retweet-credit").length ? !0 : !1), 
            (!a[d] || a[d] && z) && (e.push(c[d].getElementsByClassName("e-entry-title")[0]), 
            h.push(c[d].getAttribute("data-tweet-id")), g.push(c[d].getElementsByClassName("p-author")[0]), 
            f.push(c[d].getElementsByClassName("dt-updated")[0])), d++; else for (c = p(c, "tweet"); d < c.length; ) e.push(p(c[d], "e-entry-title")[0]), 
            h.push(c[d].getAttribute("data-tweet-id")), g.push(p(c[d], "p-author")[0]), f.push(p(c[d], "dt-updated")[0]), 
            a.push(0 < p(c[d], "retweet-credit").length ? !0 : !1), d++;
            for (e.length > l && (e.splice(l, e.length - l), g.splice(l, g.length - l), f.splice(l, f.length - l), 
            a.splice(l, a.length - l)), c = [], d = e.length, a = 0; d > a; ) {
                if ("string" != typeof u) {
                    var b = new Date(f[a].getAttribute("datetime").replace(/-/g, "/").replace("T", " ").split("+")[0]), b = u(b);
                    if (f[a].setAttribute("aria-label", b), e[a].innerText) if (v) f[a].innerText = b; else {
                        var m = document.createElement("p"), n = document.createTextNode(b);
                        m.appendChild(n), m.setAttribute("aria-label", b), f[a] = m;
                    } else f[a].textContent = b;
                }
                b = "", s ? (r && (b += '<div class="user">' + x(g[a].innerHTML) + "</div>"), b += '<p class="tweet">' + x(e[a].innerHTML) + "</p>", 
                q && (b += '<p class="timePosted">' + f[a].getAttribute("aria-label") + "</p>")) : e[a].innerText ? (r && (b += '<p class="user">' + g[a].innerText + "</p>"), 
                b += '<p class="tweet">' + e[a].innerText + "</p>", q && (b += '<p class="timePosted">' + f[a].innerText + "</p>")) : (r && (b += '<p class="user">' + g[a].textContent + "</p>"), 
                b += '<p class="tweet">' + e[a].textContent + "</p>", q && (b += '<p class="timePosted">' + f[a].textContent + "</p>")), 
                A && (b += '<p class="interact"><a href="https://twitter.com/intent/tweet?in_reply_to=' + h[a] + '" class="twitter_reply_icon">Reply</a><a href="https://twitter.com/intent/retweet?tweet_id=' + h[a] + '" class="twitter_retweet_icon">Retweet</a><a href="https://twitter.com/intent/favorite?tweet_id=' + h[a] + '" class="twitter_fav_icon">Favorite</a></p>'), 
                c.push(b), a++;
            }
            if (null == w) {
                for (e = c.length, g = 0, f = document.getElementById(y), h = "<ul>"; e > g; ) h += "<li>" + c[g] + "</li>", 
                g++;
                f.innerHTML = h + "</ul>";
            } else w(c);
            t = !1, 0 < k.length && (twitterFetcher.fetch(k[0].id, k[0].domId, k[0].maxTweets, k[0].enableLinks, k[0].showUser, k[0].showTime, k[0].dateFunction, k[0].showRt, k[0].customCallback, k[0].showInteraction), 
            k.splice(0, 1));
        }
    };
}();

angular.module("ahundredyears.pagination", []), angular.module("ahundredyears.pagination").directive("pagination", [ function() {
    return {
        restrict: "E",
        template: "<div class='block'> <img src='{{article.thumbnail_url}}'/><h2>{{article.title}}</h2><p class='read-more' href='#' ng-click='lightbox(article)'>Read more &rarr;</p></div>",
        replace: !0,
        scope: {
            article: "=",
            lightbox: "=",
            addTag: "="
        }
    };
} ]).controller("PaginationController", [ "$scope", "$http", "$filter", "$log", function($scope, $http, $filter, $log) {
    $scope.$log = $log, $scope.sortables = [ {
        label: "Unsorted",
        val: "none"
    }, {
        label: "Latest",
        val: "submissionDate"
    }, {
        label: "Description",
        val: "text"
    }, {
        label: "Submitter",
        val: "submitter"
    } ], $scope.sortPrep = "none";
    var lightbox = !1;
    window.onpopstate = function(ev) {
        lightbox = ev.state, $scope.$apply();
    }, window.onkeydown = function(ev) {
        27 === ev.keyCode && lightbox && ($scope.lightbox(!1), $scope.$apply());
    }, $scope.lightbox = function(arg) {
        return "undefined" != typeof arg && (lightbox = arg), lightbox;
    }, $http.get("data/articles.json").success(function(data) {
        $scope.articles = data.articles, $scope.articles.sort(function() {
            return Math.random() - .5;
        }), $scope.featured = data.featured, $scope.tags = [], $scope.activeTags = [], angular.forEach(data.articles, function(article) {
            article.id = article.title.replace(/ /g, "-"), angular.forEach(article.tags, function(tag) {
                -1 === $scope.tags.indexOf(tag) && $scope.tags.push(tag);
            });
        }), $scope.tags.sort(), $scope.search();
    }).error(function() {
        $scope.error = "Cannot get data from the server";
    });
    var num = 3;
    $scope.filteredArticles = [], $scope.groupedArticles = [];
    var searchMatch = function(haystack, needle) {
        return needle ? -1 !== haystack.toLowerCase().indexOf(needle.toLowerCase()) : !0;
    }, hasAllTags = function(haystack, needles) {
        var ret = !0;
        return angular.forEach(needles, function(needle) {
            -1 === haystack.indexOf(needle) && (ret = !1);
        }), ret;
    };
    $scope.search = function() {
        $scope.filteredArticles = $filter("filter")($scope.articles, function(article) {
            return (searchMatch(article.desc, $scope.query) || searchMatch(article.title, $scope.query)) && hasAllTags(article.tags, $scope.activeTags);
        }), "none" !== $scope.sortPrep && ($scope.filteredArticles = $filter("orderBy")($scope.filteredArticles, $scope.sortPrep)), 
        $scope.currentPage = 0, $scope.group();
    }, $scope.group = function() {
        $scope.groupedArticles.length = Math.ceil($scope.filteredArticles.length / num);
        for (var i = 0; i < $scope.filteredArticles.length; i++) i % num === 0 ? $scope.groupedArticles[Math.floor(i / num)] = [ $scope.filteredArticles[i] ] : $scope.groupedArticles[Math.floor(i / num)].push($scope.filteredArticles[i]);
        $scope.filteredArticles.length % num !== 0 && ($scope.groupedArticles[$scope.groupedArticles.length - 1].length = num - $scope.filteredArticles.length % num), 
        $scope.groupToPages();
    };
    var itemsPerPage = 3;
    $scope.pagedArticles = [], $scope.currentPage = 0, $scope.groupToPages = function() {
        $scope.pagedArticles = [];
        for (var i = 0; i < $scope.groupedArticles.length; i++) i % itemsPerPage === 0 ? $scope.pagedArticles[Math.floor(i / itemsPerPage)] = [ $scope.groupedArticles[i] ] : $scope.pagedArticles[Math.floor(i / itemsPerPage)].push($scope.groupedArticles[i]);
    }, $scope.addTag = function(tagName) {
        tagName = tagName || this.tag, -1 === $scope.activeTags.indexOf(tagName) && (angular.forEach($scope.tags, function(tag, i) {
            0 === i && tag === tagName ? $scope.activeTags.push($scope.tags.shift()) : tag === tagName && ($scope.tags.splice(i, 1), 
            $scope.activeTags.push(tag));
        }), $scope.activeTags.sort(), $scope.search());
    }, $scope.removeTag = function() {
        var tagName = this.tag;
        angular.forEach($scope.activeTags, function(tag, i) {
            0 === i && tag === tagName ? $scope.tags.push($scope.activeTags.shift()) : tag === tagName && ($scope.activeTags.splice(i, 1), 
            $scope.tags.push(tag));
        }), $scope.tags.sort(), $scope.search();
    }, $scope.range = function(start, end) {
        var ret = [];
        end || (end = start, start = 0);
        for (var i = start; end > i; i++) ret.push(i);
        return ret;
    }, $scope.prevPage = function() {
        $scope.currentPage > 0 && $scope.currentPage--;
    }, $scope.nextPage = function() {
        $scope.currentPage < $scope.pagedArticles.length - 1 && $scope.currentPage++;
    }, $scope.setPage = function() {
        $scope.currentPage = this.n;
    };
} ]);