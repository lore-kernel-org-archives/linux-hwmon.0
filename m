Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2027C7EE26
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 May 2023 17:47:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjESRrZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 May 2023 13:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjESRrY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 May 2023 13:47:24 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB7793
        for <linux-hwmon@vger.kernel.org>; Fri, 19 May 2023 10:47:23 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-64d3fdcadb8so338483b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 19 May 2023 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684518443; x=1687110443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Amov5Aoo7acM+9VPbYYQdK+Rhvj5n+TGJlGSdsz4608=;
        b=cAJRa6cDc1phXlHf1NpZAyXeJ8zGMEKe6FYx/Kzc5P53OTdmrEgZ2tEbCyWSBnJ0UR
         EV75rB8oeOdoy0cI5IPHa/ZIh6ti2PzjtCoO7QD2gIEM6sQwZsjT3ZyRnjtMzAS7ww6F
         kLq7HHtI/CL1UOn6A0w3UF6YewS/dZm54Zv/60ZPmsQVfSnjsdqSnbCiv+vXHlKWU1vF
         1RyliyVvvP8TsBkt/eyPGqEScbXM/MYXNgCWbx7S3/vpKyPa5FHI7ZSkjKR0RaCsLDNu
         buYIZwnimVixZwfw2YOznbrfL65uBgWpM0l6JjTV81y4VQjZIrMMZw9j6FXowKD0DLqQ
         0xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684518443; x=1687110443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Amov5Aoo7acM+9VPbYYQdK+Rhvj5n+TGJlGSdsz4608=;
        b=MadXYnKbOHpnMLFy7Smuh6n6pfcRF1G3PkGcFycoXsS4K25xpn/H/9Xt3jy0LyLjkY
         T7q0dJHI8PlLSEtyf49nZSFouYTz1ri2KiicRWfCcoeCOmlXd3m9YTO4E8JoJ9bFRSjk
         0AcPgmRbkW9nO+Id8X7DSbVJXccdU7ceBmJiEth1AT4cj/acYeofaERcilVVfzMkfqjr
         /FNAwC5PUT7WIt79qIACI9BF82rEnhr7qmMBDbOZA5bv+Vrn29T+GQRtVgGdYs/4h8Cp
         VCjW1CN0BCghQpm1IuFs5Kz09LhGDT/4+r5JxMXrPo1KWjIvEpLQJ0z429f583w3Stmp
         R6fw==
X-Gm-Message-State: AC+VfDzikeQPxkZXi0AAf5i/1jdol6DrL78fbkLtpStZq/pyw8s7BbuG
        JQk6CATSeb1HomPeNoYsPJQ=
X-Google-Smtp-Source: ACHHUZ7fjJ9g37wDogwWT2T0VB+CAvpSqeNWjtnVz3p0jaQjWb5bV2hpw5KQbHZ0+85vL42/TYc0BQ==
X-Received: by 2002:a05:6a00:1505:b0:64d:2ea4:9377 with SMTP id q5-20020a056a00150500b0064d2ea49377mr4938770pfu.14.1684518443117;
        Fri, 19 May 2023 10:47:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a26-20020aa7865a000000b0063b85893633sm3244174pfo.197.2023.05.19.10.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:47:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 19 May 2023 10:47:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     jurgenacc@tutanota.com
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: ASRock B650E Taichi support
Message-ID: <21fd227e-337b-4d87-a84a-d1bb9bea4110@roeck-us.net>
References: <NUjvz8u--3-9@tutanota.com>
 <5704a3ac-3097-74d5-e5a7-993fcd78a1e7@roeck-us.net>
 <NVUpwQa--3-9@tutanota.com>
 <94fd7588-dd3a-4530-bfe8-a213b68dfc33@roeck-us.net>
 <NVoIkKr--3-9@tutanota.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <NVoIkKr--3-9@tutanota.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 19, 2023 at 03:59:34PM +0200, jurgenacc@tutanota.com wrote:
> Hi,
> 
> Loading the nct6683 did not give an error. However the sensors-detect gives the same output "Sorry, no sensors were detected."
> 
??? The sensors-detect command and kernel drivers have no relationship
to each other.

Question is if you see any sensors after loading the nct6683 driver.

Guenter
