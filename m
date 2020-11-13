Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C4AC388F7
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 13:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22CCE20797
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 13:58:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhsqlDFX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgKMN6i (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 Nov 2020 08:58:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgKMN6i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 Nov 2020 08:58:38 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BC8C0613D1;
        Fri, 13 Nov 2020 05:58:38 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p8so10030552wrx.5;
        Fri, 13 Nov 2020 05:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J+gg0ovYS/kFMCNVWDxGmEGkGeubrfUhWWcdTIUU8sY=;
        b=DhsqlDFXZ1TYOzf4ZIO3E590yY3ARpU/TE8FPKtgs8Mz1rvy2h9oPNO9OhaAU2xw4A
         +toxG30ZvdecWjuwi2O56LavK7dH9A8Gv93ZzPaFxZH9X9glqvQ9fmlqEJ2jvnE3RFhS
         HZ0oYgvckZSNyF+2G9vGdoR+Y5z4t232eqZ8pgvOPsr5SG+89kommRgcCZIPGX9T0ff2
         LbY2B3V2i7D9THBoRlv2MVcQRbf+ZhgN+5PjAr6lRYGX2sIUqYGTmpqLfI4OBVP8l4Xt
         dPeIQfJzywqnLaXi2P14d63Yq+K7RkY/GCqn6SsZmEraQnk6YwhC4JMqWZvctpPDpk3S
         LEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=J+gg0ovYS/kFMCNVWDxGmEGkGeubrfUhWWcdTIUU8sY=;
        b=pBwbtPURG/8Wo7Fo0nLC1vswm97fK8td9Pk0UeFXKvHHRrowEggbNu9xxwMDXWhqWO
         sHa3oWsgS9LUP2BzqVid8HMUIv9O2Ikuj9QdHZJaQdtjDRhcVb/GKIf/KvBzM+i/x9gD
         O7D0eMJIdtzMDsSNd1PjOS9a+8vua8mwApe1jRTZZcNWmMWt2vPuFVSqs9ubSqmf2j9E
         j8g/Z1Pjy8lWxb+7IVRfeuZUYXGssrrxr8Ww0+H9+UU0OtcIMlrNBrsf5v6D9eEs505b
         3vXy9UFE1ChMo+W9QI+/Bgg5sYSQ50KuKdqkiIPogA5cqmvVRF6wCEgqZMaElpfcA4uK
         7ZEA==
X-Gm-Message-State: AOAM531ydOHPQjtabKrcZhFrRy+stTRtfFRd3fj9jIJzoiz/oOnthhGe
        BY04GT7m82sUoOBrLtYBK4V6I/Ip38VR8g==
X-Google-Smtp-Source: ABdhPJzYz22bryFMCzEkAbbqMDPgVzMZrxQoNUuMNSXxtyUxM//V1RgNPbSy+0BuDv/sPTTPoUeAvA==
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr3576966wrw.123.1605275916614;
        Fri, 13 Nov 2020 05:58:36 -0800 (PST)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
        by smtp.gmail.com with ESMTPSA id v67sm10897728wma.17.2020.11.13.05.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 05:58:35 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date:   Fri, 13 Nov 2020 14:58:34 +0100
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org, naveenkrishna.ch@gmail.com,
        stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: amd_energy: modify the visibility of the counters
Message-ID: <20201113135834.GA354992@eldamar.lan>
References: <20201112172159.8781-1-nchatrad@amd.com>
 <238e3cf7-582f-a265-5300-9b44948107b0@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <238e3cf7-582f-a265-5300-9b44948107b0@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On Thu, Nov 12, 2020 at 09:24:22AM -0800, Guenter Roeck wrote:
> On 11/12/20 9:21 AM, Naveen Krishna Chatradhi wrote:
> > This patch limits the visibility to owner and groups only for the
> > energy counters exposed through the hwmon based amd_energy driver.
> > 
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> 
> This is very unusual, and may mess up the "sensors" command.
> What problem is this trying to solve ?

Is this related to

https://bugzilla.redhat.com/show_bug.cgi?id=1897402
https://support.lenovo.com/lu/uk/product_security/LEN-50481
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-12912

?

Regards,
Salvatore
