Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.redfish-solutions.com ([66.232.79.143]:43852 "EHLO
        mail.redfish-solutions.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750820AbdFOWus (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Jun 2017 18:50:48 -0400
From: Philip Prindeville <philipp_subx@redfish-solutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Question about nct6775 and w83627ehf
Message-Id: <48F7D8C9-21F9-4439-9069-34C05FBCF6A7@redfish-solutions.com>
Date: Thu, 15 Jun 2017 16:34:45 -0600
Cc: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi.

I’m working on a platform that uses the nct6775, and if I load a generic “everything and the kitchen since” kernel on it, then the w83627ehf module ends up claiming the nct6775 chipset.

My understanding was that the nct6775 driver supplants the w83627ehf for supporting the nct6775/6.

But if that’s the case, shouldn’t ec3e5a16446fef1891611fe3bdfa5954d1ddf5e4 have been partially backed out?

Well, there would have been a few others, too, I guess:

d42e869acf0da4502c452b786dee35f0ecf4cbc8

ad77c3e1808f07fa70f707b1c92a683b7c7d3f85

585c0fd8216e0c9f98e2434092af7ec0f999522d

33fa9b620409edfc71aa6cf01a51f990fbe46ab8

What’s the chance of the nct6775 stuff all getting scrubbed out?

Thanks,

-Philip

