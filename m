Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A237C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Feb 2022 22:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235284AbiBGWb2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Feb 2022 17:31:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234065AbiBGWb1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Feb 2022 17:31:27 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F3CC061355
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Feb 2022 14:31:27 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id l12-20020a0568302b0c00b005a4856ff4ceso11914261otv.13
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Feb 2022 14:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y32cz/oslGA4NWg0oagrM1bwIiBp6Zv0RqJd2mHPzkU=;
        b=g8Kc5G/pIFRyuDQecCnlPt+rg6DvPWUpVoqd5b1H8Ar8uIIVLu9eT+j+0io+ZQrA+Y
         21edRuURE4T8sfU/WmIVAeUg7t0cWLwGYoz1RP876RDQ+zo0XFlEfHdj+QpU+zsTPdKi
         YcLOI18MXlxSzzdIhau/ROngr9YuyigSsGLOB3rXpv0BOY8CttUFtITaLolYR0+c9+Rv
         fz6f4aGNTfsq289mqh+fJKv326eusX8shgYULxfQ2+D9XQSbKC2wgu4w4JZKATB5cLjy
         xtgxRTfYj3da2dcNieMQYPpes6RWI+11n/EgxCm53xMvJu2sARDAeWBhnMj20WptyUlu
         /FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y32cz/oslGA4NWg0oagrM1bwIiBp6Zv0RqJd2mHPzkU=;
        b=ypRD1xAbt1o7fvlHBMpv/iYAVEe5KsGb/vinKWcpiszWFb45TLzhLz+kCbAIhBP540
         7YnEQY9lBOE08eC1qJj8fCC2egQBNd/dcC8jsTwSjswvoLYHMGk8MZDMB0swpXIBv/tb
         kfIJjiXqHTFcon1c7E3isJeBG5B2nz4B/dZK6A0HyHzBoRNFFgi7mZwToPl3I7eilZBd
         BTTZi4phUiEVcX5i8avAXD4u1ClAHGOzW4qJ1bVoMj2Xw1v1irjZYykZ573IneCWVZUN
         97OUhDAfVojWOe258fC4o3g3xMWMy0oRMu0b3h32NiiBmDKVJOVtVMSe9o9sWuJS1bdF
         ydOw==
X-Gm-Message-State: AOAM533nU3J9/pfgJp0U1UsV3jfzIXZH7+U6x5t7/PC1o3FaLWDLRrzB
        0yrjcyoIkq1kxfVrh7UEfYM=
X-Google-Smtp-Source: ABdhPJyX7OuAG9dvIUnglxhF2UNcqds77S2OlsmKo7ktwBD8tRHBZuTL2pACyaimN0DfmFw3bzcoXA==
X-Received: by 2002:a9d:64cc:: with SMTP id n12mr785636otl.90.1644273086201;
        Mon, 07 Feb 2022 14:31:26 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w62sm4730261oie.4.2022.02.07.14.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 14:31:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <970d89ef-e287-8698-af2b-2eb1ac1395a3@roeck-us.net>
Date:   Mon, 7 Feb 2022 14:31:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/6] hwmon: adt7x10: Refactor to use with_info API
Content-Language: en-US
To:     Cosmin Tanislav <demonsingur@gmail.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20211223205219.2184104-1-linux@roeck-us.net>
 <39e9c961-11b5-dfc3-d8c9-9c95ef22ccc0@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <39e9c961-11b5-dfc3-d8c9-9c95ef22ccc0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/7/22 03:14, Cosmin Tanislav wrote:
> Everything seems to function fine after the regmap conversion.
> Thank you for taking the time to work on this.
> 
> Tested-by: Cosmin Tanislav <cosmin.tanislav@analog.com>
> Reviewed-by: Cosmin Tanislav <cosmin.tanislav@analog.com>
> 

Thanks a lot for the feedback. I applied the series to hwmon-next.

Guenter
