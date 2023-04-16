Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D20C77B73
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Apr 2023 14:49:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjDPOtQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Apr 2023 10:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjDPOtP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Apr 2023 10:49:15 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76B8A4
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Apr 2023 07:49:14 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7606d948295so58237539f.3
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Apr 2023 07:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681656554; x=1684248554;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LXdwd9Z6xsYo+zOZ1MD918NWhWwbfIEB33DLJVT4cnU=;
        b=sPiVVS6LtmbgM/55jmLR+A8u4mmi1lD7H4ini9c63eWcTvoVRvOltDRYp8+mX2G+F6
         08W2CnO4Z3/4Gco3HJczira4ACbuJ3ExbrR9UXfzg48lUiVx8c69kRld0rnnyduEkIYp
         Aa7X7MOAWCFmxn9DbHcEs2LOWRBoKAkPf8WmCNtiRp41fn7qFXYCIIyY4ykoGX/Qp19C
         a6lfBeTnONAJGk+ylWz48esjI7ydnRbeG0jOBjR6Qx6Pczr3buoeSrptKDYw9NJ0udHi
         y0m1ejS88cmhbiu6F07KQ/EfqyNxv5VFhqeXp6OVA5BUuo8xJRlH3xTVUBuUXEN6/F4E
         Y80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681656554; x=1684248554;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXdwd9Z6xsYo+zOZ1MD918NWhWwbfIEB33DLJVT4cnU=;
        b=HCpuVcg8EFznCDD4JU8dDwWaEWk2hlKfwNa/6pn9vgTh/I2qGeEL2spbMhCQuqQSaE
         X1ivT9thhDpEoIrwaWrDqVjqML2lPiB6wrRzGO8d2N7umKdvUtmHDjStakwog6nyH7v8
         inlo7zIvbsVhdGDTgig/TxeJ8vOkTsKJhGx91Qo+cgAw6iAh63M1z85BM2yr4uDU08Nd
         LgwlIIqmu7ogLtNS9G0HcQPCGjtYQYw1fZihLz3hdEy/E1HyyLC6Zf8Y5KAXyp1sRIlU
         XZGrdBpJiT93J8bSoyg7W+ySm32JlgGYhVxz2OtnJJKN3s7olz9cPdVAgDQm2Tsf70Af
         UfPw==
X-Gm-Message-State: AAQBX9ciO6ymkMl0Qynq9G1ceuQkq4Q56dk2Q4/tRVJcGwLG969mucjd
        VOM1VMc9+7b1L7sojLwACrWZ/Q8XsQE=
X-Google-Smtp-Source: AKy350YtSIQDse9oF1cbH3hoblux3mFidvC2qhBMy4X7IwGl3/gE8/at2xg+1t/Mps2OloQTrTbagQ==
X-Received: by 2002:a92:bf0b:0:b0:325:bb3d:4f7 with SMTP id z11-20020a92bf0b000000b00325bb3d04f7mr6633640ilh.1.1681656554191;
        Sun, 16 Apr 2023 07:49:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j3-20020a92c203000000b0032ac75019c6sm1307787ilo.50.2023.04.16.07.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 07:49:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 16 Apr 2023 07:49:12 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (it87) Test for error in it87_update_device
Message-ID: <5d965c73-a95a-40e5-b0a1-b72d665422a8@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 16, 2023 at 02:25:08PM +1000, Frank Crawford wrote:
> Handle errors from it87_update_device(), which currently only occurs if
> SMBus access locking fails.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---

Applied.

Thanks,
Guenter
