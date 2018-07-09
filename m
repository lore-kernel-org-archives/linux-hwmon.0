Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:46240 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750846AbeGIGp7 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 9 Jul 2018 02:45:59 -0400
Message-ID: <812fa319f619c520dff80e38dec47047a7bf33db.camel@kernel.crashing.org>
Subject: Re: hwmon driver with misc interface
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 09 Jul 2018 16:45:35 +1000
In-Reply-To: <023a4783-4625-e6b4-0baf-70292321a71b@roeck-us.net>
References: <66a551332b9a458de4ca2f6ed2ee70219179e43e.camel@kernel.crashing.org>
         <c7998d0de444f6b972de2a0a366d509f3e52b639.camel@kernel.crashing.org>
         <9f887b7c-2b6a-1a35-474f-1c83e488dde3@roeck-us.net>
         <0351089598dd12fa9b75a3725cd3c5faa1198f6d.camel@kernel.crashing.org>
         <34ddef1a-3ffa-eb06-65a0-3e1f2b6d4f16@roeck-us.net>
         <03df865c7b351a11b4985c24646423cce2694c53.camel@kernel.crashing.org>
         <023a4783-4625-e6b4-0baf-70292321a71b@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, 2018-07-08 at 23:37 -0700, Guenter Roeck wrote:
> On 07/08/2018 11:04 PM, Benjamin Herrenschmidt wrote:
> 
> > > Another option would be to handle it through regmap; That nowadays
> > > supports custom accesses implemented in the parent driver (see regmap_read
> > > and regmap_write in struct regmap_config). The child driver gets the
> > > regmap pointer and uses the regmap API. I don't see that as messy.
> > 
> > That works for purely MMIO based things, this isn't though.
> > 
> 
> Sorry, I meant reg_read and reg_write callbacks in struct regmap_config.
> I don't think those callbacks are limited to mmio; I find many other
> access types by browsing through code providing those callbacks.
> 
> Sure, one could consider regmap to be another bloat, but I find it to
> be a quite convenient abstraction layer.

It has been for some things. We use it in some of our drivers.

In the specific case of OCC, it's a bit more complex, we need to send
potentially fairly large "commands" to the SBE via the sbefifo driver
and receive the corresponding response in a buffer, so we have an API
between the drivers, which works well.

Cheers,
Ben.
