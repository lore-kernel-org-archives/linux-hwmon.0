Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E8EC001DC
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 19:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbjGST4m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jul 2023 15:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjGST4k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2023 15:56:40 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFE81FCE
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 12:56:39 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3489cd4e3d3so573025ab.3
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 12:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689796599; x=1692388599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4c9BYht6W0xo9yWV0Wo82xIVTwuDUqE6OWikvH4V2Bg=;
        b=VmSrq39Zz+3zpJ9j1QdLxG6Mh+BTB610qP/pl0hQ58PYfE7tsdKV9c8lqmlyzU88Ne
         fgUeejfz8aoEc5NzqhqMjyb4w5J1wdtAEW01EICgKXauMOIH6T+J4lxLpg8Y/1ZfHGmV
         A4AwDHtbfqJBBkN7dfmCkvX3tyZswl0y+P9d+d2rCyn7V6URHvLGnMYwX6+jqad2/lRb
         RNVGKAiLrWDl6UjY9X7nVJifKmcKPSUzCic/k/G2ReUnDS/6cWVuJo7y1GAbnpIOjC5t
         nXEj/qIflWBANo8BpDld6K+NX+3xwa+U/fIeW4Np6bELw9BRepzcQrOJt8dwhDEPNpYw
         Sn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689796599; x=1692388599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4c9BYht6W0xo9yWV0Wo82xIVTwuDUqE6OWikvH4V2Bg=;
        b=PRgMp0KcweYsgDQz5GXGcKnICZqprXgQpMhIxEr5Ym6GLYYtQbiqNEHPwxriR00Pki
         NnG+FD1jvEnUhIpMtO1Mg6gR7wdGXJtAwvhZKWrQn7oK9Us1efLe+COfmH6IUGAklBn4
         mtuNal1kcmvtHX0Hp28i4KmtuBb/CdXnKyU9ljxf6Nl3ZgX45AIJS3rcY5QuzQqh+5+s
         7ZQIjVLC4UvxbIa0YikucjxahdploydJu46Dihv1tjOo5eL6bvqg82qEHih686uZp2vs
         QQ83bNYG+682Nw/7jScu3FNlwdhugYEzOXBoroggkVU+QBDYaFpdRqzsALsU+4Mmm460
         qCFQ==
X-Gm-Message-State: ABy/qLbHqHTfjcA0ccHP1QjiNIFdAg1CgD48svskzDaj1UIAQz0cUVcD
        SlM1Qgn5ROBgkaoTy/rTkbkQTrQW/b4=
X-Google-Smtp-Source: APBJJlHPY6JDG2reSWL5BDeLZXNHzeEznYbPin04erqB6a5kIzAUI9StclKn0QSrPp+rjipBn6jB1Q==
X-Received: by 2002:a92:dac2:0:b0:348:7d72:86f4 with SMTP id o2-20020a92dac2000000b003487d7286f4mr2874122ilq.31.1689796598709;
        Wed, 19 Jul 2023 12:56:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902c14400b001b9bebb7a9dsm4378971plj.90.2023.07.19.12.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:56:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 19 Jul 2023 12:56:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Fix IN scaling factors for 6798/6799
Message-ID: <e0be344f-85c3-4ff4-996e-043af0e7675e@roeck-us.net>
References: <20230719192848.337508-1-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719192848.337508-1-ahmad@khalifa.ws>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jul 19, 2023 at 08:28:48PM +0100, Ahmad Khalifa wrote:
> Scaling for VTT/VIN5/VIN6 registers were based on prior chips
> * Split scaling factors for 6798/6799 and assign at probe()
> * Pass them through driver data to sysfs functions
> 
> Tested on nct6799 with old/new input/min/max
> 
> Fixes: 0599682b826f ("hwmon: (nct6775) Add support for NCT6798D")
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>

Applied.

Thanks,
Guenter
