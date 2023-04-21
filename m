Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E66C7618E
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Apr 2023 14:28:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbjDUO2Y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Apr 2023 10:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjDUO2X (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Apr 2023 10:28:23 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E14187
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Apr 2023 07:28:21 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-52091c58109so2007479a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Apr 2023 07:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087300; x=1684679300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+ipu2HuyViFRmMWvB8aU78ALO5jqvY/Wzf4SUBqRjdU=;
        b=NLnhD3W3x6sZfkTOhtF9NCt22RWz4FLZQJS1/WPTi98uVs+dPPg3oS6LriRD7WP2kk
         pRtGFp5o0j8H90Tr4FxWTnKgk93LBqfyJiq4ezw83cQD4rnP/smWbmHhgOm5o6qm7kEQ
         0BVMadP9WFPTT9ZFNi1TBSjjZkpUfMOKiDP2KTrmlGhPSFt/VXaBGm4MoAvh/iTmy+iN
         SwvpyTrMcnN2sxG9wea8bKscF1in7EA4VGO4T5jfHfNkxyZPjrvmU3jubIaqKkXF1+p1
         8ZF5LkXC6PRolQJqVghni8YJ9Xt73J0aWVLkEl9K2tm5aWuzCz9COv2S28KoPQQBITNu
         Sssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087300; x=1684679300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ipu2HuyViFRmMWvB8aU78ALO5jqvY/Wzf4SUBqRjdU=;
        b=GKMEAjLLgBOww6qo0W9ezxqyLvRtl2oLfcDRPgUBR0qOsGvzIGSEiZv8TsUFtrGsQC
         1pORk/Bedhgr7lMyrWH1/vlssC/+W5aiW/CX6EHGEUSChu175f6W49khJuc+xtmalAek
         soBP1heTifb4J4rEZcFS0HeGvc27IAi0Qf3yN4ckQPtFXBSohulQk5MQqx/l3IxxY9u8
         auv+jCe5bo9MXUk29R8OFaD34hVVu7HaBoFtGjy34F3AgwbYuP5zC+LJju05ROIc1l0i
         Yq3lsQJQ3r9iq1C4Mi/DeH2tS31E0+3RT8HEeCcDOudMSvP0k+LYjVcw22Oy3Q1sBNx1
         AmlA==
X-Gm-Message-State: AAQBX9cDUZ/yvmULC6kYEwdAPaBcJHpjnfMeCklw9rqLgVvCWkmtxXQ7
        RHXLQsSm1Pa7ogcXWkbSdBEAB8PlelI=
X-Google-Smtp-Source: AKy350bVy06ZqQjxbn2VdUookb/DhdJVRlMoHSIydn+39+Q4cJuxQ3/qY8FkcjZUOWYvaSKyT67pag==
X-Received: by 2002:a17:90a:c241:b0:246:b038:2f53 with SMTP id d1-20020a17090ac24100b00246b0382f53mr5731189pjx.24.1682087300646;
        Fri, 21 Apr 2023 07:28:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902694900b0019c32968271sm2841450plt.11.2023.04.21.07.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 07:28:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <262b6016-5b50-4bf2-cf2d-a316bc5f81a7@roeck-us.net>
Date:   Fri, 21 Apr 2023 07:28:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [bug report] hwmon: (it87) Test for error in it87_update_device
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>, frank@crawford.emu.id.au
Cc:     linux-hwmon@vger.kernel.org
References: <112b38d0-54b5-435d-9ce6-250b8b0e78fb@kili.mountain>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <112b38d0-54b5-435d-9ce6-250b8b0e78fb@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/21/23 03:45, Dan Carpenter wrote:
> Hello Frank Crawford,
> 
> The patch 27302e7a46f5: "hwmon: (it87) Test for error in
> it87_update_device" from Apr 16, 2023, leads to the following Smatch
> static checker warning:
> 
> 	drivers/hwmon/it87.c:1147 show_temp_type()
> 	error: 'data' dereferencing possible ERR_PTR()
> 

I updated the original patch. No need to send a fix or new version.

Thanks,
Guenter

> drivers/hwmon/it87.c
>      1141 static ssize_t show_temp_type(struct device *dev, struct device_attribute *attr,
>      1142                               char *buf)
>      1143 {
>      1144         struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
>      1145         int nr = sensor_attr->index;
>      1146         struct it87_data *data = it87_update_device(dev);
> --> 1147         u8 reg = data->sensor;            /* In case value is updated while used */
>                            ^^^^^^^^^^^^
>      1148         u8 extra = data->extra;
>                              ^^^^^^^^^^^
> 
>      1149
>      1150         if (IS_ERR(data))
> 
> This new check happens too late.
> 
>      1151                 return PTR_ERR(data);
>      1152
> 
> regards,
> dan carpenter

