Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339635;
	b=dDcMWR9XOImBaMqEeHgNyNoARSldqPxNHQjtqcyT14v5AqAymlhvnCeFYSRV1UvJDtBc
	 kVv861CRhdZMvj8NWaPXLeHjdCb7V+3zK3wJ0JXGurRWdNceOKH0myqwAgdYEt29ag0ke
	 QJ8U4qiDknv1APcIAGc42JfSLfbtpIVXJtTyIEapU5FskprvcAIQDSvuHOdcStOZcx8jL
	 YA7PZIxUeqe0Sg99hYzSd5G8UqiFFwW/ZSplfmzSDt4vI2XEHIDPZYlctNab25UlkVCKT
	 2waZ7KwcuRjBILiUdSqSPVQrv1+oYcXx2zxmEtioRZZfZDjHLZFXGCf4KwXeMoaJWog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339635;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=h7eUG7K11n3m4U+L0FecRBF2/iUayUPH8aBAj8BzNtE=;
	b=1fFWheVuhyxPUYkHQ41pfHIhGCMK8zMWurF6s7fiff0EPM43u5ugP6KQ4eFHB+C714ZE
	 voOFq5mGKslitMO5RyzP3QfT25oqgofWQ8Qn4LSYq5iQeuFJVF1CHXPMaD/fNyw7JFQIp
	 djMgI3/OoVSCPLnIsAdUDoip6AWtYXJ7ERkbCV/5A/CpuZkdOrPYOU4OdcaN406IXthqW
	 c0UKwmkhQJoOEcqvUotRCkndHnF3QSEn919cgXWHD8LRF3X6WU31LDFIsomW0GHaizHU2
	 npJ0jaeR9K9DgegkB4f/LXJBblJ/hCcUGfE+XaDkAEpRLvkIUHSpOlLsSMgbvzCsjOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rWClFild;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C86606A32A
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 19:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C86606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rWClFild
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id QkWFxvrQmVK9UQrhqx8O34; Tue, 10 Nov 2026 19:40:34 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QrhpxWmjqxqjjQrhqxjnWf; Tue, 10 Nov 2026 19:40:34 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6af37332
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=_jlGtV7tAAAA:8 a=Pbzasi2esYBJbdekaeMA:9 a=QEXdDO2ut3YA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=h7eUG7K11n3m4U+L0FecRBF2/iUayUPH8aBAj8BzNtE=; b=rWClFilddLSa
	sb+vmWPYwIl82i+fgCWzddkwgMPnTR7vGIY7Wd56BCLFxAmh1en1TsM1ZjayfZWrXxD1/tDA0++HV
	85nGOApUKyPDRN70cIEODHy0GfRMRuKxWqzaDWY1yEl/wfx2pQGvBfyhBTZvUiy2HUcr+6meGOOCf
	p9YXoMzbX4Ta/TkEGizNR1b2px4sKAiQL7wqZ61+/Rh73M0Ys5pqlDRdxxGyxnQqscShC9QBjLgcX
	XsjGwa2D14/aD+n0mfYRkWZmfAMFU/hZ4HekaXqsqu9e0RZUN9R+RNW6NS7zlZSvINEx+Sg//5mrM
	CPVC52X2hyJst/MT8toNvQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50166)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQrhp-00000003utZ-2UKL;
	Wed, 11 Nov 2026 01:10:33 +0530
Message-ID: <1b3d9355-2cf0-40b3-b8d3-ac1b5984cd7d@roeck-us.net>
Date: Tue, 10 Nov 2026 11:40:32 -0800
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
Subject: Re: [PATCH 01/10] hwmon: (ads7828) Drop platform data support
To: Arnd Bergmann <arnd@arndb.de>, linux-hwmon@vger.kernel.org
References: <20261110183434.181711-1-linux@roeck-us.net>
 <20261110183434.181711-2-linux@roeck-us.net>
 <966198d5-9789-4505-b1cc-670bf035a358@app.fastmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <966198d5-9789-4505-b1cc-670bf035a358@app.fastmail.com>
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
X-Exim-ID: 1xQrhp-00000003utZ-2UKL
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:50166
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfECBcyKkUiqN8yY/FyEXcVwyVnLF05GjInhjsj6uslC91Kf5Tp3PwhFIrUAfdAOIDRNXcfHzCnJ9tFUruzSZ5DWfkGCTMUm2kpBQUd3yDwwas3KVZXGO
 eGfJjr9fV/o6qZ2ESID09wwywDvETtvZb061vlZfxDrJoHizsfssb+YJcyqNs1GX7I7As55cZKCiVtUA6fNUa8into4MRDTXom6YmdOvdSM7DJT8QXs4QZ+P

On 11/10/26 10:45, Arnd Bergmann wrote:
> On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
>> There are no in-tree users of ads7828_platform_data. The driver already
>> supports configuring differential input mode and external reference
>> voltage via devicetree properties ("ti,differential-input" and the
>> "vref" regulator supply).
>>
>> Drop platform data support from the driver, remove the unused
>> platform_data header file, and update the driver documentation.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> My patch is almost the same, with two minor differences:
> 

Did you copy me (or linux-hwmon) on your series ? I don't recall seeing it.
Sorry, I didn't mean to duplicate your work. I'll look it up and apply
your patches instead where possible.

Guenter

> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?h=board-remove-7.4&id=94ec070cdb5fdfbcd22d5533970423ecaf7b3e4a
> 
>> -	} else if (dev->of_node) {
>> +	if (dev->of_node) {
>>   		diff_input = of_property_read_bool(dev->of_node,
>>   						   "ti,differential-input");
> 
> Since only DT support remains, I removed the check for of_node here,
> and also the conditional on the match table:
> 
> @@ -199,7 +190,7 @@ MODULE_DEVICE_TABLE(of, ads7828_of_match);
>   static struct i2c_driver ads7828_driver = {
>          .driver = {
>                  .name = "ads7828",
> -               .of_match_table = of_match_ptr(ads7828_of_match),
> +               .of_match_table = ads7828_of_match,
>          },
>   
>          .id_table = ads7828_device_ids,
> 
> I hope to eventually remove all of those, but there is no need
> to respin your patch just for that.
> 
>        Arnd

