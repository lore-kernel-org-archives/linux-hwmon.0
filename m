Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33266 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387670AbeKVJe3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Nov 2018 04:34:29 -0500
Date: Wed, 21 Nov 2018 14:57:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?B?QnL8bnMs?= Stefan <Stefan.Bruens@rwth-aachen.de>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [RFC][PATCH] hwmon: (ina2xx) Improve current and power reading
 precision
Message-ID: <20181121225758.GA1421@roeck-us.net>
References: <20181121012629.5432-1-nicoleotsuka@gmail.com>
 <2863036.QIPGp1Eqjm@sbruens-linux.lcs.intern>
 <20181121194051.GA8902@Asurada-Nvidia.nvidia.com>
 <1717545.GXSegKtrMu@sbruens-linux.lcs.intern>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1717545.GXSegKtrMu@sbruens-linux.lcs.intern>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Nov 21, 2018 at 10:16:09PM +0000, Brüns, Stefan wrote:
> On Mittwoch, 21. November 2018 20:40:52 CET Nicolin Chen wrote:
> > (Removing "m.purski@samsung.com" since it's not reachable any more)
> > 
> > Hi Stefan,
> > 
> > Thank you for the comments.
> > 
> > On Wed, Nov 21, 2018 at 04:13:01PM +0000, Brüns, Stefan wrote:
> > > > === Problem ===
> > > > Both methods simplify software routine by fixing one factor, which
> > > > sacrifices the precision of the hardware measurement results.
> > > > 
> > > > Using ina226 for example, with method A, the current scale was 1mA
> > > > and the power scale was 25mA.
> > > > 
> > > > With method B, calibration value is fixed at 2048 so the precision
> > > > is decided by shunt resistor value. It sounds reasonable since the
> > > > hardware engineers can use a larger shunt resistor when they need
> > > > higher resolution. However, they often concern power burning across
> > > > the resistor as well, so the resistor usually won't be so large: a
> > > > typical value 1000 micro-ohms, which results in a current scale at
> > > > 2.5 mA and a power sacle at 62.5 mW.
> > > 
> > > Power loss surely is a concern, but figures should be kept reasonable.
> > > 
> > > 1. You mention 1.8V bus voltage, and currents in the 30mA range. Using the
> > > 1mOhm current shunt:
> > > 
> > > U_S = R_S * I_S 1e-3 Ohm * 30e-3 A = 30e-6 V  (30uV)
> > > P_S = U_S * I_S = 30e-6V * 30e-3 A = 900e-9W = 0.9 uW
> > > 
> > > INA219 Power Supply (Datasheet)
> > > Min operating Voltage: 3V
> > > Quiescent Current: 0.7mA
> > > -> Min power: 2.1mW
> > > 
> > > So the INA219 alone uses 2.1mW, 1000 times more than the shunt.
> > 
> > Chip can enter power-down or one-shot mode. Though this upstream
> > driver doesn't have these two mode supports yet, I am working on
> > it so they'll be added.
> 
> The power-down current is 6uA, so even if you never leave power-down mode, you 
> are down to 18uW. But on top of that, you need power for the conversion, and 
> you need power for communication.
> 
> > > Another concern may be voltage drop over the shunt, but for this case you
> > > have a nominal voltage of 1.8V, so 30uV are 0.001%.
> > > 
> > > > When measuring a 1.8v voltage running a small current (e.g. 33 mA),
> > > > the power value (that's supposed to be 59.4 mW) becomes inaccurate
> > > > due to the larger scale (25mA for method A; 62.5 mA for method B).
> > 
> > Just found out that I have typos here: 25mW and 62.5mW.
> > 
> > > Another look into the datasheet reveals, even at full gain (PGA=1), the
> > > LSB is 40mV / 2^12 = 40mV / 4096 ~ 10uV. So when the current ADC reads
> > > out as 3*LSB, this anything between 25mA and 35mA. This is the best case
> > > figure.
> > Current read doesn't get affected a lot actually, since hwmon ABI
> > also reports current value in unit mA. However, the power read is
> > the matter here. With a 62.5mW power_lsb, power results are kinda
> > useless on my system.
> 
> The reported current does not matter here, actually. Internally, the ADC value 
> will have an uncertainty of 10mA (at PGA=1). At 1.8V, your uncertainty is 
> 18mW. And thats *only* the quantization noise. It wont get better than that.
> 
> Also note, you are apparently using the ina2xx hwmon driver - I strongly 
> advise against it, you should either use the ina2xx driver from the IIO 
> subsystem directly, or use the IIO driver via iio-hwmon.
> 
> 1. INA219 is not properly supported by the hwmon driver, see the changes in 
> the IIO driver.
> 2. The IIO driver has many more features:
>   - setting the PGA (INA219)
>   - setting the bus voltage range (INA219)
>   - selecting the conversion time (INA219/226)
> 

I agree. Not because of the functionality per se ("not properly supported, see
changes in IIO driver" is a bit vague given the number of changes there),
but you don't really use both ina3221 and ina219 as hwmon device. Afer all,
one-shot mode effectively turns off limit tracking.

Ultimately it would be nice if iio would support limits and alarms, and iio-hwmon
could read and report those. This would enable us to drop the iio-hwmon driver.

Guenter
