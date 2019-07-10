Return-Path: <SRS0=aQnN=VH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF1AC74A36
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Jul 2019 21:00:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9826520838
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Jul 2019 21:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYxFX0Y9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfGJVAg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Jul 2019 17:00:36 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41659 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfGJVAg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Jul 2019 17:00:36 -0400
Received: by mail-pf1-f194.google.com with SMTP id m30so1649350pff.8
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jul 2019 14:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ltIn+doVLnjrMv1QE8KjjWa7kZrfnnvDS96BV0mIgSw=;
        b=SYxFX0Y99ORq+hBqrGBqHTlGEJ2vmx8JhbKzXfs+s+UKkr1Ma4c7BiGt9FjH36ggj4
         +67VqgEvrUOmJLzDFagBMtZG2SF5NlOyfz25U2wb8MmA+JPgI/8TQ8fPyhbfmGTnHh4d
         YegB9cylp0n3uUb+E0ZOYmLRsg0fzuRS0MQ5tha1d/6/M8B5WMqE68AwVnw7gvxDUNHs
         bw69tMAiiWvXjhdNi0OInBYgSI/cW9y+RZDZ0dO9xu5KpX0FCbqYhTJVFKwAaLqtv2V6
         84uboQo0sLd6xkpVapxkldLFnHRA0et16oPkZizTOwyy4GK+rtIRaAsIyDaZG90F1DEa
         g95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=ltIn+doVLnjrMv1QE8KjjWa7kZrfnnvDS96BV0mIgSw=;
        b=nqY5AYhEmNQ3gXESQ6AXjsuE177Kt7/0ojfE7myqA6j/tCAt+gtFdwLat8FCzb/OvW
         o+kT/HGnPVBvnbQshMG1PFsA8MeJRymxBRoBTNQeCK7iRm4RXikfbGWt+K/0sXwrUmve
         DFJaRAp4IMwJ9Oo1KPoUOoPvmmgJuXiCJTmjTb1J/hl8R4f7sRi9R1yrhi9ugROyE6Lp
         VpF4eu4lR5GkZ9aHgU4piMEvRlGCQXR3B7DfE9e0uht9gbOk66IXDIzpRTOqlsgkWXdf
         qTJuBg9xTfZTF56tiJTnCzIz2QFBVcMiOVE5Jf7buOfkbOK7DuDOJJOnwqVnY5sRPcFm
         2Oig==
X-Gm-Message-State: APjAAAW+BQpu06s0eezhxiT3zJgcUvJgt6hZRxAKdtR7Q5y3ZE1WKRNA
        CVS++1EyA19cqNXqH8u9Hg6TO9r7
X-Google-Smtp-Source: APXvYqz210/Jhogf8k4px5DKljCaeSSrm+oplQqUdG847V+l0ZUvGbOsvcgpgvn+73aTgSWM8NtBhQ==
X-Received: by 2002:a63:2ec9:: with SMTP id u192mr279938pgu.16.1562792435324;
        Wed, 10 Jul 2019 14:00:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 21sm2954913pjh.25.2019.07.10.14.00.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 14:00:34 -0700 (PDT)
Date:   Wed, 10 Jul 2019 14:00:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Bj=F6rn?= Gerhart <gerhart@posteo.de>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (nct6775) Fix register address and added missing
 tolerance
Message-ID: <20190710210033.GA8098@roeck-us.net>
References: <C4783F82-7655-4997-AE0E-496683FE1C8B@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C4783F82-7655-4997-AE0E-496683FE1C8B@posteo.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Bjoern,

On Wed, Jul 10, 2019 at 09:08:56PM +0200, Björn Gerhart wrote:
> In the process of adding the new model nct6116, two tiny details of the nct6106 attracted my attention. Please find the patch therefore below:
> 

Please sign your patches. Also, what is your baseline kernel version ?
The patch doesn't apply to the current mainline kernel.

Thanks,
Guenter

> Index: nct6775.c
> ===================================================================
> --- nct6775.c	(revision 16326)
> +++ nct6775.c	(working copy)
> @@ -866,7 +866,7 @@
>  static const u16 NCT6106_REG_WEIGHT_TEMP_SEL[] = { 0x168, 0x178, 0x188 };
>  static const u16 NCT6106_REG_WEIGHT_TEMP_STEP[] = { 0x169, 0x179, 0x189 };
>  static const u16 NCT6106_REG_WEIGHT_TEMP_STEP_TOL[] = { 0x16a, 0x17a, 0x18a };
> -static const u16 NCT6106_REG_WEIGHT_DUTY_STEP[] = { 0x16b, 0x17b, 0x17c };
> +static const u16 NCT6106_REG_WEIGHT_DUTY_STEP[] = { 0x16b, 0x17b, 0x18b };
>  static const u16 NCT6106_REG_WEIGHT_TEMP_BASE[] = { 0x16c, 0x17c, 0x18c };
>  static const u16 NCT6106_REG_WEIGHT_DUTY_BASE[] = { 0x16d, 0x17d, 0x18d };
>  
> @@ -3778,6 +3778,7 @@
>  		data->REG_FAN_TIME[0] = NCT6106_REG_FAN_STOP_TIME;
>  		data->REG_FAN_TIME[1] = NCT6106_REG_FAN_STEP_UP_TIME;
>  		data->REG_FAN_TIME[2] = NCT6106_REG_FAN_STEP_DOWN_TIME;
> +		data->REG_TOLERANCE_H = NCT6106_REG_TOLERANCE_H;
>  		data->REG_PWM[0] = NCT6106_REG_PWM;
>  		data->REG_PWM[1] = NCT6106_REG_FAN_START_OUTPUT;
>  		data->REG_PWM[2] = NCT6106_REG_FAN_STOP_OUTPUT;
