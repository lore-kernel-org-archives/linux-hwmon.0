Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6304EB64DC
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 Jul 2023 21:14:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbjGQVOC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 Jul 2023 17:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjGQVOB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2023 17:14:01 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8F7F3
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Jul 2023 14:14:00 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-cabf1dbafc4so5043977276.2
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Jul 2023 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689628440; x=1692220440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DiAwjywY+o6AydFAzzRqhrzlFzFr7K/AvHOWd5Odg+A=;
        b=quXvFsCdfkdgi2LD00nVbmaJpdUFccPnP4HsH9qxD52OMq+ZV/7hg2OBaS5Iau5fbx
         lAWSFe76WQ2zn4sMM8FAPESSA6MCAuYPyXH/HozdYtbXyWiV4Yb5OPsRsxb0323GXR8r
         DuSrg26B+WP3V9XjFR5uewcOF3SzwpWK11UBO4vk/KxgHcYaLgjcr7pexG1YfI1Tm16F
         Qb9GPLh+usvFmuv8XqlG2iPDK+HjRYbjIL01LQR3cLA+iDgH7ao7zp+SPXMO49xOhX6C
         nINdIOOyxve7aWcKVQVWmL38oDN0ruS48IlZD7MSG+3qI2Fkc4zCmDSleeP0kEWb2iSV
         J6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689628440; x=1692220440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiAwjywY+o6AydFAzzRqhrzlFzFr7K/AvHOWd5Odg+A=;
        b=VJoJFnvOcHJBmZd+C5YeuoRZl6g7ECsQuOhGg5MbyGvteyY+jJJUglm1l1wHWOIyrU
         GvxRF4PwucjGJwL4tR3WAlBkFRT2L9vX5qn59VZ2yrtYpKG2rpzwLCcu36EZruIbgsjM
         KeH8kEEB1GS3wfuxtv9xBzbPeaM7OLc+GCgRATtPjJk4LoGtCqu4MV7u63QgxXOa3xcA
         pi+D7z7JuaDj68pl87DFzy6WsN5lVJtEk8quMLKQxt1XoJLLAU6tlnLmQRCK46XOV1aK
         lxkFaFzQO7nWB9K1LhBmELaJd5fIMr1bEdHhHlATTcR+s/XArcYqnVdFT36PvPEwFvkq
         O+8w==
X-Gm-Message-State: ABy/qLYkNqGDKOI0ac2CN45vWHuKd030KM38DniR0fJMVg1fy7SEa6RT
        nAgclrYSuuUJo7AL4zfK+Zo=
X-Google-Smtp-Source: APBJJlH9eGdcqklmwKcgBUIxwTAbDm0fW35Wv161aZ9BwrZm1jXlWchyvQTX3WxIh9iBx6AmD3Qp+w==
X-Received: by 2002:a0d:eb14:0:b0:56c:f8f1:eed5 with SMTP id u20-20020a0deb14000000b0056cf8f1eed5mr12953292ywe.6.1689628439721;
        Mon, 17 Jul 2023 14:13:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w65-20020a0ded44000000b005463e45458bsm82895ywe.123.2023.07.17.14.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 14:13:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 17 Jul 2023 14:13:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (nct6775) Increase and reorder ALARM/BEEP bits
Message-ID: <c5257431-cdb0-49ad-bbec-861c6b233b25@roeck-us.net>
References: <20230717201050.1657809-1-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717201050.1657809-1-ahmad@khalifa.ws>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 17, 2023 at 09:10:51PM +0100, Ahmad Khalifa wrote:
> * Increase available bits, IN: 16 to 24, FAN: 8 to 12,
>   TEMP: 6 to 12
> * Reorder alarm/beep definitions to match in order to allow
>   additional inputs in the future
> * Remove comments about 'unused' bits as probe() is a better
>   reference
> 
> Testing note:
> * Tested on nct6799 with IN/FAN/TEMP, and changing min/max/high/hyst,
>   that triggers the corresponding alarms correctly. Good confirmation
>   on the original mapping of the registers and masks.
>   As to be expected, only 4 fans and 2 temps (fixed) have limits
>   currently on nct6799 on my board.
> * Trouble with testing intrusion alarms and beeps, no way to confirm
>   those. As I understand now, intrusion/caseopen is probably not
>   connected on my board.
>   And I haven't seen a buzzer on a board in ages.
> 
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>

Tested working on nct6797, with no functional differences observed,
and the code looks good to me.

Applied to hwmon-next.

Thanks,
Guenter
