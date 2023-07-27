Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D95C41513
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jul 2023 13:34:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233446AbjG0NeT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jul 2023 09:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232976AbjG0NeS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jul 2023 09:34:18 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3F42728
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jul 2023 06:34:17 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bb8a89b975so5306105ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jul 2023 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690464857; x=1691069657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=l4G/9z9LnqBB5PAJZaxWlUNue+bUXFiuHTeCc8qikqY=;
        b=T4p5HIXTQ+GAwQVgEGsWHCqOEHrU7xsS96eLArD3QdNI6ZIC86HPjaRK+H+9DNgejL
         m72pUOQoI0k9T/e2lSkM851mh0VP5a2lVm7mVaRrhSBL0TW21vFs9yCYOtuAyld6JCBy
         Kmx9nZQHpS0qPG4UV4kZTDPT1euHLPIzT/f1yPdUeHAr5oyDIAI/Jgeo/I8hkkNmvgQz
         vlczDBmkqwVBxxDOGmw8r0HHOm+l/ApLdZp6bdz+m0Dvs8l7EWwfZlMlXeXtsmnSYfsi
         y3fhygI6MfSK2TqmJAWf9jFa+VdUngb+OT27zrurXa3pEfhBHjVT++Hr3ctPbtehlkvj
         lYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690464857; x=1691069657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4G/9z9LnqBB5PAJZaxWlUNue+bUXFiuHTeCc8qikqY=;
        b=HGVFcUqX7KVNbASh82F6HvUhVuwRARNOZIF6nHkffZBNUeGB1pckd8APT6FNwiQOuL
         BQSQdrJ9uOIm86bYokIF4BVQNf1D93HmJtnQ5DUeqmqaYPlbk3pSxwtlDXWrKxl+QAIa
         RZ2mKhI2RGL6SqxQM3rtLeJIpH0OepFE7VuH1e7daLWvD4OJukqXZqF5hFtbTr6GW+0J
         DPmZJJVTOYFa5UQ2AS0v+u0noDmaXz0hZbaOqxsck/8sPRGLKoDTJNAIe7KEYv5p6ny+
         2cBFIq7nThW9adVCdKbWR+O5Zt6UOLDg8sLIZOXHGKbzTkqENLqiXS4fibtKj6O0zeIt
         YKCQ==
X-Gm-Message-State: ABy/qLbVp4a/MAfU/e7zc2zpt3vA6bAnqSd4OGkNPWP3NbL3x4v7lkV+
        gAwC54q7iwpoA3gqzjYXWis=
X-Google-Smtp-Source: APBJJlGK4KwaiX5fPx/Qw95XZhLrGeF57sPh9iTH+sGR/ZHYr/Ui7iRPMuCLg/IhPPT8fBYe1Bv8Aw==
X-Received: by 2002:a17:902:e744:b0:1b6:a99b:ceb1 with SMTP id p4-20020a170902e74400b001b6a99bceb1mr4982484plf.50.1690464856857;
        Thu, 27 Jul 2023 06:34:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l9-20020a170902eb0900b001a24cded097sm1614316plb.236.2023.07.27.06.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 06:34:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7ab9f3c0-5677-ceb5-b9af-81af12a32cbc@roeck-us.net>
Date:   Thu, 27 Jul 2023 06:34:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hwmon: (hs3001) Switch to use i2c_driver's probe callback
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andre Werner <andre.werner@systec-electronic.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
References: <20230727071123.512966-1-u.kleine-koenig@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230727071123.512966-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/27/23 00:11, Uwe Kleine-König wrote:
> The previous mass switch of hwmon drivers done in commit 1975d167869e
> ("hwmon: Switch i2c drivers back to use .probe()") was based on
> v6.4-rc1. Since then this driver was added which needs to be converted
> back in the same way before eventually .probe_new() can be dropped from
> struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> this driver appeared in next today. It would be great if this patch
> could be added on top to not interfere with the quest to remove
> .probe_new directly after v6.6-rc1.
> 
I just made the change in the original patch.

Thanks, and sorry for not noticing.

Guenter

