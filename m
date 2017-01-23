Return-path: <julia.lawall@lip6.fr>
Date: Mon, 23 Jan 2017 08:18:04 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Guenter Roeck <linux@roeck-us.net>
cc: Joe Perches <joe@perches.com>, Florian Fainelli <f.fainelli@gmail.com>,
    linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
    Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>,
    Jonathan Corbet <corbet@lwn.net>,
    "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
    "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
    "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 1/2] hwmon: (lm70) Utilize dev_warn instead of pr_warn
In-Reply-To: <637f229a-cfbb-938e-4700-89b180c8b2c0@roeck-us.net>
Message-ID: <alpine.DEB.2.20.1701230812480.2116@hadrien>
References: <20170121192010.30681-1-f.fainelli@gmail.com> <20170121192010.30681-2-f.fainelli@gmail.com> <1485153837.12563.23.camel@perches.com> <637f229a-cfbb-938e-4700-89b180c8b2c0@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-hwmon@vger.kernel.org>



On Sun, 22 Jan 2017, Guenter Roeck wrote:

> On 01/22/2017 10:43 PM, Joe Perches wrote:
> > On Sat, 2017-01-21 at 11:20 -0800, Florian Fainelli wrote:
> > > We have a device reference, utilize it instead of pr_warn().
> >
> > There is at least one more hwmon to convert in applesmc.c
> >
> > Perhaps a coccinelle script?
> >
> > Two questions for Julia Lawall:
> >
> > o is there a better way to do this than repeat the blocks
> >   one for each replacement
> > o can struct device * dev be made an arbitrary identifier
>
> Definitely yes here; otherwise you only catch the ones named 'dev'.
> Did you try "identifier dev;" ?

Definitely do that.

>
> The type of fn is irrelevant; you don't need to specify it.

Agreed.

> There is also the case where 'struct device *dev' is a local variable
>
> fn(...) {
> ...
> struct device *dev = e;
> <...
> ...>
> }

Here, you don't need the fn(...) { ... } part.  It would also be good to
say:

expression e != NULL;

dev could also be initialized:

@@
struct device *dev;
expression e != NULL;
expression e1;
@@

dev = e;
<...
-
+
...>
? dev = e1; // stop when dev is reinitialized, to avoid a double match

The rules can all be merged together with a disjunction:

(
- pr_emerg
+ dev_emerg
|
- pr_crit
+ dev_crit  // fill in all cases
)
  (
+ dev,
  ...)

julia


> or when it isn't but is still available
>
> fn (..., struct \(platform_device\|i2c_device\|spi_device\) *pdev, ...) {
> }
>
> >
> > $ cat dev_printk.cocci
> > @@
> > identifier fn;
> > type T;
> > @@
> >
> > T fn ( ..., struct device * dev, ... ) {
> > <...
> > -	pr_emerg(
> > +	dev_emerg(dev,
> > 	...);
> > ...>
> > }
> >
> > @@
> > identifier fn;
> > type T;
> > @@
> >
> > T fn ( ..., struct device * dev, ... ) {
> > <...
> > -	pr_crit(
> > +	dev_crit(dev,
> > 	...);
> > ...>
> > }
> >
> > @@
> > identifier fn;
> > type T;
> > @@
> >
> > T fn ( ..., struct device * dev, ... ) {
> > <...
> > -	pr_alert(
> > +	dev_alert(dev,
> > 	...);
> > ...>
> > }
> >
> > @@
> > identifier fn;
> > type T;
> > @@
> >
> > T fn ( ..., struct device * dev, ... ) {
> > <...
> > -	pr_err(
> > +	dev_err(dev,
> > 	...);
> > ...>
> > }
> >
> > @@
> > identifier fn;
> > type T;
> > @@
> >
> > T fn ( ..., struct device * dev, ... ) {
> > <...
> > -	pr_notice(
> > +	dev_notice(dev,
> > 	...);
> > ...>
> > }
> >
> > @@
> > identifier fn;
> > type T;
> > @@
> >
> > T fn ( ..., struct device * dev, ... ) {
> > <...
> > -	pr_warn(
> > +	dev_warn(dev,
> > 	...);
> > ...>
> > }
> >
> > @@
> > identifier fn;
> > type T;
> > @@
> >
> > T fn ( ..., struct device * dev, ... ) {
> > <...
> > -	pr_info(
> > +	dev_info(dev,
> > 	...);
> > ...>
> > }
> >
> > @@
> > identifier fn;
> > type T;
> > @@
> >
> > T fn ( ..., struct device * dev, ... ) {
> > <...
> > -	pr_debug(
> > +	dev_dbg(dev,
> > 	...);
> > ...>
> > }
> >
> >
>
>
