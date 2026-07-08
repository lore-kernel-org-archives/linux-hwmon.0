Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D996401A33
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512209; cv=none; b=mLYNp/pj+D07VsLnlOoauBhUVYdk9R1O5x6ccZ4XNK5Cnf1kYB0LCi7+4HZF7jg+wvhjXaqANNn0E4HgSmKxowKgXO1MlEp2MIrpLSIZwTs8ILVdVVkDFTuvCEmWXaTfAPz6Mk095m+2F3G2Nx0hADDOn7HiLQJMuorRYfSTt+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512209; c=relaxed/simple;
	bh=zgEfTqUNWFWHvbVm5cUro8zAo7pzrcZeUp9ifyzoaio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pb5nvkfRuNXzd6DCG5EKc/pPZvy77ctytrjpNIxYCuxOwCZyiQ+y6+RKIFoYEAP8bip1QwQhFPCURa9JVxSilm6beTwtygXs77NHsE8j+DoM7MvnTmMGYYAnXWH9Rdvkd30pBhJxaz1sFE5JIVEfjf1Hy1TO5G/IGYvoXi/N38U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=maz4drve; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="maz4drve"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c83474ddso5226995e9.3
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2026 05:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783512206; x=1784117006; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mxttBuvsW1U/LvQQkaU98BFuAzSlaLEqGLAP338ir2o=;
        b=maz4drvet9zQUlN7YezVSoZFG9AN4cbxoRlvTYBYl7BtePa1jOQpZzLf96syLzr5Hh
         ACFWPgI/MqfyVRP+VnWDU4WWh8lo1r6IpAHnB97lEgZSR/vku9WEMSVkw62EIvhvtDFF
         /y5PPf409+mGWXjXXSGW/IiSO6vE11hunj8tILecZM2Sp6krweL3yN8MfDbFqDCVySNk
         bHglwVZlMOoaC0x+KBa0KX06XWUG2+TggdZTpUfwJ3dSYqfiMc64ReEZzOfj0wJe9R2Q
         tloy3J3jralxlh/8vPOMH2kkYUfBxLOzfCFaeaK5X35L0nGavnOGvCpqoh8LvhowRMTI
         dNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512206; x=1784117006;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mxttBuvsW1U/LvQQkaU98BFuAzSlaLEqGLAP338ir2o=;
        b=l/ukTBi8d4Wnl03AvPcEekoy5B1L0sMegJbBN93Z5/P3TWpVDP5sLIqqObAgq8lJXA
         SyeHMskv9EhbyttlvCOdLXJug883wXHz2I2oLPLa288FVPjC64YZuBgXlDilc3wOwHwr
         fI/OKIEYRqXVg41rM6jwBKcOnZOmeiB+V4+a6JUg4BZIpx+jgguzhdovUFNKaOwwPHFR
         pEkRyngC8pVEzd3B31Pt5iqx2qkkwVzmewRepIAgPAKKURmIfwr98HFNoEHvcyWuBw+o
         zpKFbojRA9FGpBWQboxz8iWCVRv8swD87O7A/7Va+DkabpDSYzWWvYdysizlDF3QSU3x
         0z5w==
X-Forwarded-Encrypted: i=1; AHgh+Rouvm2Vr7O0B7SuyD9GnjEVvHycuDWLC3GOn5edjrjNEqX2doA+uHAfGrrbQnhKWWxzUfvWFK4tlIc0zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI58e3Z4tpd5jBP1j6ib68YRdYzMyJq5/ImQ8ypqNZdLyDhFiF
	7bTlBSNtKiSZuv+Xm0GrJjNd0K3SiDUU02/eZtEF9ZcjA++Z2+g4Is1YjO6So5eQV5Q=
X-Gm-Gg: AfdE7clYToarvOb8Q+KcxBzgtwOzfsY2oIsgidSHoUoghYJJfmNNTOvtFsiEnHh7gzJ
	6FgjPFDJqHCOdfwpOgKOxvt/ZMHbq8O4xP/RgbhWBiNw8vO+48JxANBCkpLHrmwg2Oo4awI72wc
	T/y2vNzwMUazmnx3fkxc+8FuvWBIvEf46s4H8g3Vy8W2Iih8V2i/+WuCsgIHf7tNRF53LCEMHnu
	iz8tex+pYISuZ+J8FMcSifoi0pHLZvpUFPiq27b1Rvr7Qv6VePsOeHAEH+ovrq8E3h5QeZMP7E+
	nDD5kdwXol9esYuRZe9yHa9op9I6BBvNsc0rNNHyeNitl/gmZEnr84qWKwnossDjV9NGo+fzoQz
	0a2fStMwZZwPagD0S3QbcuEb5D1MoeffhEAmGW5MvzK9ONUfUcRaUmuggv3lfqoHuu5OoJYHUog
	eVjtMEdZaZPGU+qcDyeJXBu0K0
X-Received: by 2002:a05:600c:c0d1:20b0:493:a8eb:5145 with SMTP id 5b1f17b1804b1-493e68b813bmr18047535e9.4.1783512205839;
        Wed, 08 Jul 2026 05:03:25 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:28ff:335b:63e2:fdd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5b811sm219199185e9.13.2026.07.08.05.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:03:25 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:03:14 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
	manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v6 0/3] Lenovo ThinkPad T14s EC thermal monitoring and
 thermal zone integration
