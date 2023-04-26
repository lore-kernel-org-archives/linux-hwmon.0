Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A92C77B78
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Apr 2023 18:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236276AbjDZSu4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Apr 2023 14:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235605AbjDZSuu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Apr 2023 14:50:50 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9848699
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Apr 2023 11:50:49 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63b4e5fdb1eso8815473b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Apr 2023 11:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682535048; x=1685127048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGlHwl4C/tjU+EyG1bSGJkwdQ/pjbSdAgso3xqSLYaI=;
        b=r2SQqyEJcjipV2dBn90GorMeZwerCL+MVZRw+3sKFQoWFJ/LEr419MC02stK4wUxau
         wd2ugIxOcGwPMoBOESVs0wthtGLN09aK0FxypcKuPUU/TDvQKX4yiuSQaNq8/op1u7ie
         CPuvRvgMW83wIKaaaiYc/0RSvmjUPHQD5X7JSnqwUvKQsMDWCzpL224e3guCbjO9oUJS
         zKJIssVPKer8ux9E7dLb1AysaO/HRPlM4+tPScjKWnM8dx73FolqQxp8eAPaUEsvF/B+
         fcaX8Gnre5+ossW2faUO5Hsquj7uzEXcqYa/m42bixhT56wq2JYZw1FPAqjAjxQOPZgX
         PgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682535048; x=1685127048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGlHwl4C/tjU+EyG1bSGJkwdQ/pjbSdAgso3xqSLYaI=;
        b=Tq6rcPi7Rb0rjQRT2kxvrr6tdwLU1qQx/Vm5kjTVC2df4BZ6kxzPSPwlE+Z9+pgTEH
         FEtVOSO/eCprhSczv7S9Jm5vUZmhoZRHFR6+icGFLklGw6RSrTWkAU/IX5BJRjXpm6gm
         wHkb8N1VUHXzBl6yMfS12GtuhIIBrOHIsxQM420vYUqWGa5HGv9s5hxoXwE9eUfe3M6v
         iq5msV1ZB6390HtpuK2M8IyQlO5o0rrumVlOF24wvL2XY8Y5UxVS83VFxKmlQLEB84dW
         hH0tVS4VsF/huG9TB3MgSQDiAOSHHaZmqODr0v4mR3rFon0Zi1hRatBtd++oFSKWLsds
         IoYA==
X-Gm-Message-State: AAQBX9fiqOXovi54fXu6/5BGNkpWBsFzMLCouRrBHyu5PprMiR7erf+W
        pr7jZpCsvsMPLIv5mS0r9/k=
X-Google-Smtp-Source: AKy350Y8vEbk9rFEg3xPfEVBPdO7iVIasqTmwPlAtCoSq1XmgB5RIDiq4msK9O7/TnC3JLh+9V3BSQ==
X-Received: by 2002:a05:6a00:1947:b0:63f:18ae:1d5f with SMTP id s7-20020a056a00194700b0063f18ae1d5fmr26395531pfk.29.1682535048267;
        Wed, 26 Apr 2023 11:50:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u29-20020a056a00099d00b0063d2bb0d107sm11694654pfg.64.2023.04.26.11.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:50:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 26 Apr 2023 11:50:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Renaud Lepage <root@cybikbase.com>
Cc:     Denis Pauk <pauk.denis@gmail.com>, linux-hwmon@vger.kernel.org
Subject: Re: hwmon patch
Message-ID: <638be9f0-4258-4418-834d-4f8123fefa26@roeck-us.net>
References: <SJ0PR12MB5673DC1F156198075B347F90BF659@SJ0PR12MB5673.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ0PR12MB5673DC1F156198075B347F90BF659@SJ0PR12MB5673.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 26, 2023 at 04:38:53PM +0000, Renaud Lepage wrote:
> Hello! Sorry for reaching out at random.
> 

In the future, please use the linux-hwmon@vger.kernel.org mailing list
to reach out.

> nct6775-platform.c lists support for a NUMBER of motherboards, of which mine isn't listed. Is there any specific reason why the Strix B360-*, H370-* and Z390-* are listed, but the Z370-* are (conspicuously) not present?
> 

Presumably because no one submitted a patch adding support for it,
or maybe because it doesn't work. Denis, any comments / feedback ?

On a side note, please never use all-capitals for words.
That is equivalent to shouting.

Thanks,
Guenter

> If it's lack of testing, I volunteer as tribute. I'm running a https://www.amazon.com/gp/product/B075RHWCBT/ right now.
> 
> --
> Renaud Lepage
> BScA Informatique et Génie Logiciel
> BAsc CompSci & Software Eng
> 
