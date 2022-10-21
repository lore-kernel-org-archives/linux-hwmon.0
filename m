Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE182C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Oct 2022 05:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbiJUFx7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Oct 2022 01:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiJUFx6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Oct 2022 01:53:58 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B412E3FF0F
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Oct 2022 22:53:51 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id n12so3078836wrp.10
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Oct 2022 22:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hd+VW8POFw8hp1S2A1u0BE3azbnvmdn63v52S1ajyNg=;
        b=WH60kFmdDbFnx2Zdbbedrm/zextf441JPkqEmtg+R+ZI9lyEMcHCi7DrooMOCKs2hI
         Ji2XwAFP60Zgpj3DBp+b6fZLeElf/HGTiCDZIUAOkfWqXw50J34/XSg4/KsGlAo4p4LV
         nQpUQWAf4SvnApGXMw3L1GbH7G/svJ1zQlkak2v/i0bOitXZ2S54Wix8s4Pc6i1xQ06w
         0W7ZzK8Dqg95gFjIkqOg0jT091IJhujKrIoKgeMPFHWJZ3UuqfLs5/fIahsS2AJq6w+P
         2El6yxFJVkU8V5ouwxoJ/vPjAQO02Z6K3H0yKQe4xBkVKkziqKzzIvl3kqM6DFu17GE5
         WKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hd+VW8POFw8hp1S2A1u0BE3azbnvmdn63v52S1ajyNg=;
        b=pAR5+OlHpMBUmvQGlLyCixOYK75s3LBjn1kFS4LjqBpbhEuAkBwBq7RJgh3fcKlSAh
         dNlw5oynLkMaMGYv6Zrhkjd0jciREIgP5KW6D5gYRZUkgJe0dB+LT1jhcvPt0akebMcq
         ntGFzF87uSqgmORvrziG/vIb2mzp8grqvprIGFjqSzVGtd2BcKhml8KH8uAwD7BOIPwi
         x6vOCfUDFFgqqo4fCvooCLD5DRau8O+ACkIfsawMmv/m5KdYEDRHhtrLBFSwf+Cnto35
         HvqRLzy6/LubTSKfl6Euw0Xe9Vna86SU+atg9H1smfy22BYtcP3kdSObfa5oYcWLZgso
         Jjjw==
X-Gm-Message-State: ACrzQf1s3mLgipZL2JNUvAlGPZtblJsczoM8AJn81klCh+YF9NLMIwF5
        v64HloNa7mueywt+JguJyJME2h8ucs0=
X-Google-Smtp-Source: AMsMyM7d1yPUHuE0LCItLiMMsk0xkjeWlTHDoMN7s8u1WFtckAIHv9nRHjDUTMXCmGbrl0FJQTGVsw==
X-Received: by 2002:a05:6000:257:b0:22c:de79:be97 with SMTP id m23-20020a056000025700b0022cde79be97mr10973652wrz.613.1666331630036;
        Thu, 20 Oct 2022 22:53:50 -0700 (PDT)
Received: from localhost ([46.211.159.213])
        by smtp.gmail.com with ESMTPSA id q9-20020a05600c46c900b003b47e75b401sm1691366wmo.37.2022.10.20.22.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 22:53:49 -0700 (PDT)
Date:   Fri, 21 Oct 2022 08:53:20 +0300
From:   Denis Pauk <pauk.denis@gmail.com>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [RFC] hwmon: (nct6775) Add NCT6799 support through ACPI layer
Message-ID: <20221021085230.5ce4eb92@gmail.com>
In-Reply-To: <2fff1941-25eb-63be-3061-f1f750bf6b7b@khalifa.ws>
References: <20221018173428.71080-1-ahmad@khalifa.ws>
        <20221019170627.GA2328901@roeck-us.net>
        <efce6e7f-b83c-eb4c-f410-662af2cb5f88@khalifa.ws>
        <20221020230419.6d80feb2@gmail.com>
        <2fff1941-25eb-63be-3061-f1f750bf6b7b@khalifa.ws>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 20 Oct 2022 22:53:22 +0100
Ahmad Khalifa <ahmad@khalifa.ws> wrote:

> On 20/10/2022 21:04, Denis Pauk wrote:
> > On Thu, 20 Oct 2022 18:08:00 +0100
> > Ahmad Khalifa <ahmad@khalifa.ws> wrote:
> >   
> >> On 19/10/2022 22:04, Denis Pauk wrote:  
> >>> Hi Ahmad,
> >>>
> >>> Thank you for your patch.
> >>>
> >>> I will add mention of you patch in
> >>> https://bugzilla.kernel.org/show_bug.cgi?id=204807 also.  
> >>
> >> That's an interesting bug. It has loads of ACPI tables in there, which
> >> could be very useful.
> >>
> >> The acpi patch is still a proof of concept and will show wrong values, I
> >> know the voltages and temperatures are mixed up or could even be pulling
> >> rubbish data that looks like a temperature.
> >>
> >> I just wanted comments on where to go, thanks for the below.
> >> There is definitely lots to fix up first.
> >>
> >>  
> > 
> > You also can use
> > https://github.com/asus-wmi-boards-sensors/asus-board-dsdt, I have
> > collected DSDT from bugs and asus support site. I suppose that all ASUS
> > X670 bioses will have same dsdt definitions.  
> 
> This is massive, extracted and all. I'll need to go through this for 
> sure. Many thanks for this repo.
> 
> I don't think the X670 platform motherboards will have the same ACPI 
> tables. For example, ATX vs ITX, STRIX vs CROSSHAIR, different 
> peripherals/configurations.
> 
> 

