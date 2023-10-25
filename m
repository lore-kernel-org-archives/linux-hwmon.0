Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F1DC0032E
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Oct 2023 18:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjJYS5v (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Oct 2023 14:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235017AbjJYS5g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Oct 2023 14:57:36 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E736D48
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 11:57:20 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-694ed847889so46162b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 11:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698260239; x=1698865039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VcytVH0jw46hZ16DT1ur5ZTvbRorV788nA8vP+YxMw=;
        b=LA7EseK8R2QzPnbBlutPgZwPBmWpbOe8ylaT6nr+7LLiO4OyoqeM5Hjsx8knOvNANz
         WKomLiZNiCBA89xEdnFGAEA3Dj61BzWG2X88isqjo8fcoSc3oQ3bklQ2/g5GVMZchprG
         DjXwf3CDJ1lxybm5NDTad/EISMg8w820EiwwpZInvIgLGJ1OA7xTpXqQEM/cwEcKb5dQ
         UR477LEJ5EoIHlA5K3uUQOTHvu+iyXkSDeIFPwHIDSIsmeA6NXVg7aizwazYxiDWPC0d
         jdFEDPDO+GzAyfCIv94iZuoPWDQhnSdo7hXCxMptLlC7ym9eUNjJe8fSdbUyclh6a93D
         u3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698260239; x=1698865039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VcytVH0jw46hZ16DT1ur5ZTvbRorV788nA8vP+YxMw=;
        b=g9q/5iFxTAEPZLecfTG+ZCF+ZY6OWkHJ6TWsNI8SQ5zuXE0nHFIK2NZjRi1D+QvZoG
         DmLzaSwDa0T2CrgtAA6LhOQaKjTwsKz9n7QovaTBxZz7fkdPoqNdvJLFlKBcaNdWmSey
         Rul7kUhyQcHfD1J3em5NaRI8OmasVnhG3hRmqSDHKPMXjdaWsTcTD7t/eNvBFpbRNCpP
         kjN1QOJ5Ywn2sDbkbDJtYcDFcScWOfLoH3uHLEBn49XZbOzlHyuS/bVMQlERwhIJEInM
         ZnQJPb9QQvJ+47MmsuZ5LvHgAOSdCxb6KIck95umSZSSRc+ztLL585JaAhfeqIG7HPUW
         PvIg==
X-Gm-Message-State: AOJu0Yy8oDE/aijJ3rAbPIOleyNX5u+HC3tUp/QnubeoDvFLi8P6ng77
        sgCsI65SYvRTQCPR/QI0xRpfFyeKWF0=
X-Google-Smtp-Source: AGHT+IHMBJj641O8zrXxkz494g+laU4V4IyiF6U+uK3VMLz42ltD8AftBcn1PIulLVyUQKKTv4v7Og==
X-Received: by 2002:a05:6a00:218f:b0:6be:2ace:deb8 with SMTP id h15-20020a056a00218f00b006be2acedeb8mr14650502pfi.20.1698260239555;
        Wed, 25 Oct 2023 11:57:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u202-20020a6279d3000000b006b3dc56c944sm10130543pfc.133.2023.10.25.11.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 11:57:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 25 Oct 2023 11:57:17 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nuno Sa <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org,
        Dragos Bogdan <dragos.bogdan@analog.com>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (axi-fan-control) Fix possible NULL pointer
 dereference
Message-ID: <1623e497-d850-47bc-925b-f97439864299@roeck-us.net>
References: <20231025132100.649499-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025132100.649499-1-nuno.sa@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Oct 25, 2023 at 03:21:00PM +0200, Nuno Sa wrote:
> From: Dragos Bogdan <dragos.bogdan@analog.com>
> 
> axi_fan_control_irq_handler(), dependent on the private
> axi_fan_control_data structure, might be called before the hwmon
> device is registered. That will cause an "Unable to handle kernel
> NULL pointer dereference" error.
> 

Applied, but, please,

> Fixes: 8412b41 ("hwmon: Support ADI Fan Control IP")

WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")'
#88:
Fixes: 8412b41 ("hwmon: Support ADI Fan Control IP")

consider running checkpatch on your patches in the future.

Guenter
