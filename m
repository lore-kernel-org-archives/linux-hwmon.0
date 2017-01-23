Return-path: <joe@perches.com>
Message-ID: <1485153837.12563.23.camel@perches.com>
Subject: Re: [PATCH 1/2] hwmon: (lm70) Utilize dev_warn instead of pr_warn
From: Joe Perches <joe@perches.com>
To: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
	Julia Lawall <julia.lawall@lip6.fr>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>,  "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:HARDWARE
 MONITORING" <linux-hwmon@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>
Date: Sun, 22 Jan 2017 22:43:57 -0800
In-Reply-To: <20170121192010.30681-2-f.fainelli@gmail.com>
References: <20170121192010.30681-1-f.fainelli@gmail.com>
	 <20170121192010.30681-2-f.fainelli@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Sat, 2017-01-21 at 11:20 -0800, Florian Fainelli wrote:
> We have a device reference, utilize it instead of pr_warn().

There is at least one more hwmon to convert in applesmc.c

Perhaps a coccinelle script?

Two questions for Julia Lawall:

o is there a better way to do this than repeat the blocks
  one for each replacement
o can struct device * dev be made an arbitrary identifier

$ cat dev_printk.cocci
@@
identifier fn;
type T;
@@

T fn ( ..., struct device * dev, ... ) {
<...
-	pr_emerg(
+	dev_emerg(dev,
	...);
...>
}

@@
identifier fn;
type T;
@@

T fn ( ..., struct device * dev, ... ) {
<...
-	pr_crit(
+	dev_crit(dev,
	...);
...>
}

@@
identifier fn;
type T;
@@

T fn ( ..., struct device * dev, ... ) {
<...
-	pr_alert(
+	dev_alert(dev,
	...);
...>
}

@@
identifier fn;
type T;
@@

T fn ( ..., struct device * dev, ... ) {
<...
-	pr_err(
+	dev_err(dev,
	...);
...>
}

@@
identifier fn;
type T;
@@

T fn ( ..., struct device * dev, ... ) {
<...
-	pr_notice(
+	dev_notice(dev,
	...);
...>
}

@@
identifier fn;
type T;
@@

T fn ( ..., struct device * dev, ... ) {
<...
-	pr_warn(
+	dev_warn(dev,
	...);
...>
}

@@
identifier fn;
type T;
@@

T fn ( ..., struct device * dev, ... ) {
<...
-	pr_info(
+	dev_info(dev,
	...);
...>
}

@@
identifier fn;
type T;
@@

T fn ( ..., struct device * dev, ... ) {
<...
-	pr_debug(
+	dev_dbg(dev,
	...);
...>
}
