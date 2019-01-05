From: Nicolin Chen <nicoleotsuka@gmail.com>
To: linux-hwmon@vger.kernel.org
Date: Fri, 04 Jan 2019 17:26:58 -0800
Subject: Re: [RFC][PATCH] hwmon: (ina2xx) Improve current and power reading precision
In-Reply-To: <20181121012629.5432-1-nicoleotsuka@gmail.com>
Message-ID: <20190105012642.GA18025@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

Hi Stefan,

Sorry for a super late reply. I took a long vacation.

On Wed, Nov 21, 2018 at 10:16:09PM +0000, Brüns, Stefan wrote:
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
> The reported current does not matter here, actually. Internally, the ADC 
> value 
> will have an uncertainty of 10mA (at PGA=1). At 1.8V, your uncertainty is 
> 18mW. And thats *only* the quantization noise. It wont get better than that.

The fact is that I do get better power results after setting the
calibration value to 0x7ff. That's the necessity of this change.

> Also note, you are apparently using the ina2xx hwmon driver - I strongly 
> advise against it, you should either use the ina2xx driver from the IIO 
> subsystem directly, or use the IIO driver via iio-hwmon.

The IIO version is also using the minimum calibration value. It
will not solve my problem here.

> There is also always the possibility to read the bus and shunt voltage 
> registers and calculate the power manually.

Won't that be a waste since the hardware could have provided a
better accuracy? It would need more I2C bus reads and cpu cycles
for calculation.

I don't get why you're against a setting for calibration value.
This is how the hardware got designed to cover different cases.
Since we do have such a case that needs some accuracy, it'd be
fair to add it into the driver. Plus, the feature won't change
the minimum calibration value at all -- everyone would be happy.

Thanks
Nicolin
