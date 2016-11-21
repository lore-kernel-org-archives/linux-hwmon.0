Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56020 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754932AbcKUUfN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Nov 2016 15:35:13 -0500
Date: Mon, 21 Nov 2016 12:35:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <michael@walle.cc>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC,2/2] hwmon: adt7411: add min, max and alarm attributes
Message-ID: <20161121203508.GA17211@roeck-us.net>
References: <1476438215-6654-2-git-send-email-michael@walle.cc>
 <20161119180552.GA27002@roeck-us.net>
 <3353d7477aec9b78fb6e5aa3f145fec1@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3353d7477aec9b78fb6e5aa3f145fec1@walle.cc>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 21, 2016 at 05:53:01PM +0100, Michael Walle wrote:
> Am 2016-11-19 19:05, schrieb Guenter Roeck:
> >Hi Michael,
> >
> >On Fri, Oct 14, 2016 at 11:43:35AM +0200, Michael Walle wrote:
> >>This patch adds support for the min, max and alarm attributes of the
> >>voltage and temperature channels. Additionally, the temp2_fault
> >>attribute
> >>is supported which indicates a fault of the external temperature diode.
> >>
> >>Signed-off-by: Michael Walle <michael@walle.cc>
> >
> >Sorry for the late reply. Mostly looks ok.
> >Couple of comments below.
> 
> thanks for the review. I will send an updated version, soon.
> 
> 
> [snip]
> 
> >>+static int adt7411_write_temp(struct device *dev, u32 attr, int
> >>channel,
> >>+			      long val)
> >>+{
> >>+	struct adt7411_data *data = dev_get_drvdata(dev);
> >>+	struct i2c_client *client = data->client;
> >>+	int reg;
> >>+
> >>+	val = DIV_ROUND_CLOSEST(val, 1000);
> >>+	val = clamp_val(val, -128, 127);
> >>+	val = val < 0 ? 0x100 + val : val;
> >
> >Does this add any value ? It doesn't change the low byte.
> 
> mh? if val is negative 256 will be added.
> 

What changes for the low byte if you add 0x100 to val ?

0xXXXXXX00 + 0x100 -> 0xYYYYYY00
0xXXXXXX01 + 0x100 -> 0xYYYYYY01
..
0xXXXXXXff + 0x100 -> 0xYYYYYYff

or

0x000000xx + 0x100 = 0x000001xx
0x000001xx + 0x100 = 0x000002xx
..
0xfffffexx + 0x100 = 0xffffffxx
0xffffffxx + 0x100 = 0x000000xx

> 
> >> static umode_t adt7411_is_visible(const void *_data,
> >> 				  enum hwmon_sensor_types type,
> >> 				  u32 attr, int channel)
> >> {
> >> 	const struct adt7411_data *data = _data;
> >>+	bool visible;
> >>
> >> 	switch (type) {
> >> 	case hwmon_in:
> >>-		if (channel > 0 && channel < 3)
> >>-			return data->use_ext_temp ? 0 : S_IRUGO;
> >>-		else
> >>-			return S_IRUGO;
> >>+		visible = channel == 0 || channel >= 2 || !data->use_ext_temp;
> >
> >in2 is now visible even if external temperature is measured.
> >This is not correct. Yes, one can read the register, but the
> >external pin (AIN2) is connected to the temperature sensor.
> 
> i guess
> 
>   visible = channel == 0 || channel >= 3 || !data->use_ext_temp;
> 
Correct.

Guenter
