Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1C9C433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Oct 2022 22:14:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiJTWOV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Oct 2022 18:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiJTWOU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Oct 2022 18:14:20 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F961162EE;
        Thu, 20 Oct 2022 15:14:19 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-131dda37dddso1390574fac.0;
        Thu, 20 Oct 2022 15:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2yL2JYiiYo5wxOHBFlWJbQVB/KL1l9XmIZ5Wp92msU=;
        b=kVKw/fp9G6GT4CxQqCJyoDOo7CLCjonPowXdWwulqlbSp/sLZloTrJDl1QSQPYr6it
         P/Tlf6SpuZvWkmOyprhVlC1CV3wGXnzxtLiMY0qFQjJHOSC6u+yVMKKjd6C/Tf/X1GQv
         LESVwNt2gZ3cqyV/UxuiqIcEfngzSYAv+cRGxKBa1ayMup0EXAXjJ8OtiUxIBUIdQFCM
         rb/CbdqATE6C28nSrKbdlCT9c8xxL5xKCXN7nDjfMYbyY9aMuXSNFvhchAOEy0viRqV+
         rJtmXTaIPip1TXmArCDo5E6yfm1ewpSJXjHduJtUBSRZfZsQ2ybBjGTrbHXtJWqJu2tr
         EqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2yL2JYiiYo5wxOHBFlWJbQVB/KL1l9XmIZ5Wp92msU=;
        b=oB08FGR7s0xM5IijX9Qq3SvHXZwzIThjvnDnGzbRtNkjwJy/Wsg8pVxe5BtS4ZPlob
         YM39vz/D0e3zg6nSiulFDI26fjZiKQfpv29xU5dsPcOhFqzNtwpXxRB9ojETQh8WSO/w
         cGGTAzPwQPMCB5p3t8Mn5Vhjgtd9qJ3gAXOgLSMjaE5YoRuZA7Ir/JXRzjPw4XtVlOsN
         zyN04Sxey0DkfeEsQQmE7Y+cGyg2A9ghZaQ9nYRiLnrftzf3p+LgPsNLAA816Kw9KXU1
         Z0SPzJdUe3E2CPyVKBJ3n3AZCH+NT3sAIN0Ma0hMTtADEDzDR5jeq5N5imNwq2DL0+DP
         GHug==
X-Gm-Message-State: ACrzQf1b9CoRU1uTAl21sT6RHUH6Lac35s7t/w3FoAfCKMIv+xbURpa3
        ugmRdyTZg8dBbIHLdhNWDhpr+/KAIic=
X-Google-Smtp-Source: AMsMyM7ae2CccRqM1B9VaM4rk0CNtnIrM3lyG88WmZSiz/jq5Gn4J4onMLBjfQwcSq1WNShIPjshJA==
X-Received: by 2002:a05:6870:587:b0:137:5188:cea9 with SMTP id m7-20020a056870058700b001375188cea9mr10396086oap.170.1666304058482;
        Thu, 20 Oct 2022 15:14:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d10-20020a4aaa8a000000b0047644a9b49asm8104028oon.19.2022.10.20.15.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 15:14:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 20 Oct 2022 15:14:17 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 4/4] hwmon: (jc42) Don't cache the temperature
 register
Message-ID: <20221020221417.GG4035307@roeck-us.net>
References: <20221020210320.1624617-1-martin.blumenstingl@googlemail.com>
 <20221020210320.1624617-5-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020210320.1624617-5-martin.blumenstingl@googlemail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 20, 2022 at 11:03:20PM +0200, Martin Blumenstingl wrote:
> Now that we're utilizing regmap and it's regcache for the
> minimum/maximum/critical temperature registers the only cached register
> that's left is the actual temperature register. Drop the custom cache
> implementation as it just complicates things.
> 

Ah, you got there eventually. Just combine this patch into the first
patch of the series. No need to keep separate patches, especially since
a lot of the code changed in patch 1 and 2 is just thrown away here.

That reminds me, though: Make sure that the alarm bits are not dropped
after reading the temperature (running the 'sensors' command with
alarms active should do). I have some JC42 chips here and will do the
same.

Thanks,
Guenter
