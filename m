Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Sat, 22 Sep 2018 22:20:36 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
	corbet@lwn.net, afd@ti.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: ina3221: Read channel input source info
 from DT
Message-ID: <20180923052036.GA9960@Asurada>
References: <20180923041118.8743-1-nicoleotsuka@gmail.com>
 <20180923041118.8743-3-nicoleotsuka@gmail.com>
 <6f179232-9114-f403-ee35-2495cea73318@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f179232-9114-f403-ee35-2495cea73318@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Thank you for the quick response!

On Sat, Sep 22, 2018 at 10:11:26PM -0700, Guenter Roeck wrote:
> >+static umode_t ina3221_attr_is_visible(struct kobject *kobj,
> >+				       struct attribute *attr, int n)
> >+{
> >+	const int max_attrs = ARRAY_SIZE(ina3221_attrs) - 1;
> >+	const int num_attrs = max_attrs / INA3221_NUM_CHANNELS;
> >+	struct device *dev = kobj_to_dev(kobj);
> >+	struct ina3221_data *ina = dev_get_drvdata(dev);
> >+	enum ina3221_channels channel = n / num_attrs;
> 
> 	int index = n % num_attrs;
> 
> >+	struct ina3221_input *input = &ina->inputs[channel];
> >+	int i;
> >+
> >+	/* Hide if channel input source is disconnected */
> >+	if (input->disconnected)
> >+		return 0;
> >+
> >+	/* Hide label node if label is not provided */
> 
> 	if (index == 1 && !input->label)
> 		return 0;
> 
> and drop i, ina3221_label_attrs[], and the loop below.

Will do that in v5.

Thanks
Nicolin
