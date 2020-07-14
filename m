Return-Path: <SRS0=kNNy=AZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E09C433E1
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 23:17:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 197672072D
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 23:17:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+IZiuSa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgGNXRv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 19:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgGNXRv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 19:17:51 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C33AC061755
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2020 16:17:51 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id a8so240884edy.1
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2020 16:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=6NgAFfygU/6mOcQgDrFlYeGVb6IfZdLYmG+nmgesAio=;
        b=O+IZiuSapBoWPI9rk8dXrVJodLfh0D1+Ko22V77K7byNEpQKdZ+UIkH9JoPZCKgoFu
         w0YRI5v7I6ozNd3/wzYcSE6Aq0r2gHCXeNh31uVi4S5TdQvtb8HU4qeSAgfSGtSV/lX1
         gFIRC9tTivhI8rBh9rAwRv7Wn8lV76JN1ZySc7GehdL1KtWq7F4kIWb5pKhyV6MUJzqB
         R4bVu6sKSvVeUX024FAVuHezKhrSsz2vs0SYMdIO7BZMng5T5jJIME6HT+SWYIcpv8rv
         ORg5DBR9b5sjuFTVu4c9OBTT6ctAPYKWfV+4V3GUlaw+AYNLN8Nd8yrJzo2GlVDvYW27
         9lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=6NgAFfygU/6mOcQgDrFlYeGVb6IfZdLYmG+nmgesAio=;
        b=spIMsJr5l1TgnMzRZ9cX4hcJiyHBwbw5W2j85jNOX6ZjLu38WbkiNktn7RhJMoDxFE
         +eu1XcBoyWfOePkOdfSEb22mRB3tXKDxxmfrNI/Ic9YM0EZ0Ug7Yj7YVrl0QB17PrlEq
         7etYYkRk9I+OxCllBWWuFTUWbLL2QR3xz9G4UOtTkGvp3heWU+4ZQdWGVgGslcV8yush
         E2enThvrxOob/BUGWwI2VMVq3NkoQ8C98wrcPPchBE/AC5HdYRVHOjqaKVuNP4Z9V5DT
         VHGdEBik0BGvf+l0U+kRbQeYlua5f3cPy6wP7DqVzZgmCClr8Jzr5ftmefVcO4ijl8cn
         qCaA==
X-Gm-Message-State: AOAM532zBtyY9xzpPoOPSLGELJdb/1az1fHangQzsp7VTKdcXAS790jE
        GVqNH1NChMKzFUkKWz/NUBtS+r8VkzI=
X-Google-Smtp-Source: ABdhPJzix3zIOggTttw3O3+lCiV/Vbad5lVfTEHhGtVgi5CB6Me8UuunCV9SrcCzzPRmaRoq13JYNw==
X-Received: by 2002:a50:9f8c:: with SMTP id c12mr6802611edf.149.1594768669678;
        Tue, 14 Jul 2020 16:17:49 -0700 (PDT)
Received: from monster.localdomain ([2a02:8109:113f:e5b8::4])
        by smtp.gmail.com with ESMTPSA id d24sm196105edp.83.2020.07.14.16.17.48
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 16:17:49 -0700 (PDT)
Date:   Wed, 15 Jul 2020 01:17:48 +0200
From:   Alexey Galakhov <agalakhov@gmail.com>
To:     linux-hwmon@vger.kernel.org
Subject: Re: hwmon (nct6775): Please fix Invalid temperature source error
 for NCT6798D
Message-ID: <20200715011748.3507fc2b.agalakhov@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

I'm facing the same problem. I did some research on my machine.

On Fri, 2020-07-03 at 10:10 -0700, Guenter Roeck wrote:

> There is nothing much if anything we can do about that. The NCT6798D
> datasheet reports temperature source 28 as reserved. You could ask
> Asus for support, but their usual response is that they don't support
> Linux.

Looks like there are different versions of the datasheet. The one of
NCT6796D, Revision 0.6 states that 28 (0x1c or 11100) is "Select PECI
Agent 0 Calibration as CPUFAN monitoring source." This seems to be correct
since the fan in question is the CPU one and the value of "PECI Agent 0
Calibration" is actually very similar to the CPU temperature and rises
with CPU load.

Also, looking at the driver code I found no signs of reading so-called
"HM Read-Only Registers". They are described in section 9.481 of the
above datasheet. They are I/O ports (readable with `inb`) with their
base address located in configuration registers 0x64 and 0x65 of the
SuperIO. Some temperatures seem to be directly readable only through
these registers. Looks like the driver monitors all temperatures only
indirectly via switchable channels, is it true?

Regards,
Alexey
  
