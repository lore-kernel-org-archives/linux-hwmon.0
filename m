Return-Path: <SRS0=B7jK=QB=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295B4C282C0
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Jan 2019 20:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E517B2146E
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Jan 2019 20:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0au+f/p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfAYUNv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Jan 2019 15:13:51 -0500
Received: from mail-qk1-f169.google.com ([209.85.222.169]:43092 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbfAYUNv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Jan 2019 15:13:51 -0500
Received: by mail-qk1-f169.google.com with SMTP id z18so6122301qkj.10
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Jan 2019 12:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=9ZcA2pnhkLlqzIpgxiix6CRmF5RUaxPRY3Jb+goYbAA=;
        b=T0au+f/pzd9WpvoSBj6LJuZ6TXjnMrgZ0ZYdjtCQ2Ooe6KXQxSWjP3VlF+g/Z13axX
         Ik0YLPFC70EPOsIERohUwaoiykY5PLhqqTucyQtgkn68gPnRht4LIFXOwNNTteSc0TDG
         3+3sFQMwXUnvfrcTFIsjBpzBgToCK+nTRtX7rwrj+KQ9ZE8MJk5LYxuXfTIUQwm2FXUn
         Ixex33XlLsfCOtGo+6KCqcIUg+Kuk0ulSIqIuUHXufjrjRFDbaF7IRktYBADdEHzW/SN
         vSMouNRvmqczIt0vPhaqHTtMe09jO3SqH1iNWEfqeT1Z4bI71MH0rR0AFes1tv4zxIGU
         4L/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=9ZcA2pnhkLlqzIpgxiix6CRmF5RUaxPRY3Jb+goYbAA=;
        b=rjknhDz5K9b6mBl6Xy33iUGE/AaW2vTYSkywAspJMB0/1tvc/G0TyZzb1uFXQdMTEk
         +g5IsHRtbLqy454V/A7AMt2pgA8b29r/2mCF5kYPGLH7F3HdvdeCYcJLicaMAA1SSpC7
         fGL7imjaKQXX827IoTc/qn7dCE5PrZAiZoXZ/HDQ9J5HA2Az9rtvceJbUCOlrjYNaO8Z
         FVVTVvmZWCN4FSp/eBcGP79VrutHf1ZOjTMFer88SeFI16Sxz0R8uDvsFTSLywT2/SuU
         19mZhxWd60JRT0VrVpACmf02tCWOD6XZr8cDuHQedhvgi6+JG9R+wPV2TVvDld/nNc1W
         oP8g==
X-Gm-Message-State: AJcUukfou+TL4H8MY7tfAI6142pteUS6QPPrLclEV07a0+LJbTPz92pw
        k6CwPRTB37sR2dH3vX8GM/icePntSD5kFTL9+VfJmWHX
X-Google-Smtp-Source: ALg8bN50u9Rkp0Um0PVEpW95227PxxaUVCzT02jAt0A8qixr5Rw7itfP9LUwH7umnAQhuJsRNkndFJ6kiG5Ok6UKPDw=
X-Received: by 2002:a37:953:: with SMTP id 80mr11193877qkj.48.1548447230257;
 Fri, 25 Jan 2019 12:13:50 -0800 (PST)
MIME-Version: 1.0
From:   Matt Wilbur <wilburm@gmail.com>
Date:   Fri, 25 Jan 2019 15:13:39 -0500
Message-ID: <CAGQJtpOG7m3J9=nbUFi9xhhOKh2T9spSDW4mYfkPeJrSVANdXQ@mail.gmail.com>
Subject: LM5066 low- and high-current limit scaling
To:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi

First off, this is the first time I've ever tried something like this,
so I fully anticipate I will make some etiquette / process mistakes.

In a project I am working on, we make use of the LM5066 hot-swap
controller.  I believe the kernel module for this chip
(drivers/hwmon/pmbus/lm25066.c) has an error where the scaling
parameters for the low- and high-current limits are swapped.

What's the best way for me to make my case?  Just create a patch and
try to submit it?  A free-form discussion on the mailing list?

Thanks in advance.

Matt
