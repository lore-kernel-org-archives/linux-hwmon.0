Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380855;
	b=E31hksSJ4KCdiVLQxLEHRds2XrLeKXVeSC4MalWZX13XK6xLRxeD9Jry4aVSMjjl1r+j
	 haT2rV7c8o/01b2pC1vzNiTyAqdI1TOxMqjhz/D005/Un3kSp+TCAO/Cf8CHh4vAjXGZW
	 hzOfzQXzr4LXwxV5IA/cp0wzeop7mYpE7XCHRPO0ZGu1IdzEVx3DFQGsO2Yogb5W+J61M
	 A7zBP70QD5s/MWvjPltRSYDetl+6OMKnt96V/SJn7Zweg6xY6xRSOuWzfBXF1QOpXarnL
	 eT1ugCBtrK9Eh8fYYSvfCt1YC6DBBiWzcQh6FsWJDmuNnJxfeXSqqvsjD0JsEowxunw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380855;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=p7z+KmSzptEn38pg7PeFLGE32dCPLjcwqeC//Sa5oLc=;
	b=1cVg8yLtNx71JDVJSrsKCUYm06P3p3StMgBbvl0XowY2I5DAxTn3KXC0rDZDLh9ZEud1
	 gHTRVDGnidpm59liXNW6kOjNV+cRhUIvNj9BKBIYO/Kasw3DK044KXfVmejAttNudlVuM
	 FXp6qbRfz5ylXE8D37dgjQXst58RXobDGS3jD5dBjIyBgXnrPwFbxxtzxVeUNq4jqoitA
	 YArpt9y6i4H3Q15Wv3vj9mSXx42y65cxSfXf/idvXNxZv7IqV2jrh9kkkP0pu4ODl1ACa
	 Rh8jqXdPWBVRfB6Vou38o5/7Bh55SNzUkrkFpRAlAUNOLmx+lmwBuapohygMafr5Ngw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="E9lP3FS/";
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52EF606A320
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 20:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D52EF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=E9lP3FS/
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id UpNcxBugqOOJnVEZixza36; Sun, 22 Nov 2026 20:54:14 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VEZgxt20z3nNNVEZhxrs82; Sun, 22 Nov 2026 20:54:13 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6b035675
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=_jlGtV7tAAAA:8 a=j_DNJw53LGFIdKuy69YA:9 a=QEXdDO2ut3YA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=p7z+KmSzptEn38pg7PeFLGE32dCPLjcwqeC//Sa5oLc=; b=E9lP3FS/8nP0
	ZYsEjiY63kyWAetoCJktBvA2RCRZej5QcRvSjtPeXhT0H9cC7mvNIISL5ggHhNrFW1qcpAFJEnRPV
	oeFdbuwQbEolK8mRIMTZRGiN+WeNaJE4wv3njcQk55w7ZFhFazT3U4Fl5A5O99pkJXvcvXjNz3VDJ
	fcOm0imtbC0FSZuZ6HKEq8x/3DJFkH5BaXEZKRgRHihbyiRBTfXq1Iyuua+hAODkilgGBcr7/at1n
	7wSC1zhSqr55EdXH0X/Ceah81AIUgfUQX9KqEE04aO+ofnfHIqvNb02RlLRHyIUfuHdSN81TULGb9
	qRXnIn7Brm9LDqxKltyLgQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33860)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVEZf-000000002Ue-39SN;
	Mon, 23 Nov 2026 02:24:11 +0530
Message-ID: <ccb44fa4-b570-488b-8797-b9d520a09539@roeck-us.net>
Date: Sun, 22 Nov 2026 12:54:09 -0800
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (tmp401) add channel label support
To: Bruno Thomsen <bruno.thomsen@gmail.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261118174334.18759-1-bruno.thomsen@gmail.com>
 <20261118174334.18759-2-bruno.thomsen@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261118174334.18759-2-bruno.thomsen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVEZf-000000002Ue-39SN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:33860
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 23
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCbOayZdMy/l5xp/dz95hNzD19rKKn1WY60NPcrctb4l+ix+5ezngvs5lRRC1NPJA+rXr8Q3H/+zcZgMpnoC9XtkIGdZ5mb9eUUcvGOeaOZRwmJ+xm6C
 DGR88/rgnW8cPArTzIL61x5pgSTKkB0uJsxlai7uiWMfKlcJZyopollZzlOo//kyFMdnW/F0cyENAvlDnAZvZFAC1R0hke6j8iKDyIWZ4XLLpv5MS74bWK+M

