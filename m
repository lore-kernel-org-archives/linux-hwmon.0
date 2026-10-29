Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299268;
	b=Gmyxs9vwGc1wHlNyc8aPwkk2vQQhgpc5FAQejdmkqmPwdvCQxLGTHtNiGdEWmTw6HVRc
	 QhowkLIX/vu2e+dJDSxqG5iBzWLyzziRiboUXqar3ruCSQwdv6MU4MAmUMqaqRHdCJa1X
	 IZMwu2PU/si7gkHZvv/7/Y1/zTI9RRT/g+3nn2tIIkYRy1b+aymhw8tqi+nV6hh0bPOtj
	 XCXng2zchiIdcVxLwOQpHNPZHWhcWciS6lOm56Z8NvEQigdIXmWF2xpMSL4Q8QOhCarlZ
	 KGx0ugEpKrlD7H4zQb0K32jZ5Hr4QUy1rr35VqD4oJ+UL2lXukKnqL7WwK/i7MFpHwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299268;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=9vK1deUTXK/y3Hi9K4zry1UKt7wbPjc8mIdpL3qyBp8=;
	b=TvgUNhzNHzBlladSZmj61yG9viP9LYbjMk6DjUlR8cKtibM83jns4VEqWHvX+yOpBQ9w
	 n2hgVa+cbbVXkw9h4v4uTwW7JKLrYbbbxji7lWiIKdVmhP6Fo+I5tfYqZf55RqvPIygZx
	 wbcrpk2LIAw2DqWdc4a6mtFi5ZVikrSTNoM696+umZhbAYpuzdjxS9hd5ICk4K67qn1nD
	 9HQFWFmWw1XtqNEjQ7XiprIwiB9uiFWSyNER9mVT0c2OIYOwmBEZM9aXMce8IPEFVPhpP
	 pw+r9ujhHeIvmq7BYPqHe2wPMJB+SWmslvsyJ2O+APUfmZJ/oAMtZtQPyk3IGTqKoMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=p7Z+Fwae;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACF7606A325
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 18:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACF7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=p7Z+Fwae
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id MUUoxBt9hMylkMV3ixYaS7; Thu, 29 Oct 2026 18:41:06 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MV3hxGbchNSXiMV3ixtHEy; Thu, 29 Oct 2026 18:41:06 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae39342
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=QDHc5EiPAAAA:8 a=pGLkceISAAAA:8 a=thwpLOCkb8s1nxjj4G8A:9 a=QEXdDO2ut3YA:10
 a=59RwALqDKVzMjVMkmKwL:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=9vK1deUTXK/y3Hi9K4zry1UKt7wbPjc8mIdpL3qyBp8=; b=p7Z+Fwaess5Q
	edFXite4iBUsCHkc3AP/uZIkmuWOd/1mqkLCw8yRa26+7hdXKNvd3cjVbhJotLvN0iCeuGW85XMxK
	eps0pUOATBSfFEoBmBthZc2D+4RrkrBkrw5eEyXz6mn3ZyHL5PwWgAUcObU3YhHRN7loBL4zawy1R
	6P0TCIri7UBcsHQhIWKFMlwF+hiWVOFXcSwyV14eYOIEkIES2Swxc/wfsVL7Y1S71sub3h55d+3y9
	8sGzZkhqnkCVniqgOlYT36NZmf5wrAJljZIXCf7IG+r5mU++FAGAQTQHeO8dHv4P0nw45RMfjmYZB
	7yJ8xoIswbyUry0Lv14eFA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33238)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMV3h-00000002uuh-235h;
	Fri, 30 Oct 2026 00:11:05 +0530
Message-ID: <b694a150-6bca-4070-a025-ab3520bc2a87@roeck-us.net>
Date: Thu, 29 Oct 2026 11:41:04 -0700
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
Subject: Re: [PATCH v2 0/2] ACPI: EC / hwmon: (asus-ec-sensors) use ec.c for
 the MAXIMUS IX EXTREME second EC
