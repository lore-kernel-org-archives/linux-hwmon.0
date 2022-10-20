Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BFEC433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Oct 2022 20:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiJTUEe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Oct 2022 16:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbiJTUE3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Oct 2022 16:04:29 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6A0BF4A
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Oct 2022 13:04:26 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id e18so1211422edj.3
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Oct 2022 13:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SvrUrMjp0M2a318iN9ulg5rBArlaCJFsr2ZiNPFZoo=;
        b=LxXmCfI9sn1X+tpLKiKmyIivUb7Nz85K5DrBEPKvQ9v8nNLwNnIcyoLYWbnh8A3W2Z
         tB4N/3njFUN+dLF8tKbxgEu4lU1wv4nZ3Mh9MBrmufSDiyX1qphj0/0KJP2JG+Jptfgm
         h3cm97hPqa83I5y70IzcLaQxffOOrGbnehoxXPAdQLrZNep0hAw6vJ9MDQpLBtz9kciL
         cKUzMIsPLsUSR5ZLjDWuXZWMLluj1BiuPheu2Ymj6gX56BnSBufD3893JJqkDW8hRzb4
         Ifp6vvH9Rc85LgfX68WhdtAbOxtgx0Um3JU2Gpkt4uabGuOSd7B4dPKKCUe+gy8lWrEr
         asoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SvrUrMjp0M2a318iN9ulg5rBArlaCJFsr2ZiNPFZoo=;
        b=deR8bZTMhnkpXH+ZJYMUaVvdJdJvoWgt3DtvKyk7IaeKvM8RlZVUzROKeciWhg58uw
         H73E+x/tT6FmVzg+q29FTlrdyJFhlTQcClXqRnk7Uxgf2LHzcilPeZaISvIpzFtLvzZ9
         UXVzhqlu7rLT2nIsdtfO//fUGIh0bVKwj1bAnTIu6IyEXtOC1eAFC8Dbk3m7z4zvdGLG
         B/ypPgwQYLQJf+DbZ4/P17M4sH4rLms98Km3EjTPVvFzGWTjHgZE9GWdUcMY/iBskyoa
         kw6lfUYlyt7+hwEJ+VgDze1KNnW7CijhIj+K4T/GFaMJJoopMNr198KgQlBKObyEy0pr
         oo2w==
X-Gm-Message-State: ACrzQf1FMopoSANk+YyOJWXeQvCOoKTuoeOZVBKksI4lACQGSvw+Y2ZF
        ZJxIAj+99EsDXWP53kuiSuW0Phbvjdo=
X-Google-Smtp-Source: AMsMyM5JJACsw8aEfGm2EdfH0ufVrFYx7/lEpYI9nkuNU4vuqVxUWeNybAIy/XJFirmzeLRVfB7cnA==
X-Received: by 2002:aa7:d651:0:b0:459:d1c:394e with SMTP id v17-20020aa7d651000000b004590d1c394emr14103280edr.10.1666296265134;
        Thu, 20 Oct 2022 13:04:25 -0700 (PDT)
Received: from localhost ([46.211.75.76])
        by smtp.gmail.com with ESMTPSA id b18-20020a1709063cb200b0073dc4385d3bsm10695498ejh.105.2022.10.20.13.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 13:04:24 -0700 (PDT)
Date:   Thu, 20 Oct 2022 23:04:19 +0300
From:   Denis Pauk <pauk.denis@gmail.com>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [RFC] hwmon: (nct6775) Add NCT6799 support through ACPI layer
Message-ID: <20221020230419.6d80feb2@gmail.com>
In-Reply-To: <efce6e7f-b83c-eb4c-f410-662af2cb5f88@khalifa.ws>
References: <20221018173428.71080-1-ahmad@khalifa.ws>
        <20221019170627.GA2328901@roeck-us.net>
        <efce6e7f-b83c-eb4c-f410-662af2cb5f88@khalifa.ws>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 20 Oct 2022 18:08:00 +0100
Ahmad Khalifa <ahmad@khalifa.ws> wrote:

> On 19/10/2022 22:04, Denis Pauk wrote:
> > Hi Ahmad,
> > 
> > Thank you for your patch.
> > 
> > I will add mention of you patch in
> > https://bugzilla.kernel.org/show_bug.cgi?id=204807 also.  
> 
> That's an interesting bug. It has loads of ACPI tables in there, which 
> could be very useful.
> 
> The acpi patch is still a proof of concept and will show wrong values, I 
> know the voltages and temperatures are mixed up or could even be pulling 
> rubbish data that looks like a temperature.
> 
> I just wanted comments on where to go, thanks for the below.
> There is definitely lots to fix up first.
> 
> 

You also can use https://github.com/asus-wmi-boards-sensors/asus-board-dsdt, I
have collected DSDT from bugs and asus support site. I suppose
that all ASUS X670 bioses will have same dsdt definitions.

Some of dumps contains register definition like in P8H67-ASUS:

```
IndexField (HIDX, HDAT, ByteAcc, NoLock, Preserve)
{
	Offset (0x04), 
	CHNM,   1, 
....
	VCOR,   8, 
	V12V,   8, 
	Offset (0x23), 
	V33V,   8, 
	V50V,   8, 
....
}

```

On Tue, Oct 18, 2022 at 06:34:29PM +0100, Ahmad Khalifa wrote:
> New Asus X670 board firmware doesn't expose the WMI GUID used for the
> SIO/HWM methods. The driver's GUID isn't in the ACPI tables and the
> GUIDs that do exist do not expose the RSIO/WSIO and RHWM/WHWM methods
> (which do exist with same IDs).
> 

Have you caught differences in DSDT definition that broke WMI call? 
I see similar definition of WMI methods in X570 and X670 dsdt and by first look
everything should be good. 

Like:
X670
```
....
Name (_HID, EisaId ("PNP0C14") /* Windows Management Instrumentation Device */)
 // _HID: Hardware ID
Name (_UID, "AsusMbSwInterface")  // _UID: Unique ID
Name (_WDG, Buffer (0x3C)
{
	/* 0000 */  0xD0, 0x5E, 0x84, 0x97, 0x6D, 0x4E, 0xDE, 0x11,  // .^..mN..
	/* 0008 */  0x8A, 0x39, 0x08, 0x00, 0x20, 0x0C, 0x9A, 0x66,  // .9.. ..f
	/* 0010 */  0x42, 0x43, 0x01, 0x02, 0x72, 0x0F, 0xBC, 0xAB,  // BC..r...
	/* 0018 */  0xA1, 0x8E, 0xD1, 0x11, 0x00, 0xA0, 0xC9, 0x06,  // ........
	/* 0020 */  0x29, 0x10, 0x00, 0x00, 0xD2, 0x00, 0x01, 0x08,  // ).......
	/* 0028 */  0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,  // !...f...
	/* 0030 */  0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,  // ......).
	/* 0038 */  0x4D, 0x4F, 0x01, 0x00                           // MO..
})
.....
Method (WMBD, 3, Serialized)
{
	Local0 = One
	Switch (Arg1)
	{
....
		Case (0x5253494F) +
		{
			Return (RSIO (Arg2))
		}
		Case (0x5753494F) +
		{
			Return (WSIO (Arg2))
		}
		Case (0x5248574D) +
		{
			Return (RHWM (Arg2))
		}
		Case (0x5748574D) +
		{
			Return (WHWM (Arg2))
		}
......
		Default
		{
			Return (Zero)
		}

	}

	Return (Local0)
}
```
