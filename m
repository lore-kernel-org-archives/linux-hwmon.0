Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65469C001B0
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Aug 2023 07:33:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbjHNHc7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Aug 2023 03:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234225AbjHNHco (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Aug 2023 03:32:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EE210DD
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Aug 2023 00:32:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 04DD362FE1
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Aug 2023 07:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87632C433C9;
        Mon, 14 Aug 2023 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691998357;
        bh=5tA3xTayC8ofbt1Rb24vV70E/QCmVN/BXD/kCaTHfuc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fohFUl3QfAhgPZDZC8jbcrTTT59FWOqDynSPmEtk2LaR61vCltpk+Exliz6sB1UKS
         lUCGwr0uP4loKvFD2eHcwUgWdtGl6e/5EPxDUQg9wlhN9cQlqFZmFHeoxqJbfN64O4
         uSObZvla5mWvaol8O5BAqPZfd0F9gspIVYZIaYbD7OydFOYlZiXmNFHQfBxTrgeNaZ
         vtvoEYKXaRptEMnQ989rh2lgDRSTsVazK6JjAapIona18qAC8AylP8nrn5Aqp3UBir
         yuKEVj2RUuli0a/ONJbdX8ZlQj8Ta00FqoeRMSX/cLyAvBMgO6xyAJCL7NpXmMBVcK
         AialSiRgF5Ksg==
Message-ID: <c17c144f-d455-76bb-9b84-e4a392bccb58@kernel.org>
Date:   Mon, 14 Aug 2023 09:32:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 2/2] dt-bindings: hwmon: add adi,ltc4271
Content-Language: en-US
To:     Lothar Felten <lothar.felten@gmail.com>,
        linux-hwmon@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux@roeck-us.net, jdelvare@suse.com
References: <20230811083222.15978-1-lothar.felten@gmail.com>
 <20230811083222.15978-2-lothar.felten@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230811083222.15978-2-lothar.felten@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/08/2023 10:32, Lothar Felten wrote:
> Add dt-bindings for Analog Devices LTC4271 PoE PSE.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> ---
>  .../bindings/hwmon/adi,ltc4271.example.dts    | 28 ++++++++++

No, there are no such files.

And standard boilerplate:

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by
automated tooling. Performing review on untested code might be a waste
of time, thus I will skip this patch entirely till you follow the
process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.


Best regards,
Krzysztof

