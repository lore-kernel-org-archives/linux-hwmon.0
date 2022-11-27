Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34911C4321E
	for <linux-hwmon@archiver.kernel.org>; Sun, 27 Nov 2022 12:39:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiK0MjW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 27 Nov 2022 07:39:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiK0MjV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Nov 2022 07:39:21 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B7D65AC
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Nov 2022 04:39:21 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id a7so10158405ljq.12
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Nov 2022 04:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bCvA4bJIjxvckaO4QwurkMyedRWRlb5qMNtGGo4ItcM=;
        b=vxLSPc/FZF0Zn81dN/BrfpSs4a+ESJdy1nKi1TeXvSOXXLPGb7vZDsubMyu0tE16gp
         FSpuUIGHZPP8AORPHtoicY9TGqQxQZNqNlYy3aCvxEKxitJObUU3K8JN6KSrjpusl/cG
         ZpIpH5sOrbjVE8/MBfXTAbfzz/jQr/rTpqAqu5PjeoG6ZiVbKP59qEky71L1iBpDOQ9N
         OjG6aUzcfMmiEygAKGegJAvZ24qOSz/AId51UZUVBberWSgquYrNFL6DlAfhHD/TCPLk
         3kgv/UXciMLABMwz9UA1w31Jd/W2hEkWeOKm0Y4IloIb6xG599djXOa5ITB6Km8/y2fK
         pIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bCvA4bJIjxvckaO4QwurkMyedRWRlb5qMNtGGo4ItcM=;
        b=BRQ9+xKozcAxrrHe3sLWwGr/i+2uDdYTkjsbadwG6AOMfmCyeClpJN2NgzEoUreaRJ
         XzDDxN5p0iOP7uoVrYmGXNU263C5azeXp3f2DnDIewwox8JiM9jUm+UKmOYwi2kCDm2E
         OIjiyM54eU8m7TOv89er06T08SI8ix3L03pNAnu8suCBvDttlonVsR7Ha/WAxWW71w53
         uFZp7MvheuGZ7l505LAVz0iXOxxMEWMRQDRFJv63tXVulwVTkIGgYdNUNl3uJQu3H9IR
         bshwaUXnBWXTux4SmDOwy2GAAR9L/egAupxX56UwJS/YBuSERtm3WMs9y5ZwdyD41o1E
         VALw==
X-Gm-Message-State: ANoB5pnAXo6c+LnUcOSZmmzUjkW+2B1S4Ci4ALJ/n8C2mFWGn1MSTOci
        yJ+HxRq7Tyn33bW02rCPmQNxQKicMcTNA4Mc
X-Google-Smtp-Source: AA0mqf5c72b6sM8zIGIsLv5/xZtFy+TVa84ZGgdMNz4s1p5W7R5Efk86C1dfwU9zJgJjFCVJrlajmg==
X-Received: by 2002:a2e:3806:0:b0:277:b84:81b6 with SMTP id f6-20020a2e3806000000b002770b8481b6mr14298868lja.425.1669552759497;
        Sun, 27 Nov 2022 04:39:19 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e10-20020a05651236ca00b004991437990esm1299938lfs.11.2022.11.27.04.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 04:39:18 -0800 (PST)
Message-ID: <687999c8-ab01-71d1-e21c-9c2dce3d95ba@linaro.org>
Date:   Sun, 27 Nov 2022 13:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/3] dt-bindings: hwmon/pmbus: Add mps,mpq7932
 power-management IC
Content-Language: en-US
To:     Saravanan Sekar <saravanan@linumiz.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org
References: <20221126171711.1078309-1-saravanan@linumiz.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221126171711.1078309-1-saravanan@linumiz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/11/2022 18:17, Saravanan Sekar wrote:
> Add bindings for mps,mpq7932 power-management IC
> 
> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
> ---

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Skipping lists to cc skips the tests. That's a no. Especially that you
did not test it yourself...

Best regards,
Krzysztof

