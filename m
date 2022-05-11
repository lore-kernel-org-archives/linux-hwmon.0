Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7DEC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 16:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234175AbiEKQx0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 12:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242144AbiEKQxW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 12:53:22 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C0218E0C
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 09:53:19 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-ed8a3962f8so3522114fac.4
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 09:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=ax1xgBuGwJ+WttzItaXQixxFdnAtzv+qd0OBCGBRvhM=;
        b=T8OGvApHGwvH45r+A7wLrx1RNIsVpJtfrDpublJx2QE0xTFPaJK85jNDbmQtDOu4o8
         GLeNXNjDUtTtIjeT2THT2EmbKlZFBHnrb1p36Ar7LIKpSSLMyiqM/4ld2LmHGnuYrva3
         JsFvKwqxOrrkHJw9R0sCDypP6zptQCa37fFHHDN2Qgpd0NqvLdJr0SrXK83zpqcL1FbA
         CKXWqgCuO0mOfelRJVpQ8epg5ob0nVs+ZWcPaAaoBihPBxaAzncRbeeIlf0+YvBDAkuC
         uES6Bsdt7Suq00FmNB7dWBvzN5xdYHJnNX7Lk08+6G22dfeIBVTRw7Bt2cwgRWBIqe+6
         /h4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=ax1xgBuGwJ+WttzItaXQixxFdnAtzv+qd0OBCGBRvhM=;
        b=gKVuC1len95QfeQ11+e8eG6pioiU14HZlzjBujjVGTVkM5Nf4hw6OHvoOH1Eq/fVm/
         TIHFVSXXsWENUtgjR2Avqo05a8MPKF+IE44y8vo15XZSsZlMxe5UBkU9J2R6tF94D+2J
         sbXjy5FubTyuPzUjdDQdloVyNZmimwx4hmanfyX36IQ/wXyF67D22X/bgO4h8aSq4rXW
         ona4JARctkHU2Pzm8JC0QYrUy7Qu4xpb8vg083lFSWnQGTXWWLZHffqelgrPiy7XzQv3
         vErTGQ0bqZzg7cP87tWCHClUW0oaGcYP9R+cJ2U101VLwOKEluAAcRcC5Iv5RZO7085x
         buIQ==
X-Gm-Message-State: AOAM5331NF6rN9fxB4j+BYUvNI9kCh1ElvrWfTMCfpfKcaCFxBXo8S2C
        8XGlRBDIV0DlzcyMjy02sQg=
X-Google-Smtp-Source: ABdhPJxxqaomK9We744z8/qShpXW5oViD00F1zsLNw2FhRJ1csYtNrWNZqsm4sQh+bRRg1deTyLSGA==
X-Received: by 2002:a05:6870:a10f:b0:ee:3cf3:63e8 with SMTP id m15-20020a056870a10f00b000ee3cf363e8mr3258810oae.293.1652287998858;
        Wed, 11 May 2022 09:53:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i26-20020a54409a000000b003264a325ecdsm914641oii.5.2022.05.11.09.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 09:53:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <490cfcf5-0134-bd36-1e1b-d50db8aa6d56@roeck-us.net>
Date:   Wed, 11 May 2022 09:53:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Zhang Rui <rui.zhang@intel.com>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@intel.com,
        Corentin Labbe <clabbe@baylibre.com>
References: <20220511075444.3376950-1-rui.zhang@intel.com>
 <b72b9ec1-666c-e4b0-0b6f-8b745857af78@roeck-us.net>
 <95a7beb8b4383b03799276e572298ff54a48bb2e.camel@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH] hwmon: (acpi_power_meter): Convert to
 hwmon_device_register_with_info
In-Reply-To: <95a7beb8b4383b03799276e572298ff54a48bb2e.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/11/22 07:37, Zhang Rui wrote:
> Hi, Guenter,
> 
> On Wed, 2022-05-11 at 06:12 -0700, Guenter Roeck wrote:
>> On 5/11/22 00:54, Zhang Rui wrote:
>>> The acpi_power_meter driver doesn't create any standard hwmon sysfs
>>> attributes under its hwmon device node, but instead, the driver has
>>> its
>>> own code to create the hwmon style sysfs attributes in the ACPI
>>> device
>>> node of the ACPI Power Meter device.
>>> I'm not clear why it was designed in that way.
>>>
>>> In order to elimite
>>> [   79.960333] power_meter ACPI000D:00: hwmon_device_register() is
>>> deprecated. Please convert the driver to use
>>> hwmon_device_register_with_info().
>>> convert the driver to use the new API, no chip_info or sysfs_groups
>>> parameter needed.
>>>
>>> The only difference brought by this patch is that the "name"
>>> attribute
>>> will be created under the hwmon device node. Not sure if this
>>> matters or
>>> not.
>>>
>>> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
>>
>> No, this is not a conversion and not acceptable. Corentin Labbe is
>> working on the real thing. See
>>
> https://patchwork.kernel.org/project/linux-hwmon/patch/20220509063010.3878134-3-clabbe@baylibre.com/
>>
>>
> Thanks for the pointer. And this was my original intension about how to
> do the conversion.
> 
> But then I realized that, just like I described in the changelog,
> the original sysfs attributes in this driver, although they're hwmon
> style, but they are actually located under the ACPI device node.
> And the patch above will move them to the hwmon device node, right?
> 
> With any patch, this is what I got under the hwmon device node
> # ls /sys/class/hwmon/hwmon0/
> device  power  subsystem  uevent
> 
> and this is what I got under the ACPI device node
> # ls /sys/class/hwmon/hwmon0/device/
> driver  hid  hwmon  measures  modalias  name  path  physical_node  powe
> r  power1_model_number  power1_oem_info  power1_serial_number  status
> subsystem  uevent  uid
> 

That is part of the conversion to any of the new APIs, and intentional.
If that is unacceptable for some reason, you'll have to stick with the old
API and accept the warning. Abusing the new APIs is not acceptable.

> Plus, in that patch, I don't see how to handle the power meter
> capabilities change, i.e. METER_NOTIFY_CONFIG event, in
> acpi_power_meter_notify().
> According to the previous logic, we may need to remove/add different
> attributes based on the new capabilities.
> 
> In section 10.4.1 of ACPI Spec 6.4, it says that the _PMC information
> "remains constant unless either the power meter's firmware or the BMC
> hardware changes, at which time the platform is required to send
> Notify(power_meter, 0x80) for the OSPM to re-evaluate _PMC"
> 
> If this could happen in real life, we cannot rely on a fixed
> hwmon_chip_info and attribute_groups at driver registration phase.
> 

You have a point. However, if anything, that means that we might have
to improve/extend the hwmon API to make attributes visible or invisible
dynamically (ie add an API call such as hwmon_update_visibility()
and have it call sysfs_update_groups()).

Thanks,
Guenter
