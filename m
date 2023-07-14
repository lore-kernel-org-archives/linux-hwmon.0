Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209DDEB64DC
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jul 2023 21:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233424AbjGNVJp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jul 2023 17:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjGNVJp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jul 2023 17:09:45 -0400
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F122707;
        Fri, 14 Jul 2023 14:09:44 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-76c64da0e46so96314439f.0;
        Fri, 14 Jul 2023 14:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689368983; x=1691960983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltyhVYjR2shMDLmKm5IQVBYBbYs8cms0eBVoqgRDuTw=;
        b=eyotQDhFs5xKQClvWWX1K4o6DynTNkTI02Khi/Pmbc5ejabXV/UBL8F2HVhS9XFkF5
         k7018h/5a61iR05XjvAbTQxY5u6XOVJ4VUu5vfwAHdT7eZ0iKISIP6kERegmgUx908Oz
         w/B3w+JnwUO4XFJxe+mdpKbDJ/3TzZMFyJtLuK9x0jcMZDmhJ8a94QphWbbuhCH3yAHq
         zlENCuRYUDH+Lt1UraUeOtjujhO1dlvWxcu91OmXKMwRkNGtIZz1rYxD0pgYyT83pKLQ
         Kivy8v7CRWOjqPQUsHx2rWYfNR+cg5tH3NNbyconG3PpBX5ybKIgeXiDSTwV1JVLCK/p
         YpdA==
X-Gm-Message-State: ABy/qLZthXw6Dbb0bkDeQDmNY/1nYUB5owONiyA/z3rwfzm5JhXSEjtL
        rONKok4MX/RCq0Rb7UR+yw==
X-Google-Smtp-Source: APBJJlHxrwq4E2N0WWcsJ6nJ3AUi5PtN6orp2YYXIkQAzOb9QFEYwMiqlXFVjHXvtVWnMsJItUCa7Q==
X-Received: by 2002:a6b:e80c:0:b0:785:d0ee:46b7 with SMTP id f12-20020a6be80c000000b00785d0ee46b7mr5299272ioh.13.1689368983627;
        Fri, 14 Jul 2023 14:09:43 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id q18-20020a02a312000000b0042b1a9f8480sm2683499jai.35.2023.07.14.14.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 14:09:42 -0700 (PDT)
Received: (nullmailer pid 245829 invoked by uid 1000);
        Fri, 14 Jul 2023 21:09:27 -0000
Date:   Fri, 14 Jul 2023 15:09:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andre Werner <werneazc@gmail.com>
Cc:     Andre Werner <andre.werner@systec-electronic.com>,
        robh+dt@kernel.org, linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        devicetree@vger.kernel.org, linux@roeck-us.net
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add description for new hwmon
 driver hs3001
Message-ID: <168936896698.245603.13660520595791213859.robh@kernel.org>
References: <20230714064336.28371-1-andre.werner@systec-electronic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714064336.28371-1-andre.werner@systec-electronic.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On Fri, 14 Jul 2023 08:43:35 +0200, Andre Werner wrote:
> This is the initial description.
> 
> Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

