Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from smtprelay0231.hostedemail.com ([216.40.44.231]:55731 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932514AbeFUOsn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Jun 2018 10:48:43 -0400
Message-ID: <8f9c37fd13abe2596521afb5d2779f644c214a93.camel@perches.com>
Subject: Re: [PATCH v2 2/2] hwmon: npcm750: add NPCM7xx PWM and Fan driver
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Guenter Roeck <linux@roeck-us.net>,
        Tomer Maimon <tmaimon77@gmail.com>,
        cocci <cocci@systeme.lip6.fr>, robh+dt@kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com, avifishman70@gmail.com,
        yuenn@google.com, brendanhiggins@google.com, venture@google.com,
        joel@jms.id.au, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        openbmc@lists.ozlabs.org
Date: Thu, 21 Jun 2018 07:48:38 -0700
In-Reply-To: <alpine.DEB.2.20.1806211515060.3774@hadrien>
References: <20180619105352.97181-1-tmaimon77@gmail.com>
         <20180619105352.97181-3-tmaimon77@gmail.com>
         <20180620164853.GA3459@roeck-us.net>
         <a6a5a21236c37cfc63329e54248d941bf6d49e3c.camel@perches.com>
         <alpine.DEB.2.20.1806211515060.3774@hadrien>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, 2018-06-21 at 15:17 +0200, Julia Lawall wrote:
> On Wed, 20 Jun 2018, Joe Perches wrote:
> > Also, spatch (1.0.4) seems to have a defect for this
> > when the type is used in operations that change a
> > smaller type to int or unsigned int.
> > 
> > i.e.: (offset is u16, but offset * 2 is int)
> 
> Ah.  The rule is that the result type is always the larger one?

Yes, but not quite, no.

The c90 rules are called "integer promotions" and are
detailed in section 6.3 Conversions

Basically, if any type is smaller than int, all operations
are done as int if possible, or unsigned int if necessary.
If any type is larger than int, then the larger type is used.

If you don't have the c90 standard, this one is close enough.
http://c0x.coding-guidelines.com/6.3.html
(use the next button several times to read the whole section)

Also, section 6.5 details "expressions" where the operands 
of things like bit operations use integer promotions.

> Unfortunately, Coccinelle doesn't know the size of any type.  I could add
> some special cases, but that may be more confusing than helpful.

Maybe, but when I saw the suggested removal, I was surprised.
