Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41039 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752559AbcKSRcA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Nov 2016 12:32:00 -0500
Date: Sat, 19 Nov 2016 09:31:57 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <michael@walle.cc>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC,1/2] hwmon: adt7411: update to new hwmon registration API
Message-ID: <20161119173157.GA26337@roeck-us.net>
References: <1476438215-6654-1-git-send-email-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476438215-6654-1-git-send-email-michael@walle.cc>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Oct 14, 2016 at 11:43:34AM +0200, Michael Walle wrote:
> This is also a preparation for to support more properties like min, max and
> alarm.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Passed my unit test. Applied to -next.

Thanks,
Guenter
