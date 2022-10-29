Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944B9C433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Oct 2022 14:04:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbiJ2OEk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 10:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiJ2OEj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 10:04:39 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA1DD2DD
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 07:04:37 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-13ba9a4430cso9242691fac.11
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5j0Ponq0jDNowHXhMOrN8+NP5VQlNfHoLf0Lr6K8js=;
        b=Tsz/meuDj/6RnKHD28JQ2lTwLqsycoDMXiVFRXzoXxrCElErmrx7snu/rnZo7uLfwK
         rP3Kolnk4XLFyIHtx8Aj/+02LrERbtrRmgApenRs5TMwU5xnbNBhprwtGSW6kbjdQTgl
         lQv9JVVOjOllneZtSFqHcHrjEy4vuWvt98TRA3zNHjMfc+abIvaGA3wfsHwDZeFOw1k/
         gK/Uimilb3EFUqkpQJWU2PjxCxkQJrde4bdNiAVqYv6OAhjazWWfbAc8ZCJjNhd+J7gH
         VT4iKIzCwbIs1TYFfcZ6Q6fBrLAMnt0JdjU4H69sIKvhWQyOFS1gUCQgFkphS24KXX5p
         Y1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5j0Ponq0jDNowHXhMOrN8+NP5VQlNfHoLf0Lr6K8js=;
        b=MZBL7wh12G0AzoRjOvjACAsezg+Mhjl+4MR7K+E5ASnyFa4C+bDjPL/OVR7ZocqXeZ
         /dOUugxVHZqTuypkmME3ZwYyc2sFhSMK7VyHCPAdX2RYl6kopwpBtCXY2tIn3l6CgU40
         dAnt4YL2TgJv5TCVHZaqgvqmUIGs6SwJfo2kSOmWphYqogj4uZGYIP1ChxFXQCftzwMi
         xwGRIrSSjw3DPD5DRVdELiM33gBs4ps1pmQij6873MM+LfxvqXiL9LBs1lTlwTnvBJ27
         5Qzxvk6WOqwvYAxXBoOTLuXfgCdIxnSi+NeMQoD/2vgoI0R+YBX0tA3xRE4mq/p+pp55
         j86Q==
X-Gm-Message-State: ACrzQf3YbKnoAIT3Z7U2Cv3PXCO9xdDOikDpJtlxBjmmA2TsqtESOw/l
        WdcR+IJJC9cUokdF8srYUZM=
X-Google-Smtp-Source: AMsMyM5EFhwxWPhmwHRKeC/M/acWqLctXGMZcWH1Yznh6JkcyfeEp2fS8bFx16VhiIIJoZK4Nx+rKg==
X-Received: by 2002:a05:6870:968c:b0:13b:cb3c:67b9 with SMTP id o12-20020a056870968c00b0013bcb3c67b9mr2468844oaq.250.1667052276192;
        Sat, 29 Oct 2022 07:04:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x13-20020a056830114d00b0066c34486aa7sm626561otq.73.2022.10.29.07.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 07:04:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4a4dd112-2c71-9b8e-8e33-95dac9a8d32f@roeck-us.net>
Date:   Sat, 29 Oct 2022 07:04:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     Frank Crawford <frank@crawford.emu.id.au>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20221029103057.3234561-1-frank@crawford.emu.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/1] hwmon: (it87) Create DMI matching table for
 various board settings
In-Reply-To: <20221029103057.3234561-1-frank@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/29/22 03:30, Frank Crawford wrote:
> Changes in this patch set:
> 
> * Define the DMI matching table for board specific settings during the
>    chip initialisation and move the only current board specific setting
>    to this new table.
> 
> * Export the table for use by udev.
> 
> v2: updates following comments:
> 
> * Converted to use callback function.
> 
> * Moved call to callback funtion to sio_data into it87_find in line
>    with other settings for sio_data.  This requires dmi_data also passed
>    to access additional data.
> 

That is really not what I meant when I asked to use a callback function.
As written, the code might as well call that function directly from the
init code, and there would be no reason to have a callback function
pointer.

A callback function would only make sense to me if it is added
to struct dmi_system_id, and called via dmi_check_system().
See other callers of dmi_check_system() for examples.

Thanks,
Guenter

