USE [z_UR_Expose_VEC]
GO
CREATE NONCLUSTERED INDEX [demogrphlog_intid_idx] ON dbo.Demographic_Log
([Internal_ID] )

CREATE NONCLUSTERED INDEX [wages_intid_idx] ON [dbo].[VEC_wages] 
([Internal_ID] )

