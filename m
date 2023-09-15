Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31F1EE6457
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Sep 2023 14:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235633AbjIOO3O (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Sep 2023 10:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235654AbjIOO3O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Sep 2023 10:29:14 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0F5268A
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Sep 2023 07:28:57 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c3d8fb23d9so18625185ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Sep 2023 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telus.net; s=google; t=1694788137; x=1695392937; darn=vger.kernel.org;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nmMqGf0vNjjg1iwJSId+Lz9wQoqmo+DmAfvsA+ggwI0=;
        b=JpvkvUYTY9AXq4GKBbmq0o48tz/naN/8L3JhyvBs6FWU+sZoBhiR4XW6ao5dQncOmB
         xW3k4/DC1Be82wE7PVzvjVYJoneJ+MNaXAUtqpVVxj0l2nR0dr4EFAL3eK1YKDyGv4PX
         oDKp25NXmiadzEKSfpqn7LaUbVI3hyHcroVIcdExXntVAjSL6REnk7BBX6u3QKTtlT7R
         2km7UvGWaz89j1Jghn4RnD1DBvaLtfTDNbMiqyLejNUWk0xc800NQ9jiSYn22geeIpBI
         pCfhNZhoJBCAfci+4QPBBWG7wk4lrZ/ijMNf7grObHjeUYc8icqZ0yeZznYOMPIkWMbf
         Inlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694788137; x=1695392937;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmMqGf0vNjjg1iwJSId+Lz9wQoqmo+DmAfvsA+ggwI0=;
        b=FPHe7yP7Uqil7eKL8vJ2ljcY/fdDr46TflF5PN2WoML8lmjEHkm2NZc1K/gpFXcxOT
         MhlVT6fv4bD3zxP6KDcDQkow3Y9RuF79xVY8LEDLcRsaBlLpWQ3VjxiZHFT9y8lhGyrK
         3EzfkzCcNC3zrwgvTopHY510ucnXwGdLJ1kdw8XYT5PGA6yVUtU6/dFrpGjjLXN8qX+6
         GTNE7KBRO4DQCG7AZCnVfORJkwVZbcLpem7O0lvcg9efda8r0aTryuLQlmbIHtOQEY/E
         QsA4kxVZo5epC37X4tq02AX7iFH9QmPscWljabA6WzTGZZq/pdPw8lw/Pi1fVDiKuAl5
         RXAQ==
X-Gm-Message-State: AOJu0YyR8rYNSBGiogKBJs0m5WYmKr1dLESSlVGPMXLRoh3UqyuhblBA
        f9zv3v8H7zh1kXBfm38DmldfZjz6zhe5PGUov+Q=
X-Google-Smtp-Source: AGHT+IGTWSggEQru9Bnn5ai8dk9ctN9rzTQIScb97ofy7DBowbzLZupyR4f5ApwcAbKSin2l211z2w==
X-Received: by 2002:a17:902:ab8d:b0:1c3:ed30:cdf4 with SMTP id f13-20020a170902ab8d00b001c3ed30cdf4mr1690769plr.4.1694788136926;
        Fri, 15 Sep 2023 07:28:56 -0700 (PDT)
Received: from DougS18 (s66-183-142-209.bc.hsia.telus.net. [66.183.142.209])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902748c00b001b246dcffb7sm3560509pll.300.2023.09.15.07.28.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Sep 2023 07:28:56 -0700 (PDT)
From:   "Doug Smythies" <dsmythies@telus.net>
To:     "'Ahmad Khalifa'" <ahmad@khalifa.ws>,
        "'Guenter Roeck'" <linux@roeck-us.net>
Cc:     "Doug Smythies" <dsmythies@telus.net>,
        "'Jean Delvare'" <jdelvare@suse.com>, <linux-hwmon@vger.kernel.org>
Subject: hwmon: (nct6775) Regression Bisected
Date:   Fri, 15 Sep 2023 07:28:57 -0700
Message-ID: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-ca
Thread-Index: Adnn22Bdy9oJVQMxQkua3w2sYJcYCA==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Kernel 6.6-rc1 has an error during boot. The guilty commit is:
b7f1f7b2523a6a4382f12fe953380b847b80e09d
hwmon: (nct6775) Additional TEMP registers for nct6799

There seems to be confusion between the indexes into
the NCT6799_ALARM_BITS array or the
NCT6779_ALARM_BITS array. I do not understand the code
and do not know if it is the indexing that is reversed or the
wrong table is being used.

The error from kern.log (edited):

================================================================================
UBSAN: shift-out-of-bounds in drivers/hwmon/nct6775-core.c:1757:39
shift exponent -1 is negative
CPU: 9 PID: 822 Comm: sensors Not tainted 6.6.0-rc1-stock2 #1165
Hardware name: ASUS System Product Name/PRIME Z490-A, BIOS 9902 09/15/2021
Call Trace:
<TASK>
dump_stack_lvl+0x48/0x70
dump_stack+0x10/0x20
ubsan_epilogue+0x9/0x40
__ubsan_handle_shift_out_of_bounds+0x10f/0x170
...

I added a "pr_info" line (in the below it was as of the prior commit,
43fbe66dc216 hwmon: Add driver for Renesas HS3001):

doug@s19:~/kernel/linux$ git diff
diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 33533d95cf48..12e3df84c034 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -1727,6 +1727,7 @@ nct6775_show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
                return PTR_ERR(data);

        nr = data->ALARM_BITS[sattr->index];
+       pr_info("doug: nr: %d  ; index %d\n", nr, sattr->index);
        return sprintf(buf, "%u\n",
                       (unsigned int)((data->alarms >> nr) & 0x01));
 }

