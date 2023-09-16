Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE29C2BA12
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Sep 2023 19:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237149AbjIPTaZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Sep 2023 15:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239291AbjIPTaM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Sep 2023 15:30:12 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9EE186
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Sep 2023 12:30:06 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68fb6fd2836so3032595b3a.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Sep 2023 12:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telus.net; s=google; t=1694892605; x=1695497405; darn=vger.kernel.org;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YiGOkE1C2htdHndTsg31GZGHir4scXN2Evj8f3+5ddg=;
        b=SmrMBDyuLwc/+/VjpcchUaQ3pzwo3lCCvvyddV+iTDtEPWhbcFEcz7BE3y2YmuxRs0
         yZB2NEUuTJKXtn3Zs+aWigM5uKK7mlwr6l8+o1Ztcadjbmz1I32hek6PAlNtiiCTnGf5
         +C1GtIHKG5AuPgMCDy4WKzEzAOMrJcORNCcKt6S4VyIdkgouc6JGIZDguThbuSxnYZnd
         UkHzsA4E2Bq6Ey76Ch17sxX/CxBNXfbYBuAq0jSZHYhFLwgjSs4V6n0jpxq+NGx3ntuo
         WEsie/jnz2Yw99xgHvxFCa7QS2DBzlVxd7q5oTGTJyc2itgOY+bHcLgqxJIeWsPClNDT
         YyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694892605; x=1695497405;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YiGOkE1C2htdHndTsg31GZGHir4scXN2Evj8f3+5ddg=;
        b=pPPruqGwVcB9GWKYQ/GSy2EvQBp6Rv7ouYhwtnTibrchz/ojLsCqlYT3THdnNKkgAx
         W9aUOVsbsKsfcHuL5OhbF8UhSI1vTyTnaqN4roWsjhOyvOj4DK6rfzqjuJGV9j5Lq8DU
         aCH7sWAs0e0zUVzTPZ5wGgPKX0zfbt/K8BnzkqEQOeea+4RPud6r/vS9PzbcLftsflmI
         p26xpjLQYus9Id6MqN2gQLsNHB65m+UFU9U+iEowIdwPAGLZ4zppA+yaw6inLvmidUf4
         PRPJPA0b5aSZGllgddPFmFPgWqWu7tk1ZEC/rWEzLM+WcDuTUMmLYI0dUIYrM1jrE+wR
         y1Rw==
X-Gm-Message-State: AOJu0YwHpHpKY1A3l0J3SmozYMkSLf4wZ03+ii4+E6u2DSXfe4ott5bH
        oNaIw7V30m5I8lsHQXl60/dYfA==
X-Google-Smtp-Source: AGHT+IFLYYXTg/341eHQT3hns/zAqUdAqGD2K+D2kqlEFE+/c4Hf7hoHWZSz86z7cgnv4CmHhFhFpQ==
X-Received: by 2002:a05:6a00:c96:b0:68f:d864:596 with SMTP id a22-20020a056a000c9600b0068fd8640596mr6669404pfv.3.1694892605516;
        Sat, 16 Sep 2023 12:30:05 -0700 (PDT)
Received: from DougS18 (s66-183-142-209.bc.hsia.telus.net. [66.183.142.209])
        by smtp.gmail.com with ESMTPSA id 15-20020aa7910f000000b00682a61fa525sm4956224pfh.91.2023.09.16.12.30.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Sep 2023 12:30:04 -0700 (PDT)
From:   "Doug Smythies" <dsmythies@telus.net>
To:     "'Guenter Roeck'" <linux@roeck-us.net>,
        "'Ahmad Khalifa'" <ahmad@khalifa.ws>
Cc:     "'Jean Delvare'" <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>,
        "Doug Smythies" <dsmythies@telus.net>
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net> <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net> <322119da-0de6-ffe4-d2cb-0d7cda1c4a53@khalifa.ws> <86148239-9c7d-7a62-33bc-bda9812d719a@roeck-us.net> <f8f05448-a4b2-d094-47a0-34bd3be7ae20@khalifa.ws> <74740d32-acda-cd89-ab11-270ce8393c12@roeck-us.net>
In-Reply-To: <74740d32-acda-cd89-ab11-270ce8393c12@roeck-us.net>
Subject: RE: hwmon: (nct6775) Regression Bisected
Date:   Sat, 16 Sep 2023 12:30:05 -0700
Message-ID: <003001d9e8d4$32a86db0$97f94910$@telus.net>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-ca
Thread-Index: AQIVV+zLPPY/GAerH63YAbr+MKT6uQG7juHtAZ8RBioAtCerKwIOocMBAdoxEDSvZzhx8A==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2023.09.16 11:11 Guenter wrote:
> On 9/16/23 10:45, Ahmad Khalifa wrote:
>> On 16/09/2023 18:04, Guenter Roeck wrote:
>> 
>>> The proper fix should really be in nct6775_in_is_visible(),
>>> which should drop the attribute if there is no alarm bit for it,
>>> similar to, for example, nct6775_fan_is_visible().
>>> Something like
>>>
>>>      int nr = index % 5;     /* attribute index */
>>>
>>>      if (nr == 1 && data->ALARM_BITS[in] == -1)
>>>                  return 0;
>> 
>> Perfect, that's what I looked for but couldn't figure it out in
>> a rush. If it's confirmed, I'll convert the fix so it hides the
>> attribute instead.
>> 
>
> I'd suggest to just send a patch. We can always update it with v2
> if a revision is needed.

