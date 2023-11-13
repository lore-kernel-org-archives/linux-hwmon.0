Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A32224CA
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Nov 2023 20:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BN802Sa1"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B03A910E0
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Nov 2023 12:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699906672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WHG7y6RDisjgRBKsr9b5mVEL+3CBXjyGr1DFkZoWxFc=;
	b=BN802Sa1GITASuKmN6jtbrGa6XOTzygNpDSwMNtOSHMbyj4MpEiS3MbDsHF5LHXeJlQFuk
	IApnwVhD0bd8B5IvcxR1/9U76dwTn1x2UE9sth9JpWd4+LlsXDsJUwqt3fyvgpxlkeBerM
	5PZ57mku8rsyIeIJ2NQ7u789i9im8+I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-uWd12nE4OvaGCFlCIb0UCw-1; Mon, 13 Nov 2023 15:17:51 -0500
X-MC-Unique: uWd12nE4OvaGCFlCIb0UCw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5402e97fdd1so3243273a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Nov 2023 12:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906670; x=1700511470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHG7y6RDisjgRBKsr9b5mVEL+3CBXjyGr1DFkZoWxFc=;
        b=gYCvHXwHcuLwctja5H3mHG+kq293nVlZYu7lQV4cLA3uSpHD8bLnFIKy7xx5yO+tU3
         eBntaYm0hQQg+HD67lz8/S8vWgnIa4SmJl5SKnBKUcgWAERQEASIBw39XYbPDOk/bnfe
         D7pOfvM7vNfw3Hr3DF3W4zz+meoOKfHbsEt+43xUg1qJgTXpQpeDnjrUMSUPtaZnZ4GI
         q9HRtG5+CltsN5Sj0BdJfFnbxy+k+ligo6LP0XcbGYOff6iftSlVKtpV4Oomj2Yqwo3j
         MnJmQPG82amOBQYl1sSdrbStoGsi/Ok+nThmlTIof+Vd1UxCv3EQdwbL5pxcFoelVX3N
         W3SA==
X-Gm-Message-State: AOJu0YySQlKbL6Re5oRk/8IDXApulzpy8HgBNZeKplwRfLI/974uVp8P
	yfe9iNnPpeesGPu+Bk2bAirq5np6+gmYJAkmNtk/OEltz/+SbDluzVClez1Lj/wAfJDm/sser0W
	OvDC6HlYX01VI2MSXpWWsDFs=
X-Received: by 2002:aa7:d555:0:b0:546:d0b7:f4e4 with SMTP id u21-20020aa7d555000000b00546d0b7f4e4mr5720412edr.8.1699906670246;
        Mon, 13 Nov 2023 12:17:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ31+bJ3bnZRU8DicZJd+AsZ1d8QMmiId8Sfli7YEux00xVSQkU/oZU9dAgygaDj14tUz0kA==
X-Received: by 2002:aa7:d555:0:b0:546:d0b7:f4e4 with SMTP id u21-20020aa7d555000000b00546d0b7f4e4mr5720398edr.8.1699906669927;
        Mon, 13 Nov 2023 12:17:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d22-20020a50cd56000000b0054719a2a0cdsm3696000edj.16.2023.11.13.12.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 12:17:49 -0800 (PST)
Message-ID: <8c25dfec-b0ca-4e2f-964a-5ae62452e141@redhat.com>
Date: Mon, 13 Nov 2023 21:17:48 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] hwmon: (dell-smm) Add support for WMI SMM
 interface
To: Armin Wolf <W_Armin@gmx.de>, pali@kernel.org
Cc: markgross@kernel.org, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231106064351.42347-1-W_Armin@gmx.de>
 <3ec0496d-3b89-46f5-9faf-9fcce78f6b38@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3ec0496d-3b89-46f5-9faf-9fcce78f6b38@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Armin,

On 11/13/23 20:55, Armin Wolf wrote:
> Am 06.11.23 um 07:43 schrieb Armin Wolf:
> 
>> This patch series adds support for an alternative SMM calling
>> backend to the dell-smm-hwmon driver. The reason for this is
>> that on some modern machines, the legacy SMM calling interface
>> does not work anymore and the SMM handler can be called over
>> ACPI WMI instead.
>>
>> The first four patches prepare the driver by allowing to
>> specify different SMM calling backends, and by moving most of
>> the DMI handling into i8k_init() so that the DMI tables can
>> keep their __initconst attributes (the WMI SMM backend driver
>> does not probe at module init time). The fifth patch does some
>> minor cleanup, while the next three patches implement the new
>> WMI SMM calling backend. The last patch adds the machine of
>> the user who requested and tested the changes to the fan control
>> whitelist.
>>
>> If the driver does not detect the legacy SMM interface, either
>> because the machine is not whitelisted or because the SMM handler
>> does not react, it registers an WMI driver which will then bound
>> to the WMI SMM interface and do the remaining initialization.
>>
>> The deprecated procfs interface is not supported when using the
>> WMI SMM calling backend for the following reason: the WMI driver
>> can potentially be instantiated multiple times while the deprectated
>> procfs interface cannot. This should not cause any regressions
>> because on machines supporting only the WMI SMM interface, the
>> driver would, until now, not load anyway.
>>
>> All patches where tested on a Dell Inspiron 3505 and a Dell
>> OptiPlex 7000.
> 
> Any thoughts on this?

I was waiting for the merge window to close before
reviewing / merging patches for the next cycle.

I plan to review and hopefully merge this and your
other series sometime this week.

Regards,

Hans


