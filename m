Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACFDC54EBE
	for <linux-hwmon@archiver.kernel.org>; Sat,  7 Jan 2023 18:50:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbjAGSu6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 7 Jan 2023 13:50:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbjAGSuy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 7 Jan 2023 13:50:54 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90CF306
        for <linux-hwmon@vger.kernel.org>; Sat,  7 Jan 2023 10:50:53 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id fy8so10469399ejc.13
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Jan 2023 10:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlE/Tn8MueavSemqR5qbbHx1xtEswnMMSqgwHT5F/ig=;
        b=CyYLMKjGniAE5sxr8FJBpoGk6skQ5e+V39Bx2hcU7n/qUOtl816ePeKJfb91ye5Idj
         le3XoOzI9EWkFoMvhDbEO0lxJlS98EzIyhp1ce38hmLyqYA1l+lY5WWTZif1aOoeyeuE
         61tX8U6tQeGYqVeG8HDyKfZFiSKwVzOMy3HPtFrZe4D+oGJOoNc9BB/UwY7g+E/16bW4
         zm/nmBFD9Z6fmmv8V9BkOJtCBS5SwnM/7DP4L0HxcL1IGTxgaMPR480f3yIttWSw9hDy
         4xPC8jB5QHOLu1It8DG7Isdgdr/hwvAupMTKFiMAf/amf6RJOC3B0iPY2sC4tNsKuXF4
         ZIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlE/Tn8MueavSemqR5qbbHx1xtEswnMMSqgwHT5F/ig=;
        b=Cc8W01jDql0Yth80QYAvu6YTqIsB+1oVubIHjEEcgH0ImhGBlsOm8nlVWfOsXKGbhe
         WgRNeH0+J2QMharYk3pCQj+tQDLk6gRmt3brArfPaciLL5OZz04d6rnZtvFPMDEciIpM
         PmtIy3bO4nLbLTKvCjGxss3sfoab1axJkT1Hc+kl5KfHISSKvprPGiI0O/Bo3DuICwUt
         BM5MCjgM9gLPubmfZux2U8A+hzn6yp6LiUGy52lETElDzxoN5DRvu20bAeKOJ8B6ZBf7
         XzRokLQf948OvVMTSMXux6Oko0iJFKHOBkKIYeHJjkKmGn+mjL+h8uoF9CfJrEo2haPI
         L9yQ==
X-Gm-Message-State: AFqh2krE4r6taVwHt5KQdk0fUvenIOCzJhVgOWPyDDZz2SWEzPMvaVZ4
        2AJrbNDEor45ppbktqHioZraMPyTxRBwjg==
X-Google-Smtp-Source: AMrXdXt444dP968EvMpVwAbPYUmS9kD1uK6j6D0zIt+lFqUZQe8gzFnVEZ1NBtMPcE+tryjF4GNnuw==
X-Received: by 2002:a17:906:6a05:b0:7c1:28a7:f7a0 with SMTP id qw5-20020a1709066a0500b007c128a7f7a0mr74368513ejc.31.1673117452428;
        Sat, 07 Jan 2023 10:50:52 -0800 (PST)
Received: from localhost ([46.211.83.22])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906329200b007c0c679ca2fsm1686263ejw.26.2023.01.07.10.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 10:50:52 -0800 (PST)
Date:   Sat, 7 Jan 2023 20:50:36 +0200
From:   Denis Pauk <pauk.denis@gmail.com>
To:     sebastian.arnhold@posteo.de
Cc:     ahmad@khalifa.ws, chunkeey@gmail.com, linux-hwmon@vger.kernel.org,
        linux@roeck-us.net, jdelvare@suse.com, jeroen@beerstra.org,
        sst@poczta.fm
Subject: Re: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
Message-ID: <20230107205036.7aff1267@gmail.com>
In-Reply-To: <20230107183739.2101-1-pauk.denis@gmail.com>
References: <767c4090-007c-a819-e047-11971ea9cc17@posteo.de>
        <20230107183739.2101-1-pauk.denis@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat,  7 Jan 2023 20:37:39 +0200
Denis Pauk <pauk.denis@gmail.com> wrote:

Of course, if Ahmad does not have any objections.

I have cleaned up patch and reused same method for both types of boards and
have added more boards.

> Hi,
> 
> Jeroen Beerstra and Slawomir Stepien have tested ASUS boards with nct6799d
> chip.
> 
> I have merged your patch with rewrited wmi access patch and attached to
> https://bugzilla.kernel.org/show_bug.cgi?id=204807#c281
> 
> I will send patches with updated wmi code after feedbacks from 204807
> receipients.
> 
> Best regards,
>              Denis.