Hi,

And thanks for your quick attention on this.

If I understand all the emails correctly, the above supersedes
the previous patch suggestion.

I tested it with kernel 6.6-rc1, and it fixes the issue.

doug@s19:~/kernel/linux$ git diff
diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 02a71244fc3b..ead5d83f1594 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -1753,6 +1753,9 @@ nct6775_show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
                return PTR_ERR(data);

        nr = data->ALARM_BITS[sattr->index];
+
+       pr_info("doug: nr: %d  ; index %d\n", nr, sattr->index);
+
        return sprintf(buf, "%u\n",
                       (unsigned int)((data->alarms >> nr) & 0x01));
 }
@@ -1910,6 +1913,10 @@ static umode_t nct6775_in_is_visible(struct kobject *kobj,
        struct device *dev = kobj_to_dev(kobj);
        struct nct6775_data *data = dev_get_drvdata(dev);
        int in = index / 5;     /* voltage index */
+       int nr = index % 5;     /* attribute index */
+
+       if (nr == 1 && data->ALARM_BITS[in] == -1)
+               return 0;

        if (!(data->have_in & BIT(in)))
                return 0;

You can see I left my pr_info statement in, and got:

Sep 16 12:16:17 s19 kernel: [    3.091829] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
...
Sep 16 12:16:17 s19 kernel: [    3.744414] nct6775_core: doug: nr: 0  ; index 0
Sep 16 12:16:17 s19 kernel: [    3.744442] nct6775_core: doug: nr: 1  ; index 1
Sep 16 12:16:17 s19 kernel: [    3.744466] nct6775_core: doug: nr: 2  ; index 2
Sep 16 12:16:17 s19 kernel: [    3.744490] nct6775_core: doug: nr: 3  ; index 3
Sep 16 12:16:17 s19 kernel: [    3.744514] nct6775_core: doug: nr: 8  ; index 4
Sep 16 12:16:17 s19 kernel: [    3.744555] nct6775_core: doug: nr: 20  ; index 6
Sep 16 12:16:17 s19 kernel: [    3.744578] nct6775_core: doug: nr: 16  ; index 7
Sep 16 12:16:17 s19 kernel: [    3.744601] nct6775_core: doug: nr: 17  ; index 8
Sep 16 12:16:17 s19 kernel: [    3.744625] nct6775_core: doug: nr: 24  ; index 9
Sep 16 12:16:17 s19 kernel: [    3.744649] nct6775_core: doug: nr: 25  ; index 10
Sep 16 12:16:17 s19 kernel: [    3.744672] nct6775_core: doug: nr: 26  ; index 11
Sep 16 12:16:17 s19 kernel: [    3.744695] nct6775_core: doug: nr: 27  ; index 12
Sep 16 12:16:17 s19 kernel: [    3.744718] nct6775_core: doug: nr: 28  ; index 13
Sep 16 12:16:17 s19 kernel: [    3.744741] nct6775_core: doug: nr: 29  ; index 14
Sep 16 12:16:17 s19 kernel: [    3.744769] nct6775_core: doug: nr: 6  ; index 24
Sep 16 12:16:17 s19 kernel: [    3.744787] nct6775_core: doug: nr: 7  ; index 25
Sep 16 12:16:17 s19 kernel: [    3.744805] nct6775_core: doug: nr: 11  ; index 26
Sep 16 12:16:17 s19 kernel: [    3.744822] nct6775_core: doug: nr: 10  ; index 27
Sep 16 12:16:17 s19 kernel: [    3.744846] nct6775_core: doug: nr: 23  ; index 28
Sep 16 12:16:17 s19 kernel: [    3.744866] nct6775_core: doug: nr: 33  ; index 29
Sep 16 12:16:17 s19 kernel: [    3.752903] nct6775_core: doug: nr: 12  ; index 48
Sep 16 12:16:17 s19 kernel: [    3.752913] nct6775_core: doug: nr: 9  ; index 49
...

... Doug


