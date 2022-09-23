Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345DDC07E9D
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Sep 2022 21:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbiIWVhH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 23 Sep 2022 17:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiIWVhG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Sep 2022 17:37:06 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4A813F2AC
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 14:37:05 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id go6so1207179pjb.2
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 14:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=SV2A25WX79kur/BCPZWbENnaLUg4r98e5gh35xPUVI4=;
        b=knLbNyQgh8YhmvZMSZgEqG8pomBJw77FQdIG0687JTzHacTeGou+FD9YV6SbxZOcff
         sRwG6viavN9pSXeg7tJHChrN62UdWfkLCm2qo/5UIM4mL162/QntwWjU4HYmIWDM00Kd
         19uI08ig5e4us2VFf5uuYOJ6d+JRGMrGccbIUCw7RqSRJIg2GWdhcev+nHfyAAuYBHLt
         vDHu2Cl+LU3VP1qIbIK1kMW3xabWW0DLd5TbfZYUYveIena1eDW2H5/wO/Qqy2DW5TQl
         h+7SbWK6IjktjA99a2HeJctL2r20VS6R7WZ2nRZXbL+hN54cgiQFVTUYEzSbQyxV1znX
         Ge4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=SV2A25WX79kur/BCPZWbENnaLUg4r98e5gh35xPUVI4=;
        b=eoVBUYU2CIfcfCa906+GbhwQRRoKh88wWMSSOD8iLzUojU7aNdcMEyXE+ck3Pl52/S
         G8tWGi0Ec06y80uB2PhRUKKnj/LPcgLvY/RmnRhYyfADuLARDKtVXrNyxEfnaBeym+xW
         SlzSvQL68y/YPOnYo5K/+Md1zqms6sekbrPB0IKD+6H9sHCEOnEPhI+6rzfE45KgE1b3
         MIqlDGeqOrInw/JdlADuZxTVK1D+kHaryHGceOtoYmDPh3vXylNY2bslpxlf9NdNap+A
         R6vD/LBve4+/sa61rsGXski9ocvCsJfqi8RC+alFCTLd8VD0bjiijKmRLfBMchjgTovX
         8Umg==
X-Gm-Message-State: ACrzQf3cN9gYHgpYbSW5omQduxWeTkH7MfazPymAq92+XGnCjzmCH/KV
        hGYUXbA5vOzDlm+PNKPO3q3hG82jzEfPxg==
X-Google-Smtp-Source: AMsMyM6Z1QobqPSAZ5AtigHTYmHuIfxjkx2Ss5O5j02n8C/c8w9m+G9vgsR089eRUtC7AmkhM0xCsA==
X-Received: by 2002:a17:90a:8688:b0:202:91d7:6a53 with SMTP id p8-20020a17090a868800b0020291d76a53mr23521365pjn.153.1663969024803;
        Fri, 23 Sep 2022 14:37:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g189-20020a6252c6000000b0053e47dcfa32sm6843593pfb.155.2022.09.23.14.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 14:37:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 23 Sep 2022 14:37:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jean Delvare <jdelvare@suse.com>, kernel@pengutronix.de,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: sis5595: Reorder symbols to get rid of a few
 forward declarations
Message-ID: <20220923213702.GA821254@roeck-us.net>
References: <20220922074900.2763331-1-u.kleine-koenig@pengutronix.de>
 <20220922074900.2763331-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220922074900.2763331-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 22, 2022 at 09:49:00AM +0200, Uwe Kleine-König wrote:
> Declarations for static symbols are useless repetition unless there are
> cyclic dependencies.
> 
> Reorder the functions and variables to get rid of 6 forward declarations.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to hwmon-next.

Thanks,
Guenter
