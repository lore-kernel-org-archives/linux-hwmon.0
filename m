Return-Path: <SRS0=/An6=SW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74B7C282DD
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 Apr 2019 17:31:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A21DE20833
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 Apr 2019 17:31:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNppWKLC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbfDTRbI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 20 Apr 2019 13:31:08 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34608 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfDTRbH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 20 Apr 2019 13:31:07 -0400
Received: by mail-pf1-f195.google.com with SMTP id b3so3874231pfd.1
        for <linux-hwmon@vger.kernel.org>; Sat, 20 Apr 2019 10:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TRrNsMn2PjiTM/pvb9l6HPAVzDmQwKwbqjCGjYXJTWk=;
        b=eNppWKLCYlpzwBN4jopYZYFQqBInDyvHpWCBdtbGiV8g5PRWseULygBXeCCkcols7i
         c8+nnawOfMmzCFpZo4aQVxfls95+PXcvFEzqKzMFpAEZJIpxjNLA2XZ7GTs57gTD3TLG
         PGV0+gaeqmgmEZJ9b13zCFHWtehdSBy2bVWnbSZlvMu2VZEWbrMo0wEvrgeCcHpN0eej
         fp7YUrDE4jLQt7o4bTwLHcWIgk2pw0B+bqRJSUZc1unkCvIROx30TmAzzELLLENIkHOG
         eIPPLIPMW8hSZyPOpkh7icw6YnEnRo0S1Y3LlFhJktpP3NKh+zYXmgxo3FXhhF4ieSlc
         kZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TRrNsMn2PjiTM/pvb9l6HPAVzDmQwKwbqjCGjYXJTWk=;
        b=CwhVfej97MpfAXygx80J/xTu+dGhAp/lvtdNOe+aCaX3Von8gjDqHpCcA1HObID2q5
         UGTFHGNt5JzyJhpWyDivbgFWWK61qa/umuWEOhs0+Aoq8eZIBmORUiM6fHS9WMXokPPI
         NhPCarBSq13qhsYpJcyUgogeZHymQ+uqA8ywIo32YaHtvgeeXGa241/Xyw/jgFoh/dMv
         zEhMU56PmVKUBkukE4FAj0Zl66c8m+ldQ34Hbl16ctZSdp8XX2KOqQmuB6TY2CgR+LT/
         vr+OzWAcnzPKh5DuieFOvJT+0TtXkJgEYMFS+J0KEtZb+LpsvWr7nM/R0J4HHQiC8LWO
         QB1g==
X-Gm-Message-State: APjAAAXaOgvnVxZX/X1oqe1hujiN4sbgW6+KLAvptLEWUex1udxLicsU
        BmWyf5pNIX3eYdkM5pUUkEA=
X-Google-Smtp-Source: APXvYqwl+xnCWlWszqeTZjwhRtaPTpH+MZCaRLSMGeba5odthPU/4oz9nyPan/XaMuWH7BM2pCcvIw==
X-Received: by 2002:a62:6402:: with SMTP id y2mr11162988pfb.194.1555781466747;
        Sat, 20 Apr 2019 10:31:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f2sm12731593pgc.30.2019.04.20.10.31.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 Apr 2019 10:31:06 -0700 (PDT)
Subject: Re: SCMI sensor reads unit scaling
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-hwmon@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <9207bc01-e0c6-ef73-6a24-6deda7b789c5@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7d23066b-fd45-1784-3c2a-7e44eeae63bf@roeck-us.net>
Date:   Sat, 20 Apr 2019 10:31:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9207bc01-e0c6-ef73-6a24-6deda7b789c5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/20/19 9:43 AM, Florian Fainelli wrote:
> Hi Sudeep, Guenter,
> 
> The current SCMI hwmon support does not seem to make use of the sensor
> scale/unit as defined in the sensor replies (or the update scale for
> that matter).
> 
> I came up with the patch below which gets the job done, but I am worried
> about possibly breaking people's SCMI deployments and sensors reading
> because they may have intentionally or not already decided to return a
> value which is scaled the way Linux's hwmon expect it, and may, or may
> not have populated a valid unit number in the sensor reply.
> 
> Ideally we should probably do two conversions:
> 
> - from within scmi_sensor_reading_get(), scale the value as indicated by
> the reply
> - from within scmi_hwmon_read(), take that scaled value and apply the
> necessary conversion expected by Linux's HWMON conventions (e.g.:
> reporting voltage as mV values)
> 
> What do you think?
> 

Reported values have to follow HWMON conventions. If not, this is a bug
and needs to get fixed. The argument about not changing the userspace ABI
does not apply to bugs.

Guenter

