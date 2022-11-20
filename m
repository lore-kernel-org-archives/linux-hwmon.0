Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55BEC43217
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Nov 2022 13:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiKTNsh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Nov 2022 08:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiKTNsf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Nov 2022 08:48:35 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A8127B06
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Nov 2022 05:48:35 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id df6so4260001qvb.0
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Nov 2022 05:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9px8nfoieV+tXmGirvLEFSnQ0wBoah2Er3GnKK9NGoo=;
        b=kxU4MU8gErynQpv9QUshQWyYs+i/E5C3/HvSZi/aKfjFaxGXIPP9vlcznX9Nbht7Lg
         Vuq4GX0Gsrj0aukcR4X/pWstRKMHH1puI/+fQy3v0AV97D4zof2qoDWMY8P+2cg0ITOZ
         znZjSAU9atKE3cIPDxUP2syi3b8OIy4rwdb36xZ1R+QIZfL/4+YmFgroavuWE5iyI0+8
         pFI49SBx9bU3j6l/K+xKxIqO0saWep5FQaFwLuoDRViuKmP3WJCXPAo5PqcFWyAW8nUK
         Gn1I1TIhjQyZihA940HL9D8ybLndDhK/h4ZFicvbQ0cnM7QX++HbOrlg0LfgP/Mom3hg
         xvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9px8nfoieV+tXmGirvLEFSnQ0wBoah2Er3GnKK9NGoo=;
        b=SJWRioM5xRQWhYDuO5vJBPGublBNtoPJbSofV9CcqL48vQldyzG7A1LbDIpYMgppKN
         eVtPHjMlELLdAnwBAUnljEgkR9+chzZJwJZspppwxv2y6TDchOGCtmZojfEvwVCrMO0k
         /q3IRDSFoTLFquIE909UmD9LCmoQMP683R2zL/pS/TR6bQJkiBrYK5reb1Z+1HYHcT6T
         +fR2YMIEmuZQX1rAki37UAJJUk/PwRTagDfAcUTsQ/HmV1Ske6RVq9Uu2jLGf8wFnMa0
         NsGHftydv9OBJ/BvhCipZV0yL+VzaJuAIeeSomJpbKjM3O3mx196r8oCbmthOxrFDza9
         kGmA==
X-Gm-Message-State: ANoB5pmLcwI4dicAWcGQA1rzCg8oQXU3m/RwsDCcEPsz1dJwkmBAfXlr
        z2Wpw9iWLHPFg9IAWRCBVe76t3NWVoQ=
X-Google-Smtp-Source: AA0mqf4QodXMfxun/LCqFOJM16bUHQlC+W4KVPnk58QFQpmGJ+kb+RIqe/yI9pi3GZtiksGeFqfSRg==
X-Received: by 2002:a05:6214:4247:b0:4bb:5afd:8890 with SMTP id ne7-20020a056214424700b004bb5afd8890mr4366232qvb.57.1668952114175;
        Sun, 20 Nov 2022 05:48:34 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id cn6-20020a05622a248600b003a4cda52c95sm5275387qtb.63.2022.11.20.05.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:48:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 20 Nov 2022 05:48:32 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     jdelvare@suse.com, djwong@us.ibm.com, mhoffman@lightlink.com,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: Fix possible UAF when ibmpex_register_bmc() fails
Message-ID: <20221120134832.GA1787348@roeck-us.net>
References: <20221117034423.2935739-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117034423.2935739-1-cuigaosheng1@huawei.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Nov 17, 2022 at 11:44:23AM +0800, Gaosheng Cui wrote:
> Smatch report warning as follows:
> 
> drivers/hwmon/ibmpex.c:509 ibmpex_register_bmc() warn:
>   '&data->list' not removed from list
> 
> If ibmpex_find_sensors() fails in ibmpex_register_bmc(), data will
> be freed, but data->list will not be removed from driver_data.bmc_data,
> then list traversal may cause UAF.
> 
> Fix by removeing it from driver_data.bmc_data before free().
> 
> Fixes: 57c7c3a0fdea ("hwmon: IBM power meter driver")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Applied.

Thanks,
Guenter
