Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0489EB64D8
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Jun 2023 14:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbjFVOAn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Jun 2023 10:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbjFVOAf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Jun 2023 10:00:35 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D709B1997;
        Thu, 22 Jun 2023 07:00:30 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-25ee8d84b4fso4025787a91.0;
        Thu, 22 Jun 2023 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687442430; x=1690034430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3eMVjJvpx/pj5Qe3y/xCl40KgqyxPxDqNSCbKfAoC8I=;
        b=l4RpUpQXjQBkvW3xdDjh1r9DzOGsw7X35myG5WgLrDaz5WWqc8H2qGPYzCLjDzamKj
         iJaKr3pA230lkIrOyYU/WLYEkGgJHozpkW/eoGAgpXKD7HdmugLbjRhwqiMcM8rEDrW3
         4PuayKQDgW2/PbPAznkrwM+d5c+0/vtQ5NdqaeqNo6cOAH9JFzgidmtGXZ8tfcXMtA6o
         k5oMULAIBxRVOoEPplfNeQwhh6tzd+43bydLRnFaxIZTZTwa3088hqocVtdO7Kn8j5in
         w40CmxmBfY/rzxDaS20oX5jFXPkmA484+gVsmTQ/Zd7ZsigdCRVuARNwdTrmXeoFPEOj
         8OCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687442430; x=1690034430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eMVjJvpx/pj5Qe3y/xCl40KgqyxPxDqNSCbKfAoC8I=;
        b=FElLEOj7OgHgpAiOJZyZycaQhGbzrvRutI2qsDMYIarzEo4npQu3VXEq28kN7W5bMk
         8zfisB8eL44UTO3rU020xP7kFW73C+woiT5UtVmAAs1OlcbEbeLulTHH8x6IxpL5J1Tw
         PhHOLYia7N6YfywuKJfg0Jq1PEVKf5Ly3PGgBeVSxEl7HJzw5HfnJqiGKbk+eedDGZZz
         DmerR7MITAk6FCE8S1L/sCvIuMOwsIdmSh0FPWR82bDs9jFp6uJm0W0Gjaoxal9YgskL
         Ef7s0MzVO4QBa9Y/uaaAY9/2gv8ZFuKJH2AatU8oxaUtd9/hEZZxfsKPgYRV9pfTWWSa
         sI0g==
X-Gm-Message-State: AC+VfDwwrOC/vjuvXxIF5B6AOxgSv9OWxtx//LKTRTKgRcwH3hSqtplZ
        lMkegaHl8DRbrQ2lN/ApcfSlZFzm9bY=
X-Google-Smtp-Source: ACHHUZ6IFaAgmeO+0ot+/Tb9cRtXQOQftrudMGFIfDPHG6LKkdrL36JbemAimyxZldtgMbpkGUPDPA==
X-Received: by 2002:a17:90a:a386:b0:261:875:c2be with SMTP id x6-20020a17090aa38600b002610875c2bemr3245801pjp.29.1687442430247;
        Thu, 22 Jun 2023 07:00:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gq17-20020a17090b105100b00260e7c2cedesm3237960pjb.57.2023.06.22.07.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 07:00:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <75153707-e115-d6f8-0f47-ac678aebedd4@roeck-us.net>
Date:   Thu, 22 Jun 2023 07:00:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] hwmon: corsair-psu: add support for reading PWM values
 and mode
Content-Language: en-US
To:     Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        linux-kernel@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org
References: <ZJP8oSMHCorq9Nql@monster.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ZJP8oSMHCorq9Nql@monster.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/22/23 00:47, Wilken Gottwalt wrote:
> Also updates the documentation and comments accordingly. Fixes several
> typos and updates the coding style to be more uniform.
> 
> Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>

I don't mind minor cleanups combined with functional changes, but this is
too much. Please split into two patches.

Thanks,
Guenter

