Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E511EC6FA8E
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Feb 2023 15:04:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjBYPEa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 25 Feb 2023 10:04:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjBYPE3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 25 Feb 2023 10:04:29 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D7610254
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Feb 2023 07:04:28 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-17227cba608so2912137fac.3
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Feb 2023 07:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5EhweQDhkBLddp/RbQ8vp9RRN9AKnSy9y3GcI2kBKMo=;
        b=Gl6WjMwpceFLcWDYmfQmdpHMzG8oQYrFoto5r5Eds0HDFq1tDjgzbH1ScFJmcuyF9J
         gNJoIVNL+fRqRbkUmw29sJBYiXafh2HX+MIXa/EEOh+UelC7fzPrIYgr1NRL3+B/2RMK
         CSR2tWCTwG0bIrFFDqDezNa3jL2T0sh5VjrdBs0UbIZS5kKotH6Ky/xGAhjZ//4HJp0y
         3cpg9B58JsCWyU+bO54Wx3cSaVwVYTKlcbquP0cpTXFhOLqmToe/GDpqFcNVLOl/uYZo
         cZKMDoE/ZvOyTDQaPO+xC4ecPHr6rvCIw8WFjukEMdUlsBznNSExisOncogYXCYfWWfv
         Eaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5EhweQDhkBLddp/RbQ8vp9RRN9AKnSy9y3GcI2kBKMo=;
        b=Ge3Ft55RF6JHrgBelcf3RhAZIZHKWXOhnRJWPMFFIp5GXJiizydrNRh8V0wmx/qmOs
         3i0XdRcwxZNdVB9Ug/P/ucuYlriIc+bs+ak8c12Q0Y5sMtTPBpWMgen5Y+/PqUXrNv8n
         u2Wxiy66TqGsVUBMDsG2g/35xYDoRbdva1+uDyzYvmtejUdMq8+M1YlmteLKbg1kzzBY
         +e744wY2ns49j9k1Foxtjev/Mt7kZZ0jLD1I2ShQ7JdTrGe8nZFTrA1Mx5RLb/lI11Ik
         QdpRx91MXDMUAMM5hcBF3AsXj9j3Wh9ln8gVligB75C3zm4UdI5fX2vn/zuwisZ4syKM
         m0Ug==
X-Gm-Message-State: AO0yUKVzDRzyq0OqJAKn1Rue2mzDnkM5DFruqldvDYG2xTva/QgQMyIC
        w83YsPIYepQzNbM5BsCclz3rpjipENk=
X-Google-Smtp-Source: AK7set+ZBXBwxEH0pR8nq2fn24SFWCJdq5gRz8w+uGhpFHtcOZCGJjfa0/W8SaJjvWgWlq2SL6EqFQ==
X-Received: by 2002:a05:6870:6123:b0:172:79f0:e81d with SMTP id s35-20020a056870612300b0017279f0e81dmr1789545oae.8.1677337467488;
        Sat, 25 Feb 2023 07:04:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b19-20020a056820135300b004f9cd1e42d3sm766288oow.26.2023.02.25.07.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 07:04:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 25 Feb 2023 07:04:25 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Aleksandr Mezin <mezin.alexander@gmail.com>
Cc:     linux-hwmon@vger.kernel.org,
        Herman Fries <baracoder@googlemail.com>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (nzxt-smart2) add another USB ID
Message-ID: <20230225150425.GA3691254@roeck-us.net>
References: <20230219105924.333007-1-mezin.alexander@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230219105924.333007-1-mezin.alexander@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Feb 19, 2023 at 12:59:19PM +0200, Aleksandr Mezin wrote:
> This seems to be a new revision of the device. RGB controls have changed,
> but this driver doesn't touch them anyway.
> 
> Fan speed control reported to be working with existing userspace (hidraw)
> software, so I assume it's compatible. Fan channel count is the same.
> 
> Recently added (0x1e71, 0x2019) seems to be the same device.
> 
> Discovered in liquidctl project:
> 
> https://github.com/liquidctl/liquidctl/issues/541
> 
> Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>

Applied.

Thanks,
Guenter