To: remy@demangeot.net, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20261029-m9e-ec2-v2-0-e9c4e2ba8415@demangeot.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261029-m9e-ec2-v2-0-e9c4e2ba8415@demangeot.net>
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
X-Exim-ID: 1xMV3h-00000002uuh-235h
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:33238
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfN0A32HGAkQW1YuC0XPHvP+zYvlGZ2tBZIM/a1Ly8oUfme+DtN4BEf/WtpgXBP7WvrzqfQyyxuoCUTfyu5wdvKNWQ30nLnL3bD8cYPYq1jQ8492I/YRu
 xVbsJ7VPMiYI9JVyQ+LTSwSqQE7NgqsY63sGbk5kfcXBKZUwOKYgVwHO4RrZAXSfTJm5F+jp7uZOikdiUZB0eNbLN8+6u9EhtJwYF8laj0ZNifMWW9ilzXh9

On 10/29/26 00:48, Remy Demangeot via B4 Relay wrote:
> This replaces patch 3/3 of the series "hwmon: (asus-ec-sensors) more
> MAXIMUS IX EXTREME sensors" [1]. Patches 1/3 and 2/3 of that series
> only use the main EC and are unchanged.
> 
> Eugene asked to operate the second EC through drivers/acpi/ec.c rather
> than re-implementing the EC protocol in the driver [2]. Patch 1 adds a
> small API to ec.c for an EC that is not described in the ACPI tables:
> acpi_ec_create_polled() / acpi_ec_destroy_polled() and byte accessors.
> Such an EC only uses busy polling: no GPE, no IRQ, no query events and
> no address space handler. Patch 2 uses it in asus-ec-sensors.
> 
> To answer Armin's question [3]: no, this EC is not described in the
> ACPI tables of this board (BIOS 1501). There is no PNP0C09 device for
> it; only the WMI method \_SB.AMW0.WLDF writes to ports 0x68/0x6c
> directly, without taking any lock. The other PNP0C09 device, H_EC, is
> a reference-code stub whose _STA returns 0.
> 
> Guenter, please drop v1 3/3: it sorted the sensor banks as signed

Dropped, but please next time provide the patch subject. I understand you
know what that was, but I already had 80 patches queued for 7.5, including
five for this driver. I dropped what I _think_ was patch 3/3, which is
the water temperature patch. If that is not what you intended, please resend
everything that is not already in the mainline kernel.

Guenter
> values, so the second EC bank came first, the second EC was never set
> up, and no sensor of the board could be read anymore. This is fixed in
> patch 2 and was found while testing this series.
> 
> Both patches were tested on a MAXIMUS IX EXTREME with Secure Boot
> enabled: the four water temperatures read correctly, 300
> consecutive reads gave no error, and the I/O ports are released and
> requested again when the module is reloaded.
> 
> Patch 1 needs an ack from the ACPI side; patch 2 depends on it.
> 
> [1] https://lore.kernel.org/r/20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net
> [2] https://lore.kernel.org/r/CAB95QAQaogxV6KO5kpv9RBpzhhmH_N3Dvvy=nqWHOG6qAQB_aw@mail.gmail.com
> [3] Armin Wolf, reply to v1 3/3, 28 Oct 2026
> 
> ---
> Remy Demangeot (2):
>        ACPI: EC: allow drivers to create a polled EC
>        hwmon: (asus-ec-sensors) add water temperatures for MAXIMUS IX EXTREME
> 
>   drivers/acpi/ec.c               |  89 ++++++++++++++++++++++++++++++++-
>   drivers/hwmon/asus-ec-sensors.c | 108 ++++++++++++++++++++++++++++++++++------
>   include/linux/acpi.h            |   8 +++
>   3 files changed, 189 insertions(+), 16 deletions(-)
> ---
> base-commit: b27578907b9dd74db5e9b397bf063c43719c162b
> change-id: 20261029-m9e-ec2-68fad8c08d5a
> 
> Best regards,

