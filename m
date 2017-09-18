Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36754 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750711AbdIRVL1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2017 17:11:27 -0400
Date: Mon, 18 Sep 2017 16:11:24 -0500
From: Rob Herring <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alan Tull <atull@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/2] hwmon: add dt binding for max1619
Message-ID: <20170918211124.jvvl75mznwf3n6sk@rob-hp-laptop>
References: <20170911191649.3344-1-atull@kernel.org>
 <20170911191649.3344-2-atull@kernel.org>
 <20170911195857.GB2580@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170911195857.GB2580@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 11, 2017 at 12:58:57PM -0700, Guenter Roeck wrote:
> On Mon, Sep 11, 2017 at 02:16:49PM -0500, Alan Tull wrote:
> > Add new device tree binding for max1619.
> > 
> > Signed-off-by: Alan Tull <atull@kernel.org>
> 
> Technically that should already work, without explicit binding,
> or did the i2c core change lately ?

There was some work in that direction IIRC.

We don't really want to rely on that behavior and should have DT match 
strings.

Rob