On 11/18/26 09:43, Bruno Thomsen wrote:
> Read the optional per-channel label from the device tree and expose it
> through tempX_label, so user space can select a temperature sensor by
> the name the board gives it instead of hardcoding a sysfs index.
> 
> The channel index comes from the child node reg property. Reject a reg
> value that the detected chip does not implement, since only TMP432 has
> a second remote channel; accepting it would add a tempX_label with no
> matching tempX_input.
> 
> This mirrors what lm90 already does.
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2:
> - Fix continuation-line alignment in tmp401_read_string() reported by
>    checkpatch --strict.
> - Expand commit message: the channel index comes from the child node
>    reg property, and a reg value the detected chip does not implement is
>    rejected so no tempX_label is created without a tempX_input.
> - Skip child nodes not named "channel", as lm90 and tmp421 do.
> ---
>   drivers/hwmon/tmp401.c | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
> index 2fceeacdc88c..7b645d982c9a 100644
> --- a/drivers/hwmon/tmp401.c
> +++ b/drivers/hwmon/tmp401.c
> @@ -117,6 +117,7 @@ struct tmp401_data {
>   	struct hwmon_channel_info temp_info;
>   	const struct hwmon_channel_info *info[3];
>   	struct hwmon_chip_info chip;
> +	const char *channel_label[4];
>   };
>   
>   /* regmap */
> @@ -467,6 +468,16 @@ static int tmp401_read(struct device *dev, enum hwmon_sensor_types type,
>   	}
>   }
>   
> +static int tmp401_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, const char **str)
> +{
> +	struct tmp401_data *data = dev_get_drvdata(dev);
> +
> +	*str = data->channel_label[channel];
> +
> +	return 0;
> +}
> +
>   static int tmp401_write(struct device *dev, enum hwmon_sensor_types type,
>   			u32 attr, int channel, long val)
>   {
> @@ -502,6 +513,7 @@ static umode_t tmp401_is_visible(const void *data, enum hwmon_sensor_types type,
>   		case hwmon_temp_fault:
>   		case hwmon_temp_lowest:
>   		case hwmon_temp_highest:
> +		case hwmon_temp_label:
>   			return 0444;
>   		case hwmon_temp_min:
>   		case hwmon_temp_max:
> @@ -521,6 +533,7 @@ static umode_t tmp401_is_visible(const void *data, enum hwmon_sensor_types type,
>   static const struct hwmon_ops tmp401_ops = {
>   	.is_visible = tmp401_is_visible,
>   	.read = tmp401_read,
> +	.read_string = tmp401_read_string,
>   	.write = tmp401_write,
>   };
>   
> @@ -531,6 +544,7 @@ static int tmp401_init_client(struct tmp401_data *data)
>   	struct regmap *regmap = data->regmap;
>   	u32 config, config_orig;
>   	int ret;
> +	u32 ch;
>   	u32 val = 0;
>   	s32 nfactor = 0;
>   
> @@ -590,6 +604,28 @@ static int tmp401_init_client(struct tmp401_data *data)
>   			return ret;
>   	}
>   
> +	for_each_child_of_node_scoped(data->client->dev.of_node, child) {
> +		if (!of_node_name_eq(child, "channel"))
> +			continue;
> +		ret = of_property_read_u32(child, "reg", &ch);
> +		if (ret) {
> +			dev_err(&data->client->dev, "missing reg property of %pOFn\n", child);
> +			return ret;
> +		}
> +		if (ch >= ARRAY_SIZE(data->temp_channel_config) ||
> +		    !data->temp_channel_config[ch]) {
> +			dev_err(&data->client->dev, "invalid reg %u of %pOFn\n", ch, child);
> +			return -EINVAL;
> +		}
> +		ret = of_property_read_string(child, "label", &data->channel_label[ch]);
> +		if (ret == -ENODATA || ret == -EILSEQ) {
> +			dev_err(&data->client->dev, "invalid label property in %pOFn\n", child);
> +			return ret;
> +		}
> +		if (data->channel_label[ch])
> +			data->temp_channel_config[ch] |= HWMON_T_LABEL;
> +	}
> +
>   	return 0;
>   }
>   