As I saw, GUID/methods is same for generation and all boards from same
generation used same monitor call without relation to it was AMD or Intel
platform.

Like:
* return list sensors with names and values(asus-wmi-sensors): 
  PRIME/CROSSHAIR/STRIX/ZENITH Intel X399/AMD B450
* proxy register access to sensors(nct6775):
  PRO/ProArt/PRIME/CROSSHAIR/STRIX/TUF Intel Z390+Z490/AMD B550+X570
* custom ec chip/register bank emulation for boards with water cooling
  support (asus-ec-sensors):
  PRIME/ProArt/CROSSHAIR/MAXIMUS Intel Z690 / AMD X470+B550+X570

And no information for boards from 2010's like P8H67. 

And change just GUID and use same methods(RSIO/WSIO/RHWM/WHWM) is good news.

> > Some of dumps contains register definition like in P8H67-ASUS:
> > 
> > ```
> > IndexField (HIDX, HDAT, ByteAcc, NoLock, Preserve)
> > {
> > 	Offset (0x04),
> > 	CHNM,   1,
> > ....
> > 	VCOR,   8,
> > 	V12V,   8,
> > 	Offset (0x23),
> > 	V33V,   8,
> > 	V50V,   8,
> > ....
> > }
> > 
> > ```
> > 
> > On Tue, Oct 18, 2022 at 06:34:29PM +0100, Ahmad Khalifa wrote:  
> >> New Asus X670 board firmware doesn't expose the WMI GUID used for the
> >> SIO/HWM methods. The driver's GUID isn't in the ACPI tables and the
> >> GUIDs that do exist do not expose the RSIO/WSIO and RHWM/WHWM methods
> >> (which do exist with same IDs).
> >>  
> > 
> > Have you caught differences in DSDT definition that broke WMI call?
> > I see similar definition of WMI methods in X570 and X670 dsdt and by first
> > look everything should be good.  
> 
> It looks like WMI, but the GUID below is pointing at WMBC only, whereas 
> you'd expect the 'BD' characters to be in there to access it through the 
> WMI bus.
> 
> The hwmon drivers point at:
> nct6775:             466747A0-70EC-11DE-8A39-0800200C9A66
> asus_wmi_sensors:    466747A0-70EC-11DE-8A39-0800200C9A66
> 
> but the new board (from below) has:
> X670 :               97845ED0-4E6D-11DE-8A39-0800200C9A66
> 
> The change in the first 2 segments might be indicative here, hence why I 
> didn't think they just 'forgot' the GUID in this firmware
> 
> Anyway way, Geunter's idea from the other thread about reaching for the 
> read/write methods directly might just be better here. No need to 
> struggle with GUIDs that can change if Asus will always expose the 
> methods. I'll go through your repo and see if I can confirm that.
> 
> 
> > 
> > Like:
> > X670
> > ```
> > ....
> > Name (_HID, EisaId ("PNP0C14") /* Windows Management Instrumentation Device
> > */) // _HID: Hardware ID
> > Name (_UID, "AsusMbSwInterface")  // _UID: Unique ID
> > Name (_WDG, Buffer (0x3C)
> > {
> > 	/* 0000 */  0xD0, 0x5E, 0x84, 0x97, 0x6D, 0x4E, 0xDE, 0x11,  //
> > .^..mN.. /* 0008 */  0x8A, 0x39, 0x08, 0x00, 0x20, 0x0C, 0x9A, 0x66,  //
> > .9.. ..f /* 0010 */  0x42, 0x43, 0x01, 0x02, 0x72, 0x0F, 0xBC, 0xAB,  //
> > BC..r... /* 0018 */  0xA1, 0x8E, 0xD1, 0x11, 0x00, 0xA0, 0xC9, 0x06,  //
> > ........ /* 0020 */  0x29, 0x10, 0x00, 0x00, 0xD2, 0x00, 0x01, 0x08,  //
> > )....... /* 0028 */  0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,  //
> > !...f... /* 0030 */  0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,  //
> > ......). /* 0038 */  0x4D, 0x4F, 0x01, 0x00                           //
> > MO.. })
> > .....
> > Method (WMBD, 3, Serialized)
> > {
> > 	Local0 = One
> > 	Switch (Arg1)
> > 	{
> > ....
> > 		Case (0x5253494F) +
> > 		{
> > 			Return (RSIO (Arg2))
> > 		}
> > 		Case (0x5753494F) +
> > 		{
> > 			Return (WSIO (Arg2))
> > 		}
> > 		Case (0x5248574D) +
> > 		{
> > 			Return (RHWM (Arg2))
> > 		}
> > 		Case (0x5748574D) +
> > 		{
> > 			Return (WHWM (Arg2))
> > 		}
> > ......
> > 		Default
> > 		{
> > 			Return (Zero)
> > 		}
> > 
> > 	}
> > 
> > 	Return (Local0)
> > }
> > ```  
> 
> 

