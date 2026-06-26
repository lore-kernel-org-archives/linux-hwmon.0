Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981C83EB813
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468878; cv=none; b=MBIrQQZrVH2gsEp/j9hMSEvzL62vmdoW6uEZc05XA3uFt15+zqOAQYAp7d1pXKdy8y2PxAyDCCK3Cf6osUJB6A7i8J0LlBcna4kn5WSoGUBZYnROWbYJbud4iwTGLLQJczf95hcJXvaSSl8bvbv6US3FTgA1YTl3jTST2+nmIG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468878; c=relaxed/simple;
	bh=15MhJT2ZxMq+sELeMqg9HN0mIhDXO9p29+KabYBMU+c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Nrl5D/shd3MSN04CfyfW35mta2rLOUVyMIEbCZhnq9Y0PnX9IPwtDDUFb8qlA+915OIK8VmMjyAf8pqNEzWvqxWRrMx1vPBbUSidRqp+IH9TkqYg6UoP2cMN1en3PKq7v/9XUnaC//2m0a7VwRPzYaqpY5sNzwd98yfP7Kzbojk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0ANr9p4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0ANr9p4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so5475715e9.0
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 03:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782468874; x=1783073674; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lztea3ZOC89L7vdZqjzvztkeXoF5fpEssy4S7I/g16o=;
        b=Y0ANr9p4awWbxBvAvUbW4rxlXo49D1FW9440z5bR832e4hP3Sj4WIv5YBS7O16nDtN
         kqy2R+dq3aMEULAxYYIgCDem7PltOFbewJODuN4s9H9VAlhhDI6rOaFXUjn4RcAwI8eg
         x5+PlL7RLgwzOMOTnM/t8I9gAUNpDZvM1T+iEkpTkcGIVJBbUqFGV+3qgazz4D/FJJgz
         x4pYD0NPn4yTE/3sOUs5QoTMYTOBYX5PmlITpcASdinNlWcEUtA8og0TxOkB4Q8yGgwq
         HDZmpvpw0qYVu+e9/otjsGvfSZYfHiJtISRUgXwlkonCyh/WmLFv++W5V1YxxB+BUpT4
         AEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782468874; x=1783073674;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lztea3ZOC89L7vdZqjzvztkeXoF5fpEssy4S7I/g16o=;
        b=jcANoTwfrh5xf7AZ0fGNxVUkk29VkrYnXoWNpwlB1u+5yl1jr8jlevMJh+8c55Ork3
         lul2izfBpfa8VHo6zOBHGMz2AG4ZpWG4o3PO/QxkxPESELAhaor3Y8bneAoO/rsLX/KI
         oGy3SrsfuQZM/fyAjsqaNx8boYlIbFxe6hT6DJjzKHy0jkkhsAtwikdpyPSQtPE+8aVZ
         kTb+GpRIBOQWOuL/Lq4dmirVCeFb/whgo5INC9WoDYPAXQ2QCdr6/D3SY88R7AuWz9XE
         JiaNtpG9D4Jh9+C9C5w/8t6KRCDcDNNfQrFF6+e1lS5fPsIOogCPNBjFwKH+GRbYGohA
         DhSA==
X-Gm-Message-State: AOJu0Yz46GgyNt2koUFGsJ/n/+mOhZvLpLm7TGVvrXQCrH8LJGXezrTo
	BSyOAp7AUZ9kaEP76KX2AF/4vNZ3/CQFjJY1+ewSjUvWyAYavf1EGpsNocIpDUSY
X-Gm-Gg: AfdE7cmpJF0kO2t6mc1xVZKjZGZxCwAqybRdzk4AcLLVnRe1DZ+iwubFmHbQ5qJEqHa
	7NtqlBHvsg3hLl+gpvRIAHI6/wl0Mz738xs7vYGj207etXkjg9WbYZ5fEfbaUJH5CaWq5MWuhQr
	CfoVJ295Gmnl/vjguoQH7yIKDAYrrlRFeejTum76Muec+p9/4wclNNZEli+y+BayLe5B+vsVy3O
	EXiLf+APAUuSh2vQ64LYATYucCluJlI9k8LZD1H+wj7wkhJS1kMOGj7+QAAho9A8Mj/w4s7j+Vp
	510sZKKlLLZm69O78uRx4KT0Rh7TVjmE1nepyx3RdwB+Tkp8Hz/HHJtMGxUqxVvskHi34uSNy8C
	ysfXj/eUx0JNrQfXe5xkXnkWXXgSeRYfbPOnhdALn+WtsQvlDnaFut/Qii18X6PK/aQ4SSSIOo7
	JtayyWeYQ6tmwCx0nx78E3ztE=
X-Received: by 2002:a05:600c:c1d7:10b0:492:4667:8c40 with SMTP id 5b1f17b1804b1-492668638c1mr71583225e9.8.1782468873799;
        Fri, 26 Jun 2026 03:14:33 -0700 (PDT)
