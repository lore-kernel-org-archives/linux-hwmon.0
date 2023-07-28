Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C701DEB64DD
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 Jul 2023 06:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233465AbjG1GuK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 Jul 2023 02:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbjG1Gtz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Jul 2023 02:49:55 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CD835A0
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jul 2023 23:49:49 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fd190065a8so19990855e9.3
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jul 2023 23:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690526988; x=1691131788;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNocJZIscVVvupCUD8NKwKROVK3u209IVEq8pLniQbA=;
        b=SOBfA982SmYW+j+nHnszBR9ZcS66yi1EsHNOFcLrC8B8Lx4baNXtBHmlMMXLAXRXhG
         HP85kEPGnyAzJyXDSJsPZVlpW/EhCffaQHskCjXlvod6Y4d4cOlC6rOLfopYGIfHIV4D
         7swqBd9MQiMZ8Op7/nR7UvdqQn1toqt/R2DG6s1GW/FaToMz6379nqbcgfEveGu3NCi6
         0Xc+mzO43vWoAWDd4MwktjQP2wJ/JNb2koOyL+0pYakuO03Ev6hQcj8/yEl9P1rbN/bJ
         Bc+rzVUV2PvZCJJK0WRYoty2xeruIIOaFWGHgkim2S7VezCkb6uylfCm9T/TLa2ejggd
         RPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690526988; x=1691131788;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pNocJZIscVVvupCUD8NKwKROVK3u209IVEq8pLniQbA=;
        b=ClK0XNdYA0oOmRTHpiYxtB/D/agrqcSaqm55+ju6OoyO/qkops/jL78lXy4G27cZVQ
         3IPZU/M9G2CpF0Fv2QQtXRJfUBLMd3OTIRCO6IBr0/BUDqXBq2kiEIvbzX2HwwK5vbbU
         o9GrkynKh5ojQLuaM/phet4xXudQmA/snqcQ8gRPRpj5o0D+ifKj/C7pRAUOIXqfl/IU
         McAogeePGEbmgHPWpJt1AqjcdE2fl0VXf4ylELg4o7BIaZG2ij2d9DhmzxvqON60DTg6
         gGipeMrQcifhTU72tROU9xNcPxyD9uqIcw0F3d4XipWxbP0i0eVLb3HGrURtGTseOLnm
         lt0A==
X-Gm-Message-State: ABy/qLZ1f2jCtudQdmuC5wqMIKmPeI0GiJQKzdyDkgI8TqPfsFqQ2d6l
        8NiZIdbBOfWvaLDij5x2eLhrU7k5fbg=
X-Google-Smtp-Source: APBJJlGkAOs1OCtVBvNhZF7rn6+XyndCNT+oCduEGxWXSc8oQqaNr/uIEpOc+CvxK7e3cQ+t8TF9bQ==
X-Received: by 2002:a05:600c:acc:b0:3fd:30cb:18bd with SMTP id c12-20020a05600c0acc00b003fd30cb18bdmr1187962wmr.15.1690526988014;
        Thu, 27 Jul 2023 23:49:48 -0700 (PDT)
Received: from daniel-Precision-5530 ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id h14-20020a05600c260e00b003fbca942499sm6366162wma.14.2023.07.27.23.49.47
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 23:49:47 -0700 (PDT)
Date:   Fri, 28 Jul 2023 09:49:45 +0300
From:   Daniel Matyas <daniel.matyas23@gmail.com>
To:     linux-hwmon@vger.kernel.org
Subject: Functional enhancement of max31827
Message-ID: <ZMNlCTsslxeYjj/4@daniel-Precision-5530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dear hwmon community,

I developed the driver for the max31827 temperature sensor, but when
doing so I omitted some functionalities of the chip, namely: PEC Error,
Fault Queue, Comp/Int, Alarm Polarity, Resolution, Timeout and PEC
Enable. I did not implement these, because there are no predefined
attributes in the linux kernel which have similar meaning to these
funcionalities.

I recently got a request from the client to implement these
functionalities. I want to use SENSOR_DEVICE_ATTR to implement these. I
did some reading and saw that using debufs is also a possibility.

I would be really greatful, if you could provide me with some advices.
Should I proceed with device attributes defined by me? Should I use
debufs? Maybe there is another and better way...

Thank you in advance for your response!

Kind regards,
Daniel

Link to driver: https://github.com/torvalds/linux/blob/master/drivers/hwmon/max31827.c
Link to datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf#page=13&zoom=220,-9,487
