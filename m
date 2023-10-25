Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591ABC07545
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Oct 2023 14:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344622AbjJYOTg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Oct 2023 10:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344639AbjJYOTf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Oct 2023 10:19:35 -0400
X-Greylist: delayed 347 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 25 Oct 2023 07:19:33 PDT
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD7F99
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 07:19:33 -0700 (PDT)
Date:   Wed, 25 Oct 2023 16:13:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1698243224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RuY2yDHrXKAvuateilio+Ihipw+6+Lq+kqIuX9eZkgc=;
        b=xqXXrruYY3CMsVHk0QotQ+7a99KNMvVrS2E6GyvvHA86+kfOC8D2FFhXQzg8ZnU5gwofKY
        Wg/wyazmFAnQ7L78sYju1lHjzVVZB+oswcb0jXNAM2xrU1Vi65BpohWpNXxnR/t+4tNjHD
        EhvN6StwHVGrQkK0AeckCMZ+nZKBmTo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Richard Leitner <richard.leitner@linux.dev>
To:     Conor Dooley <conor@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: hwmon: ti,ina238: add ti,ina237
Message-ID: <pwfj54krrau3rihjb73dd4p3yizzjyuv4gwxky776m2goerjw6@6rfxo6kzjhjs>
References: <20231025-ina237-v1-0-a0196119720c@linux.dev>
 <20231025-ina237-v1-4-a0196119720c@linux.dev>
 <20231025-unclip-ion-826a58681a12@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025-unclip-ion-826a58681a12@spud>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Oct 25, 2023 at 02:58:44PM +0100, Conor Dooley wrote:
> On Wed, Oct 25, 2023 at 10:34:14AM +0000, Richard Leitner wrote:
> > Add ti,ina237 binding to ti,ina238 as they share the same driver.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  Documentation/devicetree/bindings/hwmon/ti,ina238.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina238.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina238.yaml
> > index aba89e5f34b3..17408076696c 100644
> > --- a/Documentation/devicetree/bindings/hwmon/ti,ina238.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/ti,ina238.yaml
> > @@ -22,6 +22,7 @@ description: |
> >  properties:
> >    compatible:
> >      enum:
> > +      - ti,ina237
> 
> The driver patch you have done implies no difference between the
> programming model for both of these devices. It'd seem to make more sense
> for the ina237 to fall back to the ina238, thereby requiring no change in
> the driver to support it.

Thanks for the quick feedback, Conor.

I first thought of just mentioning the ina237 in the documentation as
"compatible" to the ina238. But IMHO it is better understandable if it's
listed as compatible.

And I would strongly encourage mentioning it somewhere (documentation or
compatible). So other people using the ina237 are able to find it and
don't have to compare the datasheets by themselves to find the right
driver.

> 
> Cheers,
> Conor.
> 
> >        - ti,ina238
> >  
> >    reg:
> > 
> > -- 
> > 2.40.1
> > 


