Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005C3EB64DA
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Jul 2023 14:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbjGTOsW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Jul 2023 10:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbjGTOsV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Jul 2023 10:48:21 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DDE26B2
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Jul 2023 07:48:18 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6686708c986so762786b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Jul 2023 07:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689864498; x=1690469298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpzT27zKe+4sRj/CeeQND6n0p7j6R1yCRT9rnyE+1Is=;
        b=ownJWAbocXsWgNt08P0uxqj5gdwTf1x7JJJGMD3VN7tPeaow6EI1hCh1r/vvkLqa81
         n4cf4UlBqT4CigRfXuXkla/XbnDuAi5/mrB1Vyey0QH5tAVbAZ0Sfru2VgjKBruihpFO
         1O1AYc7TgfPr5IlTJwJAicYxuBZOfw5KggxhthybRPj+d/xpOgZOYephnyvZs3bLgRit
         m3REfY4ZxeVb6z13pMO3XK+AIqZaR2FwESssASE2lfp2u+9FTLoIu7E7iN9Mmjax/5Xl
         deoGrfGP56+7XOAXBHVSU6+nvuwIdpXESvNx78Ozb+7U0kQVn37ZiHumIn3KmmHweo0B
         TtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864498; x=1690469298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpzT27zKe+4sRj/CeeQND6n0p7j6R1yCRT9rnyE+1Is=;
        b=RB336s6pmpbEySvazBYaWKbUFCb/KMscZr/dnyHj0REXhR2cSwmFY0Pv9GZvyARTBT
         CmzLd10z3Q12H7D+IWPtSuIJ17MhzFoSWr5PzuZwuE5vSvJPC6HdjvnvG4rJGDLgHXC/
         Gedq0l+jCp91i0bG/0A2PS+HvT32LGS+NTxCYJNLnsJOnHLjXS9yr24/j5xQ9TW8Mlr+
         7Wf5mjXds7xJ5ATsr5VRhXxCxspfpmGv2ZeAeABoqQEJnB9n5DHRou8lhqL1mlN2zvWf
         gB+lYRdk7GvQ596vKRXGKKjQXYMpqu3I6+sYYaLR7Ix4hJihaBjXL5xaO7/xZU7f0GLG
         oLyQ==
X-Gm-Message-State: ABy/qLZpQMdddUX0bjvFhlZT0HxP18dbO+MX/oR4C3TGOXYtQTf0dekU
        OyOMu8t05kmkwmRiA/Hq6nE=
X-Google-Smtp-Source: APBJJlGYpk7SyMCBLkwuRpFOQtY7tmqzXq9RG9cE3CieeuX+3hkDJwgeLysBiZGGYPdov1LWyY8rDA==
X-Received: by 2002:a05:6a20:12cc:b0:133:e31f:e7d6 with SMTP id v12-20020a056a2012cc00b00133e31fe7d6mr3362321pzg.55.1689864497732;
        Thu, 20 Jul 2023 07:48:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m26-20020a056a00165a00b00682b2fbd20fsm1293927pfc.31.2023.07.20.07.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 07:48:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 20 Jul 2023 07:48:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (nct6775) Add support for 18 IN readings for
 nct6799
Message-ID: <1377cf68-297d-4113-be2c-102a47d8372d@roeck-us.net>
References: <20230719224142.411237-1-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719224142.411237-1-ahmad@khalifa.ws>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jul 19, 2023 at 11:41:42PM +0100, Ahmad Khalifa wrote:
> * Add additional VIN/IN_MIN/IN_MAX register values
> * Separate ALARM/BEEP bits for nct6799
> * Update scaling factors for nct6799
> 
> Registers/alarms match for NCT6796D-S and NCT6799D-R
> Tested on NCT6799D-R for new IN/MIN/MAX and ALARMS
> 
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>

Applied.

Thanks,
Guenter
