Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3B7C46467
	for <linux-hwmon@archiver.kernel.org>; Sat,  7 Jan 2023 18:38:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbjAGSij (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 7 Jan 2023 13:38:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjAGSij (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 7 Jan 2023 13:38:39 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B16C45641
        for <linux-hwmon@vger.kernel.org>; Sat,  7 Jan 2023 10:38:38 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id v30so6599825edb.9
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Jan 2023 10:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSDH2EupTOrpEz9CCZUJ3Zv24Eo4wJFRMafxgvePobs=;
        b=nacmK0iYUbBq9daO8Uw4P/9Lbmyx4BWsH1WQIXARTsJXsXIB2DYsxG3Bw0TeW+1pqm
         jjR35rLGdLJEuv3Pb3pYWugWt95RIqNwZTqUBQ6C+v6Ltvr6oD1HqvInoMg7NlKTbbW9
         mLPdA+1eVkIJkrC1A1HXNXaotDgaLNFBaMLVhChUNFC6lshb+llH7vkQ+FNYW2hmR5rO
         mB4vjz7c63/Zn4IR4khu8hRlzLPUoJ3oxgN8Lw2BFzfHPr+pjlWpmHsh8KpgVwU97rMs
         k8b12huBAGqUKac0In5Q42uvqZ3/8nNY3T02/G6XnLoz928ClE34TW1hbJ6M3uEZgtcm
         rq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSDH2EupTOrpEz9CCZUJ3Zv24Eo4wJFRMafxgvePobs=;
        b=W0JEObsY2hn0XeUXCxexwOy6SBQmklq/IY9BmjUe6lK9h6lUph6+nzDIWustvm1Sxj
         vFeboP1IMzM7w2gkO+zxSUKJVDR0Pb5SoB3trMf26itke4tbfeTO1Bi1+B6GIqyhsIvj
         GHPtS8/KG0X/1ZlPit81MIzjsf0jW4778wnXH5BP0cXrCtJZ2TYUXStjQmgBvR2usYTu
         5QksqDulaWtB3Pi+zqGZDbHKDO5BOH2rEFU1Gb+vWrpkjfyXhEKN+UZFg9utOr5MO4YQ
         Wh4Lov9IYTZz8plblIiO5yZWeBcbO5ru7q0QRqoqRkZcQGxxX7Dg74nhMLMHS1zVGxZD
         QWLA==
X-Gm-Message-State: AFqh2kr3i7kGpo9bItqgVqV109Mywb1nMBZVt0TfvdH/P2u5+KrcE2Zy
        vZTS+tTU57Dm2VTOyMM9edT/3572HdypnQ==
X-Google-Smtp-Source: AMrXdXvBsuzRR1ev3sV+ROLwfTexOiIL0qOi+6vs5iVV+me7sy6hBAc2TIg7ZsNPtLK2n+Y8C6Vukw==
X-Received: by 2002:a05:6402:538f:b0:47c:4479:d60d with SMTP id ew15-20020a056402538f00b0047c4479d60dmr50379108edb.20.1673116716698;
        Sat, 07 Jan 2023 10:38:36 -0800 (PST)
Received: from localhost.localdomain ([46.211.83.22])
        by smtp.googlemail.com with ESMTPSA id t32-20020a056402242000b0049148f6461dsm1704943eda.65.2023.01.07.10.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 10:38:36 -0800 (PST)
From:   Denis Pauk <pauk.denis@gmail.com>
To:     sebastian.arnhold@posteo.de
Cc:     ahmad@khalifa.ws, chunkeey@gmail.com, linux-hwmon@vger.kernel.org,
        linux@roeck-us.net, jdelvare@suse.com, jeroen@beerstra.org,
        sst@poczta.fm, pauk.denis@gmail.com
Subject: Re: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
Date:   Sat,  7 Jan 2023 20:37:39 +0200
Message-Id: <20230107183739.2101-1-pauk.denis@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <767c4090-007c-a819-e047-11971ea9cc17@posteo.de>
References: <767c4090-007c-a819-e047-11971ea9cc17@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

Jeroen Beerstra and Slawomir Stepien have tested ASUS boards with nct6799d
chip.

I have merged your patch with rewrited wmi access patch and attached to
https://bugzilla.kernel.org/show_bug.cgi?id=204807#c281

I will send patches with updated wmi code after feedbacks from 204807
receipients.

Best regards,
             Denis.