> ---
> From: Florian Fainelli <f.fainelli@gmail.com>
> Subject: firmware: arm_scmi: Support sensor scaling
> 
> The SCMI sensor management protocol includes the following provision:
> 
> The power-of-10 multiplier in two’s-complement format that is applied to
> the sensor unit specified by the SensorType field.
> 
> Add support for scaling the value returned based on what is provided by
> the firmware. This requires us to be able to look up a sensor identifier
> to its backing scmi_sensor_info structure and apply the necessary scale.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>   drivers/firmware/arm_scmi/sensors.c | 37
> ++++++++++++++++++++++++++++++++++++-
>   include/linux/scmi_protocol.h       |  1 +
>   2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/sensors.c
> b/drivers/firmware/arm_scmi/sensors.c
> index bbb469f..2eccc6a 100644
> --- a/drivers/firmware/arm_scmi/sensors.c
> +++ b/drivers/firmware/arm_scmi/sensors.c
> @@ -33,7 +33,8 @@ struct scmi_msg_resp_sensor_description {
>   #define NUM_TRIP_POINTS(x)	(((x) >> 4) & 0xff)
>   		__le32 attributes_high;
>   #define SENSOR_TYPE(x)		((x) & 0xff)
> -#define SENSOR_SCALE(x)		(((x) >> 11) & 0x3f)
> +#define SENSOR_SCALE_MASK	0x3f
> +#define SENSOR_SCALE(x)		(((x) >> 11) & SENSOR_SCALE_MASK)
>   #define SENSOR_UPDATE_SCALE(x)	(((x) >> 22) & 0x1f)
>   #define SENSOR_UPDATE_BASE(x)	(((x) >> 27) & 0x1f)
>   		    u8 name[SCMI_MAX_STR_SIZE];
> @@ -72,6 +73,35 @@ struct sensors_info {
>   	struct scmi_sensor_info *sensors;
>   };
> 
> +static
> +struct scmi_sensor_info *scmi_sensor_info_from_id(struct sensors_info *si,
> +						  u32 sensor_id)
> +{
> +	struct scmi_sensor_info *s = NULL;
> +	int i;
> +
> +	for (i = 0; i < si->num_sensors; i++) {
> +		s = &si->sensors[i];
> +		if (s->id == sensor_id)
> +			return s;
> +	}
> +
> +	return s;
> +}
> +
> +static void inline scmi_scale_value(u8 scale, u64 *value)
> +{
> +	unsigned int i;
> +
> +	if (scale & ((SENSOR_SCALE_MASK + 1) >> 1)) {
> +		for (i = 0; i < (~scale) + 1; i++)
> +			*value /= 10;
> +	} else {
> +		for (i = 0; i < scale; i++)
> +			*value *= 10;
> +	}
> +}
> +
>   static int scmi_sensor_attributes_get(const struct scmi_handle *handle,
>   				      struct sensors_info *si)
>   {
> @@ -140,6 +170,7 @@ static int scmi_sensor_description_get(const struct
> scmi_handle *handle,
>   			s = &si->sensors[desc_index + cnt];
>   			s->id = le32_to_cpu(buf->desc[cnt].id);
>   			s->type = SENSOR_TYPE(attrh);
> +			s->scale = SENSOR_SCALE(attrh);
>   			memcpy(s->name, buf->desc[cnt].name, SCMI_MAX_STR_SIZE);
>   		}
> 
> @@ -205,6 +236,8 @@ static int scmi_sensor_trip_point_set(const struct
> scmi_handle *handle,
>   static int scmi_sensor_reading_get(const struct scmi_handle *handle,
>   				   u32 sensor_id, bool async, u64 *value)
>   {
> +	struct sensors_info *si = handle->sensor_priv;
> +	struct scmi_sensor_info *s = scmi_sensor_info_from_id(si, sensor_id);
>   	int ret;
>   	struct scmi_xfer *t;
>   	struct scmi_msg_sensor_reading_get *sensor;
> @@ -225,6 +258,8 @@ static int scmi_sensor_reading_get(const struct
> scmi_handle *handle,
> 
>   		*value = le32_to_cpu(*pval);
>   		*value |= (u64)le32_to_cpu(*(pval + 1)) << 32;
> +		if (s && s->scale)
> +			scmi_scale_value(s->scale, value);
>   	}
> 
>   	scmi_one_xfer_put(handle, t);
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index b458c87..782b53e 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -140,6 +140,7 @@ struct scmi_power_ops {
>   struct scmi_sensor_info {
>   	u32 id;
>   	u8 type;
> +	u8 scale;
>   	char name[SCMI_MAX_STR_SIZE];
>   };
> 