Received: from localhost ([2001:4bb8:16f:1117:388:ce2:35e4:fb50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c28c51asm25077485e9.2.2026.06.26.03.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 03:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 12:14:30 +0200
Message-Id: <DJIWHAMMOGVW.1MNPC9SYMSXX7@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: (chipcap2) Add support for label
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>, "Guenter Roeck"
 <linux@roeck-us.net>, "Javier Carrasco" <javier.carrasco.cruz@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260625160423.17882-1-flaviu.nistor@gmail.com>
 <20260625160423.17882-2-flaviu.nistor@gmail.com>
In-Reply-To: <20260625160423.17882-2-flaviu.nistor@gmail.com>

On Thu Jun 25, 2026 at 6:04 PM CEST, Flaviu Nistor wrote:
> Add support for label sysfs attribute similar to other hwmon devices.
> This is particularly useful for systems with multiple sensors on the
> same board, where identifying individual sensors is much easier since
> labels can be defined via device tree.
>
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
> Changes in v2:
> - No change for this patch in the patch series.
> - Link to v1: https://lore.kernel.org/all/20260622122200.14245-1-flaviu.n=
istor@gmail.com/
>
>  Documentation/hwmon/chipcap2.rst |  2 ++
>  drivers/hwmon/chipcap2.c         | 25 +++++++++++++++++++++++--
>  2 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/hwmon/chipcap2.rst b/Documentation/hwmon/chipc=
ap2.rst
> index dc165becc64c..c38d87b91b69 100644
> --- a/Documentation/hwmon/chipcap2.rst
> +++ b/Documentation/hwmon/chipcap2.rst
> @@ -70,4 +70,6 @@ humidity1_min_hyst:             RW      humidity low hy=
stersis
>  humidity1_max_hyst:             RW      humidity high hystersis
>  humidity1_min_alarm:            RO      humidity low alarm indicator
>  humidity1_max_alarm:            RO      humidity high alarm indicator
> +humidity1_label:                RO      descriptive name for the sensor
> +temp1_label:                    RO      descriptive name for the sensor
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
> index 4aecf463180f..086571d556b7 100644
> --- a/drivers/hwmon/chipcap2.c
> +++ b/drivers/hwmon/chipcap2.c
> @@ -22,6 +22,8 @@
>  #include <linux/irq.h>
>  #include <linux/module.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/property.h>
>
>  #define CC2_START_CM			0xA0
>  #define CC2_START_NOM			0x80
> @@ -83,6 +85,7 @@ struct cc2_data {
>  	struct i2c_client *client;
>  	struct regulator *regulator;
>  	const char *name;
> +	const char *label;
>  	int irq_ready;
>  	int irq_low;
>  	int irq_high;
> @@ -449,6 +452,8 @@ static umode_t cc2_is_visible(const void *data, enum =
hwmon_sensor_types type,
>  		switch (attr) {
>  		case hwmon_humidity_input:
>  			return 0444;
> +		case hwmon_humidity_label:
> +			return cc2->label ? 0444 : 0;
>  		case hwmon_humidity_min_alarm:
>  			return cc2->rh_alarm.low_alarm_visible ? 0444 : 0;
>  		case hwmon_humidity_max_alarm:
> @@ -466,6 +471,8 @@ static umode_t cc2_is_visible(const void *data, enum =
hwmon_sensor_types type,
>  		switch (attr) {
>  		case hwmon_temp_input:
>  			return 0444;
> +		case hwmon_temp_label:
> +			return cc2->label ? 0444 : 0;
>  		default:
>  			return 0;
>  		}
> @@ -552,6 +559,16 @@ static int cc2_humidity_max_alarm_status(struct cc2_=
data *data, long *val)
>  	return 0;
>  }
>
> +static int cc2_read_string(struct device *dev, enum hwmon_sensor_types t=
ype,
> +			   u32 attr, int channel, const char **str)
> +{
> +	struct cc2_data *data =3D dev_get_drvdata(dev);
> +
> +	*str =3D data->label;
> +
> +	return 0;
> +}
> +
>  static int cc2_read(struct device *dev, enum hwmon_sensor_types type, u3=
2 attr,
>  		    int channel, long *val)
>  {
> @@ -670,8 +687,9 @@ static int cc2_request_alarm_irqs(struct cc2_data *da=
ta, struct device *dev)
>  }
>
>  static const struct hwmon_channel_info *cc2_info[] =3D {
> -	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> -	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT | HWMON_H_MIN | HWMON_H_MAX =
|
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT | HWMON_H_LABEL |
> +			   HWMON_H_MIN | HWMON_H_MAX |
>  			   HWMON_H_MIN_HYST | HWMON_H_MAX_HYST |
>  			   HWMON_H_MIN_ALARM | HWMON_H_MAX_ALARM),
>  	NULL
> @@ -680,6 +698,7 @@ static const struct hwmon_channel_info *cc2_info[] =
=3D {
>  static const struct hwmon_ops cc2_hwmon_ops =3D {
>  	.is_visible =3D cc2_is_visible,
>  	.read =3D cc2_read,
> +	.read_string =3D cc2_read_string,
>  	.write =3D cc2_write,
>  };
>
> @@ -710,6 +729,8 @@ static int cc2_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(data->regulator),
>  				     "Failed to get regulator\n");
>
> +	device_property_read_string(dev, "label", &data->label);
> +
>  	ret =3D cc2_request_ready_irq(data, dev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to request ready irq\n");

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