And for b7f1f7b2523a got (edited):

nct6775_core: doug: nr: 0  ; index 0
nct6775_core: doug: nr: 1  ; index 1
nct6775_core: doug: nr: 2  ; index 2
nct6775_core: doug: nr: 3  ; index 3
nct6775_core: doug: nr: 8  ; index 4
nct6775_core: doug: nr: -1  ; index 5
================================================================================
UBSAN: shift-out-of-bounds in drivers/hwmon/nct6775-core.c:1758:39
shift exponent -1 is negative
...
nct6775_core: doug: nr: 20  ; index 6
nct6775_core: doug: nr: 16  ; index 7
nct6775_core: doug: nr: 17  ; index 8
nct6775_core: doug: nr: 24  ; index 9
nct6775_core: doug: nr: 25  ; index 10
nct6775_core: doug: nr: 26  ; index 11
nct6775_core: doug: nr: 27  ; index 12
nct6775_core: doug: nr: 28  ; index 13
nct6775_core: doug: nr: 29  ; index 14
nct6775_core: doug: nr: 6  ; index 24
nct6775_core: doug: nr: 7  ; index 25
nct6775_core: doug: nr: 11  ; index 26
nct6775_core: doug: nr: 10  ; index 27
nct6775_core: doug: nr: 23  ; index 28
nct6775_core: doug: nr: 33  ; index 29
nct6775_core: doug: nr: 12  ; index 48
nct6775_core: doug: nr: 9  ; index 49

Observe that the table seems to be
NCT6799_ALARM_BITS
But the indexes seem to be for
NCT6779_ALARM_BITS

static const s8 NCT6799_ALARM_BITS[NUM_ALARM_BITS] = {
         0,  1,  2,  3,  8, -1, 20, 16, 17, 24, 25, 26,   /* in0-in11     */
        27, 28, 29, 30, 31, -1, -1, -1, -1, -1, -1, -1,   /* in12-in23    */
         6,  7, 11, 10, 23, 33, -1, -1, -1, -1, -1, -1,   /* fan1-fan12   */
         4,  5, 40, 41, 42, 43, 44, -1, -1, -1, -1, -1,   /* temp1-temp12 */
        12,  9,                                           /* intr0-intr1  */
};

Now repeat the test as of 43fbe66dc216:

nct6775_core: doug: nr: 0  ; index 0
nct6775_core: doug: nr: 1  ; index 1
nct6775_core: doug: nr: 2  ; index 2
nct6775_core: doug: nr: 3  ; index 3
nct6775_core: doug: nr: 8  ; index 4
nct6775_core: doug: nr: 21  ; index 5
nct6775_core: doug: nr: 20  ; index 6
nct6775_core: doug: nr: 16  ; index 7
nct6775_core: doug: nr: 17  ; index 8
nct6775_core: doug: nr: 24  ; index 9
nct6775_core: doug: nr: 25  ; index 10
nct6775_core: doug: nr: 26  ; index 11
nct6775_core: doug: nr: 27  ; index 12
nct6775_core: doug: nr: 28  ; index 13
nct6775_core: doug: nr: 29  ; index 14
nct6775_core: doug: nr: 6  ; index 24
nct6775_core: doug: nr: 7  ; index 25
nct6775_core: doug: nr: 11  ; index 26
nct6775_core: doug: nr: 10  ; index 27
nct6775_core: doug: nr: 23  ; index 28
nct6775_core: doug: nr: 33  ; index 29
nct6775_core: doug: nr: 12  ; index 48
nct6775_core: doug: nr: 9  ; index 49

Observe that the table seems to be
NCT6779_ALARM_BITS
And the indexing seems to be for that
Table.

static const s8 NCT6779_ALARM_BITS[NUM_ALARM_BITS] = {
         0,  1,  2,  3,  8, 21, 20, 16, 17, 24, 25, 26,   /* in0-in11     */
        27, 28, 29, -1, -1, -1, -1, -1, -1, -1, -1, -1,   /* in12-in23    */
         6,  7, 11, 10, 23, -1, -1, -1, -1, -1, -1, -1,   /* fan1-fan12   */
         4,  5, 13, -1, -1, -1, -1, -1, -1, -1, -1, -1,   /* temp1-temp12 */
        12,  9,                                           /* intr0-intr1  */
};

You probably need this information:
nct6775: Found NCT6798D or compatible chip at 0x2e:0x290

... Doug


