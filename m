Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26F1C77B7A
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Jun 2023 01:43:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbjFLBnA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 11 Jun 2023 21:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjFLBm7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 11 Jun 2023 21:42:59 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41A0F0;
        Sun, 11 Jun 2023 18:42:58 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso39471865e9.0;
        Sun, 11 Jun 2023 18:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686534177; x=1689126177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJ3L8d7H1al/XCBYgfDABPwcj+9CgFQ1uhpMmg8tLFw=;
        b=YrCSBa/HlivCvBCVejVf4szh9u3ZzJk/97t1dAoztEYwGqYJTlygJHfrPmMkhiS1bs
         P5ZG8JU8IRmtg/XG+xEGQeH2eqJ48dKoxG2X2QWO62rV2dA2hoEv3q4BU2pkG4RROSVI
         UbixJWQkkFKu8U76y1o9QtdjnARevZmbTO9ooewcpFsWMq/d6GVoIXxX37G+xJp+jsEq
         2yMO/GgtI/5B7Wc20hYJNeIcuNqyL5BzOp0c3w9widfsHWpmLUOAxCMg5+8qAniUx96N
         iDZr4XKq0POAXbGHeelfw5AUNUQroMEl26VSPNqPLnZXDgdVX7CN/xuu2UbDPLLTxy6n
         +2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686534177; x=1689126177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJ3L8d7H1al/XCBYgfDABPwcj+9CgFQ1uhpMmg8tLFw=;
        b=Xt8EPvpo8eNpub0N34WhLwA32+HSa1VGzaY2CKI8C4j6QwAuLcifitD9fiWY397MoF
         6nVXv4E5a1vrXlaIUsEzUMb4M8jQt1xyRIOr/W25qZzjhrmVcAFftl3JPguYBOpF89Cx
         c6QJ8RuzMRvgbAGyVHWASRsGMJSd0KK4vulnQGIoV9H9T3v793zbYvuX2NM0OgW2nTLH
         xrfPnBlcPdr/vxU8+xuHpPZbLI8MSHfyhGW/AxiYK3jIZwlPu814QCwmpxNRAh5P6Xc1
         3kOeFh8+IFxtQUSLC7Jyt7a89bwfTya0EtDIrIlwq81u6mVMF/XVbeej/eKPqJJyRoBH
         dI9Q==
X-Gm-Message-State: AC+VfDwK71/m4AZdwQZAtuoHxVVLGQUmybu/EVPtNoYIwgjmhfoB1+FV
        kjRWkGssY0Q1TK2VjG8rLcxG23getPUxPQ==
X-Google-Smtp-Source: ACHHUZ5uZyXyqI1SDe4IGuFmMUgHBiVfmTfAk8MyK/tXOuq4WxiqalciA8Nk3idZyxBOnCyPchXxaw==
X-Received: by 2002:a05:600c:aca:b0:3f6:44e:9d8 with SMTP id c10-20020a05600c0aca00b003f6044e09d8mr6784156wmr.22.1686534176921;
        Sun, 11 Jun 2023 18:42:56 -0700 (PDT)
Received: from localhost.localdomain (bba-2-50-150-163.alshamil.net.ae. [2.50.150.163])
        by smtp.gmail.com with ESMTPSA id a11-20020a05600c224b00b003f8126bcf34sm5421323wmm.48.2023.06.11.18.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 18:42:56 -0700 (PDT)
From:   Yongsheng Yang <iyysheng@gmail.com>
To:     linux@roeck-us.net
Cc:     corbet@lwn.net, iyysheng@gmail.com, jdelvare@suse.com,
        linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/hwmon: Fix description of devm_hwmon_device_unregister()
Date:   Mon, 12 Jun 2023 05:42:46 +0400
Message-ID: <20230612014246.1394-1-iyysheng@gmail.com>
X-Mailer: git-send-email 2.41.0.windows.1
In-Reply-To: <e605a8d8-4f40-447d-8238-eccb7e22342a@roeck-us.net>
References: <e605a8d8-4f40-447d-8238-eccb7e22342a@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> On Fri, Jun 09, 2023 at 11:55:10AM +0400, Yongsheng Yang wrote:
> > Use devm_hwmon_device_register_with_info to replace
> > hwmon_device_register_with_info in description of
> > devm_hwmon_device_unregister.
> > 
> 
> You didn't add () to function names, but I guess it is better to do that
> in a separate patch anyway.
> 
> Applied.
> 
> Thanks,
> Guenter
> 
Ok, I just add () to function names in commit message title. I will add
() to function names releate in the whole commit message. Then I will
post the updated version.

Thanks

Yongsheng
> > Signed-off-by: Yongsheng Yang <iyysheng@gmail.com>
> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > ---
> >  Documentation/hwmon/hwmon-kernel-api.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
> > index c2d1e0299d8d..6cacf7daf25c 100644
> > --- a/Documentation/hwmon/hwmon-kernel-api.rst
> > +++ b/Documentation/hwmon/hwmon-kernel-api.rst
> > @@ -66,7 +66,7 @@ hwmon_device_register_with_info.
> >  
> >  devm_hwmon_device_unregister does not normally have to be called. It is only
> >  needed for error handling, and only needed if the driver probe fails after
> > -the call to hwmon_device_register_with_info and if the automatic (device
> > +the call to devm_hwmon_device_register_with_info and if the automatic (device
> >  managed) removal would be too late.
> >  
> >  All supported hwmon device registration functions only accept valid device