Message-ID: <ak48gsxhVW492C7H@linaro.org>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>

On Tue, Jul 07, 2026 at 09:22:25PM +0200, Daniel Lezcano wrote:
> This series extends the Lenovo ThinkPad T14s embedded controller driver
> with environmental monitoring capabilities and integrates the exposed
> sensors into the Linux thermal framework.
> 
> The EC provides access to several platform temperature sensors
> covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
> module and SSD. These sensors are currently used by the firmware for
> thermal management but are not exposed to Linux.
> 
> The first patch adds hwmon support for the EC temperature sensors.
> 
> The second patch exposes the EC as a thermal sensor provider in the
> device tree and defines thermal zones for the keyboard skin
> temperature and the charging circuitry temperature. This allows the
> generic thermal framework to react to EC-reported temperatures and
> apply standard Linux thermal mitigation policies.
> 
> As the EC protocol is not fully decoded, the passive trip points
> get/set actions are missing, so it is not possible to program a
> threshold and receive an interrupt when crossed the way up or
> down. Consequently, the thermal zone related to the charging circuitry
> is polled every two seconds until we can set the trip points in the
> EC.
> 
> This series fixes critical thermal issues happening on this platform
> where a kernel compilation, or heavy workloads, lead to a system
> reboot.
> 

Thanks for working on this! I have a few comments/questions about this:

1. EC vs PMIC temperature sensors

AFAIK, the T14s (and actually most X1E laptops) have two sets of
thermistors in each location: One is connected to the PMIC (called
SYS_THERMx), and the other set is connected to the EC.

The SYS_THERMx sensors connected to the PMIC have been enabled for the
T14s already over a year ago [1]. The reason this is not upstream is
that we now been waiting 3 years for the corresponding ADC/thermal code
to land upstream [2]. It seems pretty close now, the ADC part has landed
and there is only the thermal part left [3].

The PMIC thermistor setup is likely going to be similar for most X1E
laptops, so I think it would be preferable to use that instead of the EC
sensors to implement additional temperature throttling. It also supports
interrupts/trip points already, so it doesn't need polling.

The most recent proposed patch actually adds the SYS_THERMx thermal
zones to all X1E-based devices [4], although I'm not sure if it would be
better to keep that device-specific...

[1]: https://github.com/stephan-gh/linux/commit/c0ddc9fa96667d6b32d690ce6a3dcfc76aaabad6
[2]: https://lore.kernel.org/linux-arm-msm/20230708072835.3035398-1-quic_jprakash@quicinc.com/
[3]: https://lore.kernel.org/linux-arm-msm/20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com/
[4]: https://lore.kernel.org/linux-arm-msm/20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com/

2. EC sensor mapping vs PMIC sensor mapping

In PATCH 2/3 you define:

	{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
	{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
	{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
	{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
	{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
	{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },

I'm not sure if this is correct. When comparing this with the data read
from the sensors connected to the PMIC:

| Sensor          | PMIC Channel | EC (hwmon)   | PMIC (thermal)  | Delta    |
|-----------------|--------------|--------------|-----------------|----------|
| SOC             | SYS_THERM0   | 79.0°C       | 78.7°C          | +0.3°C   |
| Keyboard        | SYS_THERM1   | 68.0°C       | 70.1°C          | -2.1°C   |
| Base / Back     | SYS_THERM2   | 66.0°C       | 64.6°C          | +1.4°C   |
| Charging        | SYS_THERM3   | 73.0°C       | 73.8°C          | -0.8°C   |
| West / QTM      | SYS_THERM6   | 64.0°C       | 62.6°C          | +1.4°C   |
| SSD             | SYS_THERM7   | 31.0°C       | 67.1°C          | -36.1°C  |
| Modem           | SYS_THERM4   | N/A          | 31.6°C          | N/A      |
| East            | SYS_THERM5   | N/A          | 70.3°C          | N/A      |

The SSD delta of 36°C is definitely suspicious. I think
"ssd"/T14S_EC_SYS_THERM7 in your EC driver patch is actually the modem
sensor (SYS_THERM4).

If you look at a picture of the T14s mainboard
(https://www.notebookcheck.net/fileadmin/_processed_/d/c/csm_DSC_0003_aadae1ddd2.jpg)
and zoom in to the unpopulated modem sub-board left to the fan you can
see the two thermistors RT601 and RT301. The SSD on the other hand sits
almost directly next to the SoC on the right, so I wouldn't expect it to
stay > 30°C cooler than its surroundings.

However, there are also two thermistors next to the SSD, see e.g. this
close-up picture of the mainboard:
https://download.lenovo.com/Images/Parts/5B21P83385/5B21P83385_A.jpg
This means that the SSD is probably one of the other mappings. If the
thermistors are consecutively numbered in the EC firmware, the SSD
(RT8203) might be actually the third sensor ("base"/T14S_EC_SYS_THERM2).
I'm not sure how to figure out the proper mapping.

The back of the mainboard is completely covered with tape
(https://download.lenovo.com/Images/Parts/5B21P83377/5B21P83377_B.jpg)
so it's impossible to see anything there.

3. Active vs passive throttling

Are you matching the Windows cooling/throttling setup here? If not, have
you considered how this interacts with the fan control applied by the
EC? I'm a bit worried that this might lead to unexpected performance
regressions if we start throttling before the EC runs the fan at full
speed.

Thanks,
Stephan
