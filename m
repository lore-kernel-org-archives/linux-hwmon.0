Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:34772 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750715AbdCHIcp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Mar 2017 03:32:45 -0500
Received: by mail-qk0-f195.google.com with SMTP id v125so8741767qkh.1
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Mar 2017 00:31:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170303091449.3512-1-carlo@caione.org>
References: <20170303091449.3512-1-carlo@caione.org>
From: Carlo Caione <carlo@caione.org>
Date: Wed, 8 Mar 2017 09:24:38 +0100
Message-ID: <CAOQ7t2bj29EG3z6uRQ=nBUeLXF4ODB4yayw3+Eohstg3aaA1_g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] scpi-sensors: Fix SCP sensor readings scale
To: Carlo Caione <carlo@caione.org>
Cc: jdelvare@suse.com, Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Linux Upstreaming Team <linux@endlessm.com>,
        Punit Agrawal <punit.agrawal@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Carlo Caione <carlo@endlessm.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Mar 3, 2017 at 10:14 AM, Carlo Caione <carlo@caione.org> wrote:
> From: Carlo Caione <carlo@endlessm.com>
>
> The implementation details for SCPI seems to suggest that the sensor
> readings must be reported by SCP using a well defined scale
> (millidegree Celsius for temperature, millivolts for voltage,
> milliamperes for current, microwatts for power and microjoules for
> energy).
>
> This is also important for the interaction with other subsystems: for
> example both the thermal sub-system and the hwmon sysfs interface expect
> the temperature expressed in millidegree Celsius.
>
> Unfortunately since this behaviour is dependent on the firmware
> implementation there are cases where the sensor readings are reported
> using a different scale. For example in the Amlogic SoCs the
> temperature is reported in degree and not millidegree Celsius.
>
> In this patchset we introduce a new DT property `scpi,sensors-scale` that is
> used by the scpi-hwmon driver to convert the sensor readings to the expected
> scale.
>
> v2:
>  - Added data validation (scale != 0)
>  - s/unsigned int/u32/ for the array
>  - Switched to array initialiser notation
>  - Introduced scpi_scale_reading()

gentle ping



-- 
Carlo Caione
