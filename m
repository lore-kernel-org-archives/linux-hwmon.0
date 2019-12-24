Return-Path: <SRS0=lH8M=2O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DFBC2D0C3
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 19:57:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03695206D3
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 19:57:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyP7ZqGT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbfLXT5P (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Dec 2019 14:57:15 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54880 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbfLXT5P (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Dec 2019 14:57:15 -0500
Received: by mail-pj1-f65.google.com with SMTP id kx11so1530226pjb.4
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Dec 2019 11:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U7GaDnjI9d6XSeprKqeGIxIvaGAdOfVr6pC/XUOyjJk=;
        b=HyP7ZqGTnIhrkX2j3oKyW5krLwXLYSxIfNCY2vASWknYy2m20rLtd8KY3dDSBRFJ3p
         JEGC5g5u5N6GGfGyhwRjCRsomw8L7gLBeJc+uXnz8EGoAL5yNNTZsZW3gl2i/bupx+/f
         hJbLfpSCNQvWi00E74USuJlsDukJbAHH0WbEXnPJ/x76vlpMP66MwjGPLIuun1VunLot
         BRrbuUxBA4DBhz77iCZcSaJGeF0o4YyBy6U2VwIRIdkIO9o+2eVsbCYEoaruXfT+Kips
         v3AamVA17r97zioQaDkazugHQokYzO5bRyJ576o4fjg8Rss3FuRm0HiT6iJYigfiPfTW
         NfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U7GaDnjI9d6XSeprKqeGIxIvaGAdOfVr6pC/XUOyjJk=;
        b=UJMUCGRmuaMy2qPFEYF6uNWAzwhGTkbTKJJcfy3IAZtNgi+O5+tETcLPrI4pzEiqys
         wjN7ria9Vo4zEq642qcJImhSf7n/mZOvCjuyslPNFRzT7vvqgqilWRPktCE8vlUGPW3n
         w9QF5YWIPW1XD2npX5rW/6hjGzCdOLFqRSl2F02SYot/l/ik/M+xAT0eh2O0jkUhorra
         ngTq56JiU8yX7K8IEMsua1ovINkTRrI0LWaDHjItv/IAYt0EGYNHduKvh5juocfaayW8
         YxZ2kjXFQtc9/NFj3ZDtLZa1fZXx7N+Nlb70DQojs1w1Fe+/Vfyd7rdN8PWM35jAfFuU
         HC3w==
X-Gm-Message-State: APjAAAUY0aJcYtZpiyLs6tCVAANVeSG7CbO74F1+dh9gCB9Qt6IesWlc
        xD8M4ZSZ/kh7Ogk0MFBoWKdiIB+L
X-Google-Smtp-Source: APXvYqxPkZfJj/CmStYae3xLdEC1W8ZYlVbqRGoYiWM/qxwoOChTwsc4wzbmiU9fyy1lraQzLb5NqA==
X-Received: by 2002:a17:902:9003:: with SMTP id a3mr8169965plp.224.1577217434584;
        Tue, 24 Dec 2019 11:57:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h126sm4311815pfe.19.2019.12.24.11.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2019 11:57:13 -0800 (PST)
Subject: Re: kernel 5.4.6 + Ryzen 3700X: "Can't display frequency and others
 of Ryzen7 3700X"
To:     pgnet.dev@gmail.com, linux-hwmon@vger.kernel.org
Cc:     marcel.p.bocu@gmail.com
References: <bb629ef6-a669-8849-17f4-481c8c9f9347@gmail.com>
 <b2f72e65-4a80-0aaf-ce7e-0880fdcf60c7@roeck-us.net>
 <2c858787-1e5e-77e4-30ef-f17036b205c2@gmail.com>
 <121bee85-6369-4b32-2504-c1d104ea2bd6@roeck-us.net>
 <4a1e2dc9-3303-8dd5-7bbd-3605a43bffe1@gmail.com>
 <34008d92-9709-786e-5c76-007edffe0a7c@roeck-us.net>
 <bf771959-f19b-1abb-7d94-bb5f65c68952@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <5400ddb2-c70d-11b4-4414-158c7c40afa5@roeck-us.net>
Date:   Tue, 24 Dec 2019 11:57:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <bf771959-f19b-1abb-7d94-bb5f65c68952@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/24/19 9:14 AM, PGNet Dev wrote:
> On 12/24/19 8:29 AM, Guenter Roeck wrote:
>> The problem is - most likely - that the BIOS (or, rather, ACPI) accesses the
>> same memory range, and there is no synchronization. You could try to boot with
>> "acpi_enforce_resources=lax" command line option, but that would be on your
>> own risk, and some recent boards don't even boot if that command line option
>> is present.
>>
>> You should not try to load the it87 driver on ASUS boards.
>>
>> Did you try to load "asus_atk0110" ?
> 
> Had earlier come upon this,
> 
> 	Nuvoton nct6798d not detected #197
> 	 https://github.com/lm-sensors/lm-sensors/issues/197
> 
> re: the add'n of
> 
> 	acpi_enforce_resources=lax
> 
> and was just adding that to my grub kernel config.
> 
> just in case also added,
> 
> 	cat /etc/modules-load.d/sensors.conf
> 		msr
> 		k10temp
> 		nct6775
> +		asus_atk0110
> 
> now on reboot, I no longer see those^^ earlier conflict warnings; I _do_ see now,
> 
> 	...
> 	[    0.233419] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
> 	[    2.484532] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
> 	[    2.489504] ACPI: This conflict may cause random problems and system instability
> 	[    2.492038] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
> 	[    2.513650] asus_atk0110: Resources not safely usable due to acpi_enforce_resources kernel parameter
> 	[    2.540469] acpi PNP0C14:02: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9421164 (first instance was on PNP0C14:01)
> 	[    2.543119] acpi PNP0C14:03: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9421164 (first instance was on PNP0C14:01)
> 	[    2.559449] ACPI: bus type USB registered
> 	[   13.553990] asus_atk0110: Resources not safely usable due to acpi_enforce_resources kernel parameter
> 	[   14.609097] acpi_cpufreq: overriding BIOS provided _PSD data
> 	[   14.610845] ACPI: Power Button [PWRB]
> 	[   14.611600] ACPI: Power Button [PWRF]
> 	[   14.633620] asus_atk0110: Resources not safely usable due to acpi_enforce_resources kernel parameter
> 	[   15.451860] asus_atk0110: Resources not safely usable due to acpi_enforce_resources kernel parameter
> 	...
> 
> Seems `acpi_enforce_resources` and `asus_atk0110` don't play nicely?
> 
> AND, `sensors` certainly appears a bit more informative/useful!
> 
> 	sensors
> 		k10temp-pci-00c3
> 		Adapter: PCI adapter
> 		Tdie:         +55.2°C  (high = +70.0°C)
> 		Tctl:         +55.2°C
> 
> 		nct6798-isa-0290
> 		Adapter: ISA adapter
> 		in0:                   504.00 mV (min =  +0.00 V, max =  +1.74 V)
> 		in1:                     1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		in2:                     3.34 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		in3:                     3.34 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		in4:                   1000.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		in5:                   816.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		in6:                     1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		in7:                     3.34 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		in8:                     3.25 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		in9:                   896.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		in10:                  408.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		in11:                  544.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		in12:                    1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		in13:                  1000.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		in14:                  1000.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> 		fan1:                  1218 RPM  (min =    0 RPM)
> 		fan2:                  1917 RPM  (min =    0 RPM)
> 		fan3:                   905 RPM  (min =    0 RPM)
> 		fan4:                  1190 RPM  (min =    0 RPM)
> 		fan5:                     0 RPM  (min =    0 RPM)
> 		fan6:                     0 RPM  (min =    0 RPM)
> 		fan7:                     0 RPM  (min =    0 RPM)
> 		SYSTIN:                 +36.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
> 		CPUTIN:                 +32.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
> 		AUXTIN0:                +25.0°C    sensor = thermistor
> 		AUXTIN1:                +36.0°C    sensor = thermistor
> 		AUXTIN2:                +21.0°C    sensor = thermistor
> 		AUXTIN3:                +26.0°C    sensor = thermistor
> 		PCH_CHIP_CPU_MAX_TEMP:   +0.0°C
> 		PCH_CHIP_TEMP:           +0.0°C
> 		PCH_CPU_TEMP:            +0.0°C
> 		PCH_MCH_TEMP:            +0.0°C
> 		intrusion0:            ALARM
> 		intrusion1:            ALARM
> 		beep_enable:           disabled
> 
> , with ALL of those now available to desktop utils such as KDE's (slightly broken) ThermalMonitor plasma widget ... (need to figure out which of those are the CPU, vs Mobo, fan/temp sensors)
> 
> I don't know what, if any, issues are introducted by the use of `acpi_enforce_resources=lax` ...
> This _is_ just a workaround, yes?  I.e., BIOS still should have a fix?
> 

The BIOS does exactly what the board vendor wants it to do: Reject direct access
to the Super-IO chip. The board vendor wants you to access the chip through ACPI,
ie with asus_atk0110. Unfortunately, it looks like the board vendor also
changed the ACPI data sufficiently enough to make that driver not work for
your board (assuming you tried loading it without acpi_enforce_resources=lax).

There is nothing we can do about that unless the board vendor provides the information
necessary to interpret the DSDT, or someone spends the time to reverse engineer it.

Guenter
